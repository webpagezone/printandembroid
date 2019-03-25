<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly


if(!class_exists('FPD_Plus_Admin_Order')) {

	class FPD_Plus_Admin_Order {

		public function __construct() {

			add_action( 'fpd_order_viewer_tabs_end', array(&$this, 'add_order_viewer_tab') );
			add_action( 'fpd_order_viewer_tabs_content_end', array(&$this, 'add_order_viewer_tab_content') );

		}

		public function add_order_viewer_tab() {

			?>
			<a href="bulk-add-variations"><?php _e('Bulk-Add Variations', 'radykal'); ?></a>
			<?php

		}

		public function add_order_viewer_tab_content() {

			?>
			<div data-id="bulk-add-variations">
				<div>
					<p class="description"><?php _e('The customer ordered following variations:', 'radykal'); ?></p>
					<table class="form-table" id="bulk-variations-table">
						<thead>
							<tr>
								<th><?php _e('Variation', 'radykal'); ?></th>
								<th style="width: 100px;"><?php _e('Quantity', 'radykal'); ?></th>
							</tr>
						</thead>
						<tbody id="bulk-variations-tbody">
						</tbody>
					</table>
				</div>
			</div>
			<?php

		}

	}

}

new FPD_Plus_Admin_Order();

?>