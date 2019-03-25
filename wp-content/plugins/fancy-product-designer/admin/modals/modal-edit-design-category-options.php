<?php

FPD_Admin_Modal::output_header(
	'fpd-modal-edit-options',
	__('Options', 'radykal'),
	__('Here you can set custom options for all designs in a single category or for every design element separately.', 'radykal')
);

?>

<!-- Only for single designs to set a custom thumbnail -->
<div id="fpd-set-design-thumbnail-wrapper" class="fpd-hidden-design-category">
	<table class="form-table radykal-settings-form">
		<tbody>
			<tr valign="top">
				<th scope="row">
					<?php _e('Design Thumbnail', 'radykal'); ?>
				</th>
				<td class="fpd-clearfix">
					<div id="fpd-set-design-thumbnail">+</div>
					<a href="#" id="fpd-remove-design-thumbnail" class="fpd-icon-btn"><i class="dashicons dashicons-minus"></i></a>
				</td>
			</tr>
		</tbody>
	</table>
	<br />
</div>

<form>
	<div class="fpd-hidden">
		<input type="checkbox" value="0" name="bounding_box_control" checked="checked">
		<input type="checkbox" value="0" name="autoCenter" checked="checked">
		<input type="checkbox" value="0" name="draggable" checked="checked">
		<input type="checkbox" value="0" name="rotatable" checked="checked">
		<input type="checkbox" value="0" name="resizable" checked="checked">
		<input type="checkbox" value="0" name="removable" checked="checked">
		<input type="checkbox" value="0" name="zChangeable" checked="checked">
		<input type="checkbox" value="0" name="autoSelect" checked="checked">
		<input type="checkbox" value="0" name="topped" checked="checked">
		<input type="checkbox" value="0" name="uniScalingUnlockable" checked="checked">
		<input type="checkbox" value="0" name="replaceInAllViews" checked="checked">
		<input type="checkbox" value="0" name="advancedEditing" checked="checked">
		<input type="checkbox" value="0" name="excludeFromExport" checked="checked">
	</div>
	<div>
		<strong><?php _e('Enable Options', 'radykal'); ?></strong>
		<label class="fpd-ad-switch">
			<input type="checkbox" value="1" name="enabled">
			<div><span></span></div>
		</label>
	</div>
	<div class="radykal-tabs">

		<div class="radykal-tabs-nav">
			<a href="general-options" class="current"><?php _e('General', 'radykal'); ?></a>
			<a href="colors-options"><?php _e('Colors', 'radykal'); ?></a>
			<a href="custom-props-options"><?php _e(' Customizable Properties', 'radykal'); ?></a>
			<a href="bb-options"><?php _e('Bounding Box', 'radykal'); ?></a>
		</div>
		<div class="radykal-tabs-content">
			<div data-id="general-options" class="current">

				<table class="form-table radykal-settings-form">
					<tbody>
					<?php

						radykal_output_option_item( array(
								'id' => 'x',
								'title' => __('Left', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'y',
								'title' => __('Top', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'z',
								'title' => __('Layer Depth', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '-1',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> -1,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'price',
								'title' => __('Price', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Scale By', 'radykal' ),
								'id' 		=> '_scaleBy',
								'default'	=> 'factor',
								'type' 		=> 'radio',
								'options'	=>  array(
									'factor' => __('Factor', 'radykal'),
									'dimensions' => __('Dimensions', 'radykal'),
								),
								'relations' => array(
									'factor' => array(
										'scale' => true,
										'resizeToW' => false,
										'resizeToH' => false,
										'scaleMode' => false,
									),
									'dimensions' => array(
										'scale' => false,
										'resizeToW' => true,
										'resizeToH' => true,
										'scaleMode' => true,
									)
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'scale',
								'title' => __('Scale Factor', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 0.01
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'resizeToW',
								'title' => __('Scale To Width', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number'
							)
						);

						radykal_output_option_item( array(
								'id' => 'resizeToH',
								'title' => __('Scale To Height', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0',
								'type' 		=> 'number'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Scale Mode', 'radykal' ),
								'id' 		=> 'scaleMode',
								'default'	=> 'fit',
								'type' 		=> 'select',
								'options'	=>  array(
									'fit' => __('Fit', 'radykal'),
									'cover' => __('Cover', 'radykal')
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'minScaleLimit',
								'title' => __('Min. Scale Factor Limit', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '0.01',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0.01,
									'step' 	=> 0.01
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'sku',
								'title' => __('SKU', 'radykal'),
								'class' 	=> 'large-text fpd-hidden-design-category',
								'default'	=> '',
								'type' 		=> 'text'
							)
						);

						radykal_output_option_item( array(
								'id' => 'replace',
								'title' => __('Replace', 'radykal'),
								'class' 	=> 'large-text',
								'default'	=> '',
								'type' 		=> 'text'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Replace In All Views', 'radykal' ),
								'id' 		=> 'replaceInAllViews',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Auto-Select', 'radykal' ),
								'id' 		=> 'autoSelect',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Stay On Top', 'radykal' ),
								'id' 		=> 'topped',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Auto-Center', 'radykal' ),
								'id' 		=> 'autoCenter',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Exclude From Export', 'radykal' ),
								'id' 		=> 'excludeFromExport',
								'default'	=> '0',
								'type' 		=> 'checkbox',
							)
						);

					?>
					</tbody>
				</table>

			</div>

			<div data-id="colors-options">

				<table class="form-table radykal-settings-form">
					<tbody>
					<?php

						radykal_output_option_item( array(
								'id' => 'colorPicker',
								'title' => __('Color Picker', 'radykal'),
								'default'	=> '1',
								'type' 		=> 'checkbox',
								'relations' =>  array(
									'colors' => false
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'colors',
								'title' => __('Color(s)', 'radykal'),
								'class' 	=> 'large-text',
								'default'	=> '',
								'type' 		=> 'text'
							)
						);

						radykal_output_option_item( array(
								'id' => 'colorLinkGroup',
								'title' => __('Color Link Group', 'radykal'),
								'class' 	=> 'large-text',
								'default'	=> '',
								'type' 		=> 'text'
							)
						);

					?>
					</tbody>
				</table>
			</div>

			<div data-id="custom-props-options">

				<table class="form-table radykal-settings-form">
					<tbody>
					<?php

						radykal_output_option_item( array(
								'title' => __( 'Movable', 'radykal' ),
								'id' 		=> 'draggable',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Rotatable', 'radykal' ),
								'id' 		=> 'rotatable',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Resizable', 'radykal' ),
								'id' 		=> 'resizable',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Removable', 'radykal' ),
								'id' 		=> 'removable',
								'default'	=> '1',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Layer Depth Changeable', 'radykal' ),
								'id' 		=> 'zChangeable',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Allow Unproportional Scaling', 'radykal' ),
								'id' 		=> 'uniScalingUnlockable',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Advanced Editing', 'radykal' ),
								'id' 		=> 'advancedEditing',
								'default'	=> '0',
								'type' 		=> 'checkbox'
							)
						);

					?>
					</tbody>
				</table>
			</div>

			<div data-id="bb-options">

				<table class="form-table radykal-settings-form">
					<tbody>
					<?php

						radykal_output_option_item( array(
								'title' => __( 'Use another element as bounding box?', 'radykal' ),
								'id' 		=> 'bounding_box_control',
								'class'		=> 'fpd-bounding-box-control',
								'default'	=> 'no',
								'type' 		=> 'checkbox',
								'relations' =>  array(
									'bounding_box_by_other' => true,
									'bounding_box_x' => false,
									'bounding_box_y' => false,
									'bounding_box_width' => false,
									'bounding_box_height' => false,
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'bounding_box_x',
								'title' => __('Bounding Box Left Position', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'bounding_box_y',
								'title' => __('Bounding Box Top Position', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'bounding_box_width',
								'title' => __('Bounding Box Width', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'bounding_box_height',
								'title' => __('Bounding Box Height', 'radykal'),
								'css' 		=> 'width:70px;',
								'default'	=> '',
								'type' 		=> 'number',
								'custom_attributes' => array(
									'min' 	=> 0,
									'step' 	=> 1
								)
							)
						);

						radykal_output_option_item( array(
								'id' => 'bounding_box_by_other',
								'title' => __('Bounding Box Target', 'radykal'),
								'class' 	=> 'large-text',
								'default'	=> '',
								'type' 		=> 'text',

							)
						);

						radykal_output_option_item( array(
								'title' => __( 'Bounding Box Mode', 'radykal' ),
								'id' 		=> 'boundingBoxMode',
								'default'	=> 'inside',
								'type' 		=> 'select',
								'options'	=>  FPD_Settings_General::get_bounding_box_modi()
							)
						);

					?>
					</tbody>
				</table>
			</div><!-- BB Options -->

		</div><!-- .radykal-tabs-content -->
	</div><!-- .radykal-tabs -->
</form>

<?php
	FPD_Admin_Modal::output_footer(
		__('Set', 'radykal')
	);
?>
<script type="text/javascript">

	//scripts to use it for fpd and mspc
	jQuery(document).ready(function($) {

		var mediaUploader = null,
			$modalWrapper = $('#fpd-modal-edit-options');

		//enable/disable form
		$('#fpd-modal-edit-options')
		.on('change', 'input[name="enabled"]', function() {

			var $this = $(this);

			$this.parents('.fpd-admin-modal-content:first').find('.radykal-tabs').toggleClass('radykal-hidden', !$this.is(':checked'));
			$this.val($this.is(':checked') ? 1 : 0);

		})
		.on('change', '[name="_scaleBy"]', function() {

			var $relevantForm = $(this).parents('.radykal-settings-form:first');

			if(this.value === 'factor') {
				$relevantForm.find('[name="resizeToW"], [name="resizeToH"]').val('');
			}
			else {
				$relevantForm.find('[name="scale"]').val('');
			}

		}).find('[name="enabled"]').change();

		//set the thumbnail for a design in the modal parameters form
		$modalWrapper.on('click', '#fpd-set-design-thumbnail', function(evt) {

			if (mediaUploader) {
	            mediaUploader.open();
	            return;
	        }

	        mediaUploader = wp.media({
	            title: 'Choose Thumbnail',
	            multiple: true
	        });

			mediaUploader.on('select', function() {

				var imgUrl = mediaUploader.state().get('selection').toJSON()[0].url;

				$('#fpd-set-design-thumbnail').css('background-image', 'url('+imgUrl+')')
				.data('thumbnail', imgUrl);

	        });

	        mediaUploader.open();

	        evt.preventDefault();

		});

		$modalWrapper.on('click', '#fpd-remove-design-thumbnail', function(evt) {

			evt.preventDefault();
			$('#fpd-set-design-thumbnail').css('background-image', 'none')
			.data('thumbnail', '');

		});

	});

</script>