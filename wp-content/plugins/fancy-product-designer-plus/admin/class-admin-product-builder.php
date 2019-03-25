<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly


if( !class_exists('FPD_Admin_Plus_Product_Builder') ) {

	class FPD_Admin_Plus_Product_Builder {

		public function __construct() {

			add_action( 'fpd_product_builder_general_options_end', array( &$this, 'add_general_options' ));
			add_action( 'fpd_product_builder_text_options_end', array( &$this, 'add_text_options' ));

		}

		public function add_general_options( $request_view_id ) {

			if( fpd_is_first_view($request_view_id) ):
			?>
			<tr>
				<td colspan="2">
					<div class="fpd-prop-title">
						<label><?php _e('Show in Color Selection [PLUS]', 'radykal'); ?></label>
						<i class="fpd-admin-icon-info-outline fpd-admin-tooltip" title="<?php _e('Shows the elements colors in the color selection panel.', 'radykal'); ?>"></i>
					</div>
					<label class="fpd-ad-switch">
						<input type="checkbox" name="showInColorSelection" value="1" class="fpd-upload-zone-hidden">
						<div><span></span></div>
					</label>
				</td>
			</tr>
			<?php
			endif;

		}

		public function add_text_options() {

			?>
			<tr class="fpd-text-plus-opts">
				<td colspan="2">
					<div class="fpd-prop-title">
						<label><?php _e('Text/Number Placeholder [PLUS]', 'radykal'); ?></label>
						<i class="fpd-admin-icon-info-outline fpd-admin-tooltip" title="<?php _e('Enable the text element as a text or number placeholder to use it with the Names & Numbers module.', 'radykal'); ?>"></i>
					</div>
					<select name="textNumberPlaceholder" data-toggle=".fpd-number-placeholder-opts=number" class="widefat">
						<option value="none"><?php _e('None', 'radykal'); ?></option>
						<option value="text"><?php _e('Text', 'radykal'); ?></option>
						<option value="number"><?php _e('Number', 'radykal'); ?></option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<div class="fpd-prop-title">
						<label><?php _e('Min. Number', 'radykal'); ?></label>
					</div>
					<input type="number" step="1" name="numberPlaceholderMin" class="fpd-number-placeholder-opts fpd-only-numbers">
				</td>
				<td>
					<div class="fpd-prop-title">
						<label><?php _e('Max. Number', 'radykal'); ?></label>
					</div>
					<input type="number" step="1" name="numberPlaceholderMax" class="fpd-number-placeholder-opts fpd-only-numbers">
				</td>
			</tr>
			<?php

		}

	}
}

return new FPD_Admin_Plus_Product_Builder();

?>