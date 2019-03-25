<?php

$premium_templates_dir = WP_CONTENT_DIR . '/uploads/fpd_product_templates/';
$free_templates_dir = FPD_PLUGIN_DIR . '/assets/objects-library/products/';

FPD_Admin_Modal::output_header(
	'fpd-modal-templates-library',
	__('Templates Library', 'radykal'),
	__('Browse the large templates library and create ready-to-use products from our pre-made templates with just one click. We offer at least one product from each category for free. If you want to use the other premium products, you have to buy the whole category set.', 'radykal')
);

$templates_json = fpd_admin_get_file_content( FPD_PLUGIN_DIR . '/assets/json/product_templates.json' );
$templates_json = json_decode($templates_json);

?>

<div id="fpd-templates-categories">
<?php

foreach($templates_json as $key => $templates) {
	echo '<a data-target="'.$key.'" href="#">'.$templates->name.'</a>';
}

?>
</div>

<div id="fpd-templates-right-col">

	<div class="fpd-tabs-wrapper">
	<?php
	foreach($templates_json as $key => $templates) {

		?>
		<div data-tab="<?php esc_attr_e( $key); ?>">

			<div id="fpd-templates-grid">
			<?php
			foreach($templates->templates as $template) {

				$total_product_templates++;

				$item_class = '';
				$item_label = __('Free', 'radykal');
				$item_url = '';
				$button_text = __('Create', 'radykal');
				if( isset($template->free) ) {
					$item_url = $free_templates_dir.$template->file;
				}
				else {

					if( file_exists($premium_templates_dir.$template->file) ) {

						$item_label = __('Premium', 'radykal');
						$item_url = $premium_templates_dir.$template->file;

					}
					else {

						$item_class .= 'fpd-unavailable';
						$item_label = __('Not Installed', 'radykal');
						$button_text = __('Buy Set', 'radykal');
						$item_url = $templates->purchase_url;

					}

				}

				$first_img = is_array($template->images) ? $template->images[0] : $template->images;

				$preview_images = is_array($template->images) ? $template->images : array($template->images);
				array_walk($preview_images, function(&$value, $key) { $value = plugins_url($value, FPD_PLUGIN_ADMIN_DIR); } );

				if(sizeof($preview_images) > 1) {
					$item_class .= ' fpd-multi-images';
				}

				echo '<div class="'.$item_class.'" data-label="'.$item_label.'" data-url="'. esc_attr($item_url).'" data-images="'.esc_attr( json_encode($preview_images) ).'" style="background-image: url('. plugins_url($first_img, FPD_PLUGIN_ADMIN_DIR) .');"><label>'.$template->name.'</label><span class="fpd-button">'.$button_text.'</span><div class="fpd-images-nav"><span class="dashicons dashicons-arrow-left-alt2" data-page="prev"></span><span class="dashicons dashicons-arrow-right-alt2" data-page="next"></span></div></div>';
			}

			?>
			</div><!-- .fpd-templates-grid -->

			<?php if($templates->purchase_url): ?>
			<p><a href="<?php esc_attr_e( $templates->purchase_url ); ?>" class="button-primary" target="_blank"><?php  printf(__('Buy %s set', 'radykal'), $templates->name); ?></a></p>
			<?php endif; ?>

		</div><!-- data-tab -->
	<?php
	}
	?>
	</div><!-- .fpd-tabs-wrapper -->

	<p class="description"><?php _e('Need another product template? <a href="http://test.de">Let us know</a> or <a href="https://fancyproductdesigner.com/customization-request/" target="_blank">hire us</a>!', 'radykal'); ?></p>

</div>

<div class="fpd-ui-blocker"></div>

<?php

	FPD_Admin_Modal::output_footer();

?>
