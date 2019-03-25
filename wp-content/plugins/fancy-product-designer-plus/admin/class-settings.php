<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly


if( !class_exists('FPD_Plus_Settings') ) {

	class FPD_Plus_Settings {

		public function __construct() {

			//Global Settings
			//add_filter( 'fpd_general_settings', array( &$this,'register_settings' ) );
			add_filter( 'fpd_settings_tabs', array(&$this, 'add_plus_tab') );
			add_filter( 'fpd_settings_blocks', array(&$this, 'add_plus_tab_blocks') );
			add_action( 'fpd_block_options_end', array(&$this, 'add_block_options') );

			//IPS
			add_action( 'fpd_ips_tabs_end', array(&$this, 'add_ips_tab') );
			add_action( 'fpd_ips_tabs_content_end', array(&$this, 'add_ips_content_tab') );

			//Products
			add_action( 'fpd_shortcode_module_options', array( &$this, 'add_shortcode_module_options') );

		}

		public function add_plus_tab( $tabs ) {

			$tabs['plus'] = __('Plus', 'radykal');

			return $tabs;

		}

		public function add_plus_tab_blocks( $blocks ) {

			$blocks['plus'] = array(
				'plus-modules' => __('Modules', 'radykal'),
				'plus-tools' => __('Tools', 'radykal'),
			);

			return $blocks;

		}

		public function add_block_options() {

			$plus_options = self::get_options();
			FPD_Settings::$radykal_settings->add_block_options( 'plus-modules', $plus_options['modules']);
			FPD_Settings::$radykal_settings->add_block_options( 'plus-tools', $plus_options['tools']);

		}

		public function add_ips_tab() {
			?>
			<a href="plus-options"><?php _e('Plus', 'radykal'); ?></a>
			<?php
		}

		public function add_ips_content_tab() {

			$nn_module_placeholder = fpd_get_option('fpd_plus_names_numbers_dropdown');
			$nn_module_placeholder = empty( $nn_module_placeholder ) ? __('e.g. S | M | L', 'radykal') : $nn_module_placeholder;

			$bulk_add_placeholder = fpd_get_option('fpd_plus_bulk_add_variations_written');
			$bulk_add_placeholder = empty( $bulk_add_placeholder ) ? __('e.g. Size=M|L;Colors=Blue|Red', 'radykal') : $bulk_add_placeholder;

			?>

			<div data-id="plus-options">
				<h4><?php _e('Modules', 'radykal'); ?></h4>
				<table class="form-table radykal-settings-form">
					<tbody>
						<tr valign="top">
							<th scope="row"><label><?php _e('Names & Numbers Dropdown', 'radykal'); ?></label></th>
							<td><input type="text" name="plus_names_numbers_dropdown" class="widefat" placeholder="<?php echo $nn_module_placeholder; ?>" value=""></td>
						</tr>
						<tr valign="top">
							<th scope="row"><label><?php _e('Names & Numbers Entry Price', 'radykal'); ?></label></th>
							<td><input type="number" min="0" name="plus_names_numbers_entry_price" placeholder="<?php echo fpd_get_option('fpd_plus_names_numbers_entry_price'); ?>" value=""></td>
						</tr>
					</tbody>
				</table>
				<h4><?php _e('Tools', 'radykal'); ?></h4>
				<table class="form-table radykal-settings-form">
					<tbody>
						<tr valign="top">
							<th scope="row"><label><?php _e('Color Selection Placement', 'radykal'); ?></label></th>
							<td>
								<select name="plus_color_selection_placement" class="radykal-select2" style="width: 100%;">
								<option value=""><?php _e( 'Use Option From Main Settings', 'radykal' ); ?></option>
									<?php
										//get all created categories
										$ui_layouts = self::get_color_selection_placements();
										foreach($ui_layouts as $key => $value) {
											echo '<option value="'.$key.'">'.$value.'</option>';
										}
									?>
								</select>
							</td>
						</tr>
						<tr valign="top">
							<th scope="row"><label><?php _e('Bulk-Add Form Placement', 'radykal'); ?></label></th>
							<td>
								<select name="plus_bulk_add_form_placement" class="radykal-select2" style="width: 100%;">
								<option value=""><?php _e( 'Use Option From Main Settings', 'radykal' ); ?></option>
									<?php
										//get all created categories
										$ui_layouts = self::get_bulk_add_form_placements();
										foreach($ui_layouts as $key => $value) {
											echo '<option value="'.$key.'">'.$value.'</option>';
										}
									?>
								</select>
							</td>
						</tr>
						<tr valign="top">
							<th scope="row"><label><?php _e('Bulk-Add Variations', 'radykal'); ?></label></th>
							<td><input type="text" name="plus_bulk_add_variations_written" placeholder="<?php echo $bulk_add_placeholder; ?>" value="" class="widefat"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<?php

		}

		public function register_settings( $settings ) {


			return $settings;

		}

		public function add_shortcode_module_options() {

			echo '<option value="names-numbers">'. __('Names & Numbers', 'radykal') .'</option>';
			echo '<option value="drawing">'. __('Drawing', 'radykal') .'</option>';
			echo '<option value="dynamic-views">'. __('Dynamic Views', 'radykal') .'</option>';

		}

		public static function get_options() {

			return apply_filters('fpd_plus_settings', array(

				'modules' => array(

					array(
						'title' => __('Names & Numbers', 'radykal'),
						'type' => 'section-title',
						'id' => 'names-numbers-section'
					),

					array(
						'title' 		=> __( 'Dropdown Attributes', 'radykal' ),
						'description' 	=> __( 'Enter some attributes by "|" separating values. These attributes will be used in the Names&Numbers module.', 'radykal' ),
						'id' 			=> 'fpd_plus_names_numbers_dropdown',
						'css' 			=> 'width:500px;',
						'default'		=> '',
						'type' 			=> 'text'
					),

					array(
						'title' 		=> __( 'Entry Price', 'radykal' ),
						'description' 	=> __( 'The additional price for every entry in the Names&Numbers module.', 'radykal' ),
						'id' 			=> 'fpd_plus_names_numbers_entry_price',
						'css' 			=> 'width:70px;',
						'default'		=> 0,
						'type' 			=> 'number'
					),

					array(
						'title' => __('Dynamic Views', 'radykal'),
						'type' => 'section',
						'id' => 'dynamic-views-section'
					),

					array(
						'title' 		=> __( 'Unit Of Length', 'radykal' ),
						'id' 			=> 'fpd_plus_dynamic_views_unit',
						'class'			=> 'radykal-select2',
						'css' 			=> 'width: 300px;',
						'default'		=> '',
						'type' 			=> 'select',
						'options' 		=> self::get_dynamic_views_units()
					),

					array(
						'title' => __( 'Predefined Formats', 'radykal' ),
						'description' 		=> __( 'Display some predefined formats that your customers can choose from.', 'radykal' ),
						'id' 		=> 'fpd_plus_dynamic_views_formats',
						'css' 		=> 'width:500px;',
						'default'	=> '',
						'type' 		=> 'values-group',
						'options'   => array(
							'width' => 'Width',
							'height' => 'Height'
						),
						'regexs' => array(
							'width' => '^-?\d+\.?\d*$',
							'height' => '^-?\d+\.?\d*$'
						)
					),


				), //modules

				'tools' => array(

					array(
						'title' 		=> __( 'Color Selection Placement', 'radykal' ),
						'description' 	=> __( 'In order to show specific elements in the Color Selection panel, you need to enable the relevant option in the Product Builder under the General tab.', 'radykal' ),
						'id' 			=> 'fpd_plus_color_selection_placement',
						'class'			=> 'radykal-select2',
						'css' 			=> 'width: 300px;',
						'default'		=> '',
						'type' 			=> 'select',
						'options' 		=> self::get_color_selection_placements()
					),

					array(
						'title' 		=> __( 'Bulk-Add Form Placement', 'radykal' ),
						'id' 			=> 'fpd_plus_bulk_add_form_placement',
						'class'			=> 'radykal-select2',
						'css' 			=> 'width: 300px;',
						'default'		=> '',
						'type' 			=> 'select',
						'options' 		=> self::get_bulk_add_form_placements()
					),

					array(
						'title' 		=> __( 'Bulk-Add Variations', 'radykal' ),
						'description' 	=> __( 'You can define variations like that: Size=M|L;Colors=Blue|Red.', 'radykal' ),
						'id' 			=> 'fpd_plus_bulk_add_variations_written',
						'css' 			=> 'width: 100%;',
						'default'		=> '',
						'type' 			=> 'text',
					),

				), //tools

			));
		}

		public static function get_color_selection_placements() {

			$options = array(
				'none' => __( 'None', 'radykal' ),
				'inside-tl'	 => __( 'Inside Top/Left', 'radykal' ),
				'inside-tc'	 => __( 'Inside Top/Center', 'radykal' ),
				'inside-tr'	 => __( 'Inside Top/Right', 'radykal' ),
				'inside-bl'	 => __( 'Inside Bottom/Left', 'radykal' ),
				'inside-bc'	 => __( 'Inside Bottom/Center', 'radykal' ),
				'inside-br'	 => __( 'Inside Bottom/Right', 'radykal' ),
				'shortcode' => __( 'Via Shortcode [fpd_cs]', 'radykal' )
			);

			if( function_exists('get_woocommerce_currency') ) {
				$options['after-short-desc'] = __( 'After Short Description (WooCommerce)', 'radykal' );
			}

			return $options;

		}

		public static function get_bulk_add_form_placements() {

			$options = array(
				'none' => __( 'None', 'radykal' ),
				'after-short-desc'	 => __( 'After Short Description (WooCommerce)', 'radykal' ),
				'shortcode' => __( 'Via Shortcode [fpd_bulk_add_form]', 'radykal' ),
			);

			if( function_exists('get_woocommerce_currency') ) {
				$options['after-short-desc'] = __( 'After Short Description (WooCommerce)', 'radykal' );
			}

			return $options;

		}

		public static function get_dynamic_views_units() {

			return array(
				'mm' => 'MM (Millimetre)',
				'cm' => 'CM (Centimetre)',
				'inch' => 'INCH'
			);

		}

		public static function get_all_product_attributes() {

			$attribute_taxonomies = wc_get_attribute_taxonomies();

		}
	}
}

new FPD_Plus_Settings();

?>