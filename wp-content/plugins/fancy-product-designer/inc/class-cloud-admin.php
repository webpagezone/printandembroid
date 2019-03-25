<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if(!class_exists('FPD_Cloud_Admin')) {

	class FPD_Cloud_Admin {

		public function __construct() {

			//WOOCOMMERCE ORDERS

			//print-ready download links in emails
			add_action( 'woocommerce_order_item_meta_end', array(&$this, 'add_order_item_links') , 20, 4 );

			//print-ready files attached into order emails
			add_filter( 'woocommerce_email_attachments', array( &$this, 'woo_email_attachment' ), 10, 3  );
			//remove temp dir for files when mail has sent
			add_action( 'phpmailer_init', array(&$this, 'init_phpmailer'));

			//SHORTCODE ORDERS

			//print-ready download links in emails
			add_action( 'fpd_shortcode_order_mail_message', array(&$this, 'shortcode_order_mail'), 10, 3);
			add_action( 'fpd_shortcode_order_mail_attachments', array(&$this, 'shortcode_order_attachments'), 10, 3);

			//SETTINGS
			add_action( 'radykal_settings_block_start', array(&$this, 'before_ae_settings_block') );
			add_filter( 'radykal_settings_block_css_class', array(&$this, 'radykal_ae_settings_block_css_class'), 10, 2 );

		}

		public function shortcode_order_mail( $message, $order_id, $order_data ) {

			$api_key = fpd_get_option( 'fpd_ae_admin_api_key' );

			if( !empty($api_key) && fpd_get_option('fpd_ae_recipient_admin') && isset($order_data['data']['print_order']) ) {

				$ae_download_url = $this->get_print_file_uri(array(
					'api_key' => $api_key,
					'type' => 'shortcode',
					'order_id' => $order_id,
					'output_file' => fpd_get_option('fpd_ae_output_file')
				));

				$message .= sprintf( __('%s: %s', 'radykal'), FPD_Settings_Labels::get_translation( 'misc', 'automated_export:download' ), esc_url_raw( $ae_download_url ) )."\n";

			}

			return $message;

		}

		public function shortcode_order_attachments( $attachments, $order_id, $order_data ) {

			$api_key = fpd_get_option( 'fpd_ae_admin_api_key' );

			if( !empty($api_key) && fpd_get_option('fpd_ae_recipient_admin') && isset($order_data['data']['print_order']) ) {

				$ae_download_url = $this->get_print_file_uri(array(
					'api_key' => $api_key,
					'type' => 'shortcode',
					'order_id' => $order_id,
					'return_file' => 1,
					'output_file' => fpd_get_option('fpd_ae_output_file')
				));

				$response = fpd_http_post_json( $ae_download_url );

				if( $response && $response->file_url) {

					$file_url = $response->file_url;

					//creare temp directory for storing files to be sent as attachments
					$temp_dir = WP_CONTENT_DIR.'/_fpd_temp_mail/';
					if( !file_exists($temp_dir) )
						wp_mkdir_p( $temp_dir );

					$temp_local_file = $temp_dir.basename($file_url);

					if( file_exists($temp_local_file) )
						unlink($temp_local_file);

					if( fpd_admin_write_file_content( $file_url, $temp_local_file ) )
						$attachments[] = $temp_local_file;

				}

			}

			return $attachments;

		}

		public function add_order_item_links( $item_id, $item, $order, $plain_text=null ) {

			$api_key = fpd_get_option( 'fpd_ae_admin_api_key' );

			if( empty($api_key) || $plain_text )
				return;

			//$product = $order->get_product_from_item( $item );
			//$product->is_downloadable() && $order->is_download_permitted()

			$display_to_admin = ( fpd_get_option('fpd_ae_recipient_admin') && FPD_WC_Index::$sent_to_admin );
			$display_to_customer = ( fpd_get_option('fpd_ae_recipient_customer') &&  ( FPD_WC_Index::$email_id === 'customer_completed_order' || $order->is_paid() ) );

			if( isset($item['_fpd_print_order']) && ($display_to_customer || $display_to_admin) ) {

				$ae_download_url = $this->get_print_file_uri(array(
					'api_key' => $api_key,
					'type' => 'wc',
					'order_id' => $order->get_id(),
					'item_id' => $item_id,
					'output_file' => fpd_get_option('fpd_ae_output_file')
				));

				echo sprintf( '<a href="%s" target="_blank" class="fpd-download-print-ready-file" style="border: 1px solid rgba(0,0,0,0.8); padding: 4px 6px; border-radius: 2px; font-size: 0.85em; color: rgba(0,0,0,0.8); text-decoration: none;">%s</a>', esc_url( $ae_download_url ), FPD_Settings_Labels::get_translation( 'misc', 'automated_export:download' ) );

			}

		}

		public function woo_email_attachment( $attachments, $email_id, $order ) {

			$api_key = get_option( 'fpd_ae_admin_api_key', '' );

			if( empty($api_key) || !fpd_get_option('fpd_ae_email_attachment') )
				return $attachments;

			//check if order has fpd print orders
			$order_has_fpd_print_order = false;
			$order_items = $order->get_items();
			foreach( $order_items as $order_item ) {

				$fpd_print_order = wc_get_order_item_meta( $order_item->get_id(), '_fpd_print_order', true );
				if( !empty($fpd_print_order) ) {
					$order_has_fpd_print_order = true;
					break;
				}

			}

			if( !$order_has_fpd_print_order )
				return $attachments;

			$display_to_admin = ( fpd_get_option('fpd_ae_recipient_admin') && $email_id === 'new_order' );
			$display_to_customer = ( fpd_get_option('fpd_ae_recipient_customer') && ( $email_id === 'customer_completed_order' || $order->is_paid() ) );

			if( $display_to_admin || $display_to_customer ) {

				$ae_download_url = $this->get_print_file_uri(array(
					'api_key' => $api_key,
					'type' => 'wc',
					'return_file' => 1,
					'order_id' => $order->get_id(),
					'output_file' => fpd_get_option('fpd_ae_output_file')
				));

				$response = fpd_http_post_json( $ae_download_url );

				if( $response && $response->file_urls) {

					//creare temp directory for storing files to be sent as attachments
					$temp_dir = WP_CONTENT_DIR.'/_fpd_temp_mail/';
					if( !file_exists($temp_dir) )
						wp_mkdir_p( $temp_dir );

					foreach($response->file_urls as $file_url) {

						$temp_local_file = $temp_dir.basename($file_url);

						if( file_exists($temp_local_file) )
							unlink($temp_local_file);

						if( fpd_admin_write_file_content( $file_url, $temp_local_file ) )
							$attachments[] = $temp_local_file;

					}

				}

			}

			return $attachments;

		}

		public function init_phpmailer( $phpmailer ) {

			$phpmailer->action_function = array(&$this, 'wp_mail_sent');

		}

		public function wp_mail_sent( $is_sent, $to, $cc, $bcc, $subject, $body, $from ) {

			if( file_exists(WP_CONTENT_DIR.'/_fpd_temp_mail/') ) {

				$files = glob(WP_CONTENT_DIR.'/_fpd_temp_mail/'."*");
				$now   = time();

				foreach ($files as $file) {
					if (is_file($file)) {
				    	if ($now - filemtime($file) >= 60 * 3) { // delete files older than 3 mins
				        	unlink($file);
				      	}
					}
				}

			}

		}

		public function before_ae_settings_block( $key ) {

			$api_key = get_option( 'fpd_ae_admin_api_key', '' );

			if( $key == 'ae-general' && empty($api_key) ):
			?>
			<div class="fpd-settings-block-overlay">

				<div class="fpd-overlay-content">
					<h2><?php _e('Mail a print-ready file whenever an order is made to selected recipients.', 'radykal'); ?></h2>
					<p class="description"><?php _e('To unlock the "Automated Export" you <a href="https://admin.fancyproductdesigner.com" target="_blank">need an account in our ADMIN solution and subscribe to the premium plan</a>.', 'radykal'); ?></p>
					<span class="description"><?php _e('The API key can be found in the Site Configurations in the ADMIN solution.', 'radykal'); ?></span>
					<input type="text" class="widefat" placeholder="<?php _e('Enter ADMIN API Key', 'radykal'); ?>" />
					<p><button class="button-primary" id="fpd-unlock-ae"><?php _e('Unlock Automated Export', 'radykal'); ?></button></p>
				</div>

			</div>
			<script type="text/javascript">

				jQuery(document).ready(function() {

					jQuery('#fpd-unlock-ae').click(function(evt) {

						evt.preventDefault();

						var $this = jQuery('#fpd-unlock-ae'),
							apiKey = $this.parent().prev('input').val();

						if(apiKey.length === 0) {
							fpdMessage("<?php _e( 'Please enter an API key!', 'radykal'); ?>", 'error');
							return;
						}

						$this.addClass('radykal-disabled');
						jQuery.ajax({
							url: "<?php echo admin_url('admin-ajax.php'); ?>",
							data: {
								action: 'fpd_checkapikey',
								_ajax_nonce: "<?php echo FPD_Admin::$ajax_nonce; ?>",
								api_key: apiKey
							},
							type: 'post',
							dataType: 'json',
							success: function(data) {

								if(data && data.error_code) {

									if(data.error_code == 'api-key-wrong') {
										fpdMessage("<?php _e( 'The API key is wrong!', 'radykal'); ?>", 'error');
									}
									else if(data.error_code == 'no-sub') {
										fpdMessage("<?php _e( 'An active premium plan is required to unlock \"Automated Export\"!', 'radykal'); ?>", 'error');
									}

								}
								else if(data && data.created_at) {
									$this.parents('.radykal-settings-block:first').removeClass('fpd-block-overlay-active') //remove blur
									.find('.form-table #fpd_ae_admin_api_key').val(data.api_key) //set api key in input
									.parents('.radykal-settings-block:first').children('.fpd-settings-block-overlay').remove(); //remove overlay

								}
								else {
									fpdMessage("<?php _e( 'Something went wrong. Please try again or contact the Fancy Product Designer Support!', 'radykal'); ?>", 'error');
								}

								$this.removeClass('radykal-disabled');

							}
						});

					});




				});

			</script>
			<?php
			endif;

		}

		public function radykal_ae_settings_block_css_class( $class, $block_id ) {

			$api_key = fpd_get_option( 'fpd_ae_admin_api_key' );

			if( $block_id == 'ae-general' && empty($api_key) )
				$class .= ' fpd-block-overlay-active';

			return $class;

		}

		private function get_print_file_uri( $params=array() ) {

			return add_query_arg( $params, Fancy_Product_Designer::get_cloud_admin_api_url() . 'create_print_file' );

		}

	}
}

new FPD_Cloud_Admin();

?>