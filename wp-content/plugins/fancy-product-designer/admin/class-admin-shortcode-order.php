<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if( !class_exists('FPD_Admin_Shortcode_Order') ) {

	class FPD_Admin_Shortcode_Order {

		private $date_format;

		public function output() {

			$this->date_format = get_option('date_format').', '.get_option('time_format');

			global $wpdb;

			$page_links = false;
			$pagenum = isset( $_GET['paged'] ) ? absint( $_GET['paged'] ) : 1;
			$limit = 10;
			$offset = ( $pagenum - 1 ) * $limit;

			if( fpd_table_exists(FPD_ORDERS_TABLE) ) {

				$total = $wpdb->get_var( "SELECT COUNT(ID) FROM ".FPD_ORDERS_TABLE."" );
				$num_of_pages = ceil( $total / $limit );

				$page_links = paginate_links( array(
				    'base' => add_query_arg( 'paged', '%#%' ),
				    'format' => '',
				    'prev_text' => __( '&laquo;', 'text-domain' ),
				    'next_text' => __( '&raquo;', 'text-domain' ),
				    'total' => $num_of_pages,
				    'current' => $pagenum
				) );

			}

			?>
			<div class="wrap" id="fpd-orders">

				<h2 class="fpd-clearfix">
					<?php _e('Orders via Shortcode', 'radykal'); ?>
					<?php fpd_admin_display_version_info(); ?>
				</h2>

				<?php
				fpd_output_admin_notice(
					'info',
					 __( 'New ADMIN', 'radykal' ),
					 __( '<a href="http://admin.fancyproductdesigner.com/" target="_blank">We created a new online solution with an improved Order viewer that has much more feature than this one.</a>', 'radykal' ),
					 true,
					 'fpd_notice_new_admin',
					 true,
					 true
				);
				?>

				<?php if( function_exists('get_woocommerce_currency') ) : ?>
				<div class="updated">
					<p><strong><?php _e('Orders made with WooCommerce can be viewed in the order details of a WooCommerce order!', 'radykal'); ?></strong></p>
				</div>
				<?php endif; ?>

				<div class="fpd-panel">
					<h3><?php _e('Choose Order', 'radykal'); ?></h3>

					<ul id="fpd-shortcode-orders-list" class="radykal-clearfix">

						<?php

						$orders = FPD_Shortcode_Order::get_orders($limit, $offset);

						if( is_array($orders) ) {
							foreach($orders as $order) {

								$fpd_order = isset($order->views) ? $order->views : $order->order;

								$fpdProduct = json_decode( fpd_strip_multi_slahes($fpd_order) );

								echo $this->get_order_list_item(
									$order->ID,
									$order->customer_name,
									$order->customer_mail,
									isset($order->created_date) ? $order->created_date : '',
									$fpdProduct && isset($fpdProduct->product[0]->productTitle) ? $fpdProduct->product[0]->productTitle : ''
								);

							}
						}

						?>


					</ul>

					<?php
					if ( $page_links ) {
					    echo '<div class="tablenav"><div class="tablenav-pages" style="margin: 0;">' . $page_links . '</div></div>';
					}
					?>

				</div>

				<div class="fpd-panel">
					<h3><?php _e('Order Viewer', 'radykal'); ?></h3>
					<?php include( FPD_PLUGIN_ADMIN_DIR.'/views/html-order-viewer.php' ); ?>
				</div>

			</div>
			<script type="text/javascript">

				jQuery(document).ready(function($) {

					var $ordersList = $('#fpd-shortcode-orders-list');

					$ordersList.on('click', 'li', function() {

						if(!loadingProduct) {

							fancyProductDesigner.toggleSpinner(true, fpd_order_viewer.loading_data_text);

							$ordersList.children('li').removeClass('fpd-active');

							var $this = $(this).addClass('fpd-active');

							fpd_order_viewer.order_id = $this.data('id');

							$.ajax({
								url: fpd_admin_opts.adminAjaxUrl,
								data: {
									action: 'fpd_getshortcodeorder',
									_ajax_nonce: fpd_admin_opts.ajaxNonce,
									id: fpd_order_viewer.order_id
								},
								type: 'post',
								dataType: 'json',
								success: function(data) {

									if(data && data.views) {

										var order = JSON.parse(data.views),
											product = order.product;

										//replace options
										product.forEach(function(view) {
											view.options = $.extend({}, view.options ? view.options : {}, fpdPluginsOptions);
										});

										fpdLoadOrder(product, order.bulkVariations, order.usedDepositPhotos); //PLUS

									}
									else {
										fpdMessage(fpd_admin_opts.tryAgain, 'error');
									}

								}
							});

						}

					});

					$ordersList.on('click', '.fpd-remove-order', function(evt) {

						evt.preventDefault();
						evt.stopPropagation();

						var $this = $(this);

						radykalConfirm({msg: fpd_admin_opts.remove}, function(c) {

							if(c) {

								$.ajax({
									url: fpd_admin_opts.adminAjaxUrl,
									data: {
										action: 'fpd_removeshortcodeorder',
										_ajax_nonce: fpd_admin_opts.ajaxNonce,
										id: $this.parents('li').data('id')
									},
									type: 'post',
									dataType: 'json',
									success: function(data) {

										if(data == 0) {
											fpdMessage(fpd_admin_opts.tryAgain, 'error');
										}
										else {
											location.reload();
										}

									}
								});

							}

						});

					});

				});

			</script>
			<?php

		}

		private function get_order_list_item( $id, $name, $mail, $date='', $product_title='' ) {

			$date_html = '';
			$parse_date = date_parse($date);
			if($parse_date['year']) {
				$date = date($this->date_format, strtotime($date));
				$date_html = '<i>'.$date.'</i><br />';
			}

			$product_title_html = '';
			if( !empty($product_title) ) {
				$product_title_html = '<strong class="fpd-product-title">'.__('FPD Product: ').$product_title.'</strong><br />';
			}

			//PLUS
			return '<li data-id="'.$id.'" class="fpd-clearfix"><span>'.$date_html.$product_title_html.$name.'<br /><a href="mailto:'.$mail.'">'.$mail.'</a></span><span><a href="#" class="fpd-remove-order fpd-admin-tooltip" title="'.__('Remove', 'radykal').'"><i class="fpd-admin-icon-close"></i></a></span></li>';

		}

	}

}