<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly


if(!class_exists('MSPC_Frontend_Product')) {

	class MSPC_Frontend_Product {

		public function __construct() {

			add_filter( 'body_class', array( &$this, 'add_class') );
			add_action( 'wp_head', array( &$this, 'head_handler') );

		}

		//add fancy-product class in body
		public function add_class( $classes ) {

			global $post;
			if( isset($post->ID) && mspc_enabled( $post->ID ) ) {

				$classes[] = 'mspc-product';

				$template_layout = get_post_meta($post->ID, 'mspc_template_layout', true);
				if($template_layout && $template_layout != 'none') {
					$classes[] = $template_layout;
				}

			}

			return $classes;

		}

		//used to reposition the product image if requested
		public function head_handler() {

			global $post;

			if( isset($post->ID) && mspc_enabled( $post->ID ) ) {

				$product_image = get_post_meta($post->ID, 'mspc_product_image', true);

				//hide product image
				if($product_image == 'hidden') {
					remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_images', 20 );
				}
				//position under product title
				else if($product_image == 'under_title') {
					remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_images', 20 );
					add_action( 'woocommerce_single_product_summary', 'woocommerce_show_product_images', 5 );
				}
				//position under mspc
				else if($product_image == 'under_mspc') {
					remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_images', 20 );
					add_action( 'woocommerce_single_product_summary', 'woocommerce_show_product_images', 10 );
				}

				$module_pos = get_post_meta($post->ID, 'mspc_module_position', true);

				//hide product image
				if($module_pos == 'after_short_desc') {
					add_action( 'woocommerce_single_product_summary', array( &$this, 'add_mspc_form'), 25 );
				}
				//under product image
				else if($module_pos == 'after_product_image') {
					add_action( 'woocommerce_before_single_product_summary', array( &$this, 'add_mspc_form'), 25 );
				}
				//before product container
				else if($module_pos == 'before_product_con') {
					add_action( 'woocommerce_before_single_product', array( &$this, 'add_mspc_form'), 20 );
				}
				//before fancy product designer
				else if($module_pos == 'before_fancy_product_designer') {
					add_action( 'fpd_before_product_designer', array( &$this, 'add_mspc_form'), 20 );
				}
				//after fancy product designer
				else if($module_pos == 'after_fancy_product_designer') {
					add_action( 'fpd_after_product_designer', array( &$this, 'add_mspc_form'), 20 );
				}
				//default: under title
				else {
					add_action( 'woocommerce_single_product_summary', array( &$this, 'add_mspc_form'), 6 );
				}
			}

		}

		//the actual product designer will be added
		public function add_mspc_form() {

			global $product;

			if( mspc_enabled( $product->get_id() ) && $product->has_attributes() ) {

				MSPC_Scripts_Styles::$add_script = true;

				$module = get_post_meta($product->get_id(), 'mspc_module', true); //tabs, steps, accordion
				$columns = intval(get_post_meta($product->get_id(), 'mspc_columns', true)); //1-6
				$grid_item_layout = get_post_meta($product->get_id(), 'mspc_grid_item_layout', true); //horizontal, vertical
				$auto_next = get_post_meta($product->get_id(), 'mspc_auto_next', true); //auto-next
				$auto_next_class = $auto_next == 'yes' ? ' mspc-auto-next' : '';
				$step_by_step = get_post_meta($product->get_id(), 'mspc_step_by_step', true); //auto-next
				$step_by_step_class = $step_by_step == 'yes' ? ' mspc-step-by-step' : '';
				$tooltip_title = get_post_meta($product->get_id(), 'mspc_tooltip_title', true);

				$attributes = $product->get_variation_attributes();
				$attribute_count = -1;

				?>
				<div class="mspc-wrapper mspc-clearfix mspc-module-<?php echo $module; ?><?php echo $auto_next_class; echo $step_by_step_class; ?>">

					<?php if( $module == 'accordion' ): //accordion ?>

						<div class="mspc-accordion">
							<?php foreach($attributes as $name => $options): $attribute_count++; ?>

							<a href="#" class="mspc-menu-item" data-target=".mspc-<?php echo $name; ?>">
								<i class="icon add"></i><span><?php echo wc_attribute_label( $name ); ?></span>
							</a>
							<div class="mspc-content">
								<div class="mspc-variations mspc-clearfix ui column grid doubling mspc-<?php echo $name. ' '.$this->get_column_class($columns); ?>">
									<?php echo $this->get_variation_items( $name, $options, $grid_item_layout, $columns, $tooltip_title ); ?>
								</div>
							</div>

							<?php endforeach; ?>
						</div>

					<?php else: //steps, tabs, vertical steps ?>

						<div class="mspc-menu ui <?php echo $this->get_menu_class( $module, sizeof($attributes) );  ?>">
							<?php
							foreach($attributes as $name => $options): $attribute_count++; ?>
							<a class="mspc-menu-item ui <?php echo $this->get_menu_item_class($module); ?>" data-target=".mspc-<?php echo $name; ?>"><?php echo wc_attribute_label( $name ); ?></a>
							<?php endforeach; ?>
						</div><!-- Menu -->

						<div class="mspc-content ui <?php echo $this->get_content_class($module); ?>">

							<?php
							$attribute_count = -1;
							foreach($attributes as $name => $options): ?>
							<div class="mspc-variations mspc-clearfix ui column grid doubling mspc-<?php echo $name. ' '.$this->get_column_class($columns); ?>">
								<?php echo $this->get_variation_items( $name, $options, $grid_item_layout, $columns, $tooltip_title ); ?>
							</div>
							<?php endforeach; ?>

						</div><!-- Content -->

					<?php endif; ?>
					<a href="#" class="mspc-clear-selection"><?php _e( 'Clear selection', 'radykal' ); ?></a>

				</div><!-- Wrapper --->

				<?php
			}

		}

		private function get_variation_items( $attribute_name, $options, $grid_item_layout='vertical', $columns=3, $tooltip_title='' ) {

			$orderby = wc_attribute_orderby( $attribute_name );

			switch ( $orderby ) {
				case 'name' :
					$args = array( 'orderby' => 'name', 'hide_empty' => false, 'menu_order' => false );
				break;
				case 'id' :
					$args = array( 'orderby' => 'id', 'order' => 'ASC', 'menu_order' => false, 'hide_empty' => false );
				break;
				case 'menu_order' :
					$args = array( 'menu_order' => 'ASC', 'hide_empty' => false );
				break;
			}

			$terms = get_terms( $attribute_name, $args );

			ob_start();

			if( isset($terms->errors) ) {
				?>
				<div class="column"><?php printf( __('No attributes found for this taxonomy. Be sure that they are visible on the product page and you created them via the <a href="%s" target="_blank">Attributes admin page</a>.'), admin_url().'edit.php?post_type=product&page=product_attributes' ); ?></div>
				<?php
				return false;
			}

			foreach($terms as $term):

				if ( !in_array( $term->slug, $options ) ) { continue; }

				$fpd_params = '';
				$fpd_thumbnail = '';
				if( class_exists('FPD_Parameters') ) {

					$fpd_params = get_option( 'mspc_variation_fpd_params_'. $term->term_id, '' );
					$fpd_params_array = array();
					if( !empty($fpd_params) ) {

						if(strpos($fpd_params,'enabled') !== false) {
							//convert string to array
							parse_str($fpd_params, $fpd_params_array);
							$fpd_params = FPD_Parameters::convert_parameters_to_string($fpd_params_array);
						}
					}

					$fpd_thumbnail = get_option( 'mspc_variation_fpd_thumbnail_'. $term->term_id, '' );

				}

				$stage_image = $image_html = '';

				$image_url = get_option( 'mspc_variation_image_'. $term->term_id );
				if( $image_url !== false && !empty($image_url) ) {

					$image_id = $this->get_image_id( $image_url );
					if( !is_null($image_id) ) {
						$stage_image = wp_get_attachment_image_src($image_id, empty($fpd_params) ? 'shop_single' : 'full' );
						$stage_image = $stage_image[0];
						$image_thumb = empty($fpd_thumbnail) ? $stage_image : $fpd_thumbnail;
					}
					else {
						$stage_image = $image_url;
					}

					$image_thumb = empty($fpd_thumbnail) ? $stage_image : $fpd_thumbnail;
					$image_html = '<img src="'.$image_thumb.'" alt="'.$term->name.'" class="mspc-attribute-image rounded ui image" />';
				}

				$description_html = '';
				if( !empty($term->description) ) {
					$description_html = '<p>'.$term->description.'</p>';
				}

				if( $grid_item_layout == 'vertical' ):
				?>

				<div class="mspc-variation mspc-vertical column" data-parameters='<?php echo $fpd_params; ?>' data-image='<?php echo $stage_image; ?>' data-title="<?php echo $term->name; ?>">
					<div class="mspc-clearfix">
						<div class="mspc-radio ui radio checkbox">
							<input type="radio" name="<?php echo $attribute_name; ?>" value="<?php echo esc_attr( $term->slug ); ?>">
							<label></label>
						</div>
						<?php echo $image_html; ?>
						<div class="mspc-text-wrapper">
							<?php if( $tooltip_title !== 'yes'): ?>
							<strong class="mspc-attribute-title"><?php echo $term->name; ?></strong>
							<?php endif; ?>
							<?php echo $description_html; ?>
						</div>
					</div>
					<?php if( $tooltip_title == 'yes'): ?>
					<div class="mspc-tooltip"><?php echo $term->name; ?></div>
					<?php endif; ?>
				</div>

				<?php else: ?>

				<div class="mspc-variation mspc-horizontal column" data-parameters='<?php echo $fpd_params; ?>' data-image='<?php echo $stage_image; ?>' data-title="<?php echo $term->name; ?>">
					<div class="mspc-clearfix">
						<?php echo $image_html; ?>
						<div class="mspc-text-wrapper">
							<?php if( $tooltip_title !== 'yes'): ?>
							<strong class="mspc-attribute-title"><?php echo $term->name; ?></strong>
							<?php endif; ?>
							<?php echo $description_html; ?>
							<div class="mspc-radio ui radio checkbox">
								<input type="radio" name="<?php echo $attribute_name; ?>" value="<?php echo esc_attr( $term->slug ); ?>">
								<label></label>
							</div>
						</div>
					</div>
					<?php if( $tooltip_title == 'yes'): ?>
					<div class="mspc-tooltip"><?php echo $term->name; ?></div>
					<?php endif; ?>
				</div>

				<?php endif;

			endforeach;

			$output = ob_get_contents();
			ob_end_clean();

			return $output;

		}

		private function get_menu_class( $type, $columns ) {

			switch($type) {
				case 'steps':
					return 'steps ' . $this->get_column_class( $columns );
				case 'steps-vertical':
					return 'steps vertical ';
				case 'accordion':
					return 'fluid accordion';
				default:
					return 'top attached tabular menu';
			}

		}

		private function get_menu_item_class( $type ) {

			switch($type) {
				case 'steps':
					return 'step item';
				case 'steps-vertical':
					return 'step item';
				case 'accordion':
					return 'fluid accordion';
				default:
					return 'item';
			}

		}

		private function get_content_class( $type ) {

			switch($type) {
				case 'steps':
					return 'segment';
				case 'steps-vertical':
					return 'segment';
				case 'accordion':
					return 'fluid accordion';
				default:
					return 'bottom attached segment';
			}

		}

		private function get_column_class( $columns ) {

			switch($columns) {
				case 2:
					return 'two';
				case 3:
					return 'three';
				case 4:
					return 'four';
				case 5:
					return 'five';
				case 6:
					return 'six';
				case 7:
					return 'seven';
				case 8:
					return 'eight';
				case 9:
					return 'nine';
				case 10:
					return 'ten';
				default:
					return 'one';
			}

		}

		private function get_image_id( $url ) {

			// Split the $url into two parts with the wp-content directory as the separator
			$parsed_url  = explode( parse_url( WP_CONTENT_URL, PHP_URL_PATH ), $url );
			// Get the host of the current site and the host of the $url, ignoring www
			$this_host = str_ireplace( 'www.', '', parse_url( home_url(), PHP_URL_HOST ) );
			$file_host = str_ireplace( 'www.', '', parse_url( $url, PHP_URL_HOST ) );

			// Return nothing if there aren't any $url parts or if the current host and $url host do not match
			if ( ! isset( $parsed_url[1] ) || empty( $parsed_url[1] ) || ( $this_host != $file_host ) ) {
				return;
			}

			global $wpdb;
			$attachment = $wpdb->get_col( $wpdb->prepare( "SELECT ID FROM {$wpdb->prefix}posts WHERE guid RLIKE %s;", $parsed_url[1] ) );
			// Returns null if no attachment is found
			return $attachment[0];

		}
	}
}

new MSPC_Frontend_Product();

?>