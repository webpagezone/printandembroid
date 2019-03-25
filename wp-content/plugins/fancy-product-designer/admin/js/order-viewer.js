var fancyProductDesigner,
	loadingProduct = false,
	$orderImageList,
	currentItemId = null,
	isReady = false,
	stageWidth = stageHeight = 0,
	fpdPluginsOptions;


jQuery(document).ready(function() {

	var $fancyProductDesigner = jQuery('#fpd-order-designer'),
		$customElementsList = jQuery('#fpd-custom-elements-list'),
		$tabsContent = jQuery('#fpd-order-panel .radykal-tabs-content'),
		customElements = null;

	$orderImageList = jQuery('#fpd-order-image-list');

	jQuery(document).ajaxError( function(e, xhr, settings, exception) {});

	fpdPluginsOptions = {
		responsive: false,
    	langJSON: false,
    	templatesDirectory: fpd_order_viewer.templates_dir,
    	editorMode: '#fpd-editor-box-wrapper',
    	editorBoxParameters: ['left', 'top', 'angle', 'fill', 'width', 'height', 'fontSize', 'price', 'sku'],
    	keyboardControl: false,
    	deselectActiveOnOutside : false,
    	templatesType: ['php', 'html'],
    	fonts: JSON.parse(fpd_order_viewer.enabled_fonts),
    	actions: {
	    	top: ['manage-layers', 'ruler', 'undo', 'redo']
    	},
    	mainBarModules: ['names-numbers'],
    	hexNames: fpd_order_viewer.hexNames,
    	depositphotosApiKey: fpd_order_viewer.dp_api_key,
    	uploadZonesTopped: fpd_order_viewer.uploadZonesTopped == '1'
	};

	try {
       fpdPluginsOptions.hexNames = JSON.parse(fpd_order_viewer.hexNames);
    } catch (e) {}


	$fancyProductDesigner.on('ready', function() {
		isReady = true;
		fancyProductDesigner.toggleSpinner(false);
	})
	.on('productCreate', function() {

		$customElementsList.empty();

		customElements = fancyProductDesigner.getCustomElements();
		for(var i=0; i < customElements.length; ++i) {
			var customElement = customElements[i].element;
			$customElementsList.append('<li><a href="#">'+customElement.title+'</a></li>');
		}

		//set view end value and max value
		jQuery('[name="fpd_view_end"]').val(fancyProductDesigner.viewInstances.length)
		.attr('max', fancyProductDesigner.viewInstances.length);

		loadingProduct = false;

	});

	fancyProductDesigner = new FancyProductDesigner($fancyProductDesigner, fpdPluginsOptions);

	jQuery('.woocommerce_order_items_wrapper').on('click', '.fpd-show-order-item', function(evt) {

		evt.preventDefault();

		if(	isReady && !loadingProduct ) {

			var $this = jQuery(this);
			$this.data('defaultText', $this.text()).text(fpd_order_viewer.loading_data_text);

			currentItemId = $this.data('order_item_id');

			jQuery.ajax({
				url: fpd_admin_opts.adminAjaxUrl,
				data: {
					action: 'fpd_loadorder',
					_ajax_nonce: fpd_admin_opts.ajaxNonce,
					order_id: $this.data('order_id'),
					item_id: currentItemId
				},
				type: 'post',
				dataType: 'json',
				complete: function(data) {

					if(data == undefined || data.responseJSON) {

						jQuery('html, body').animate({
					        scrollTop: jQuery("#fpd-order").offset().top
					    }, 300);

						var bulkVariations = null;
						if(data.responseJSON.bulk_variations) {

							try {
								bulkVariations = JSON.parse(data.responseJSON.bulk_variations);
						    }
						    catch (e) { }

						}

						var dpSources = null;
						if(data.responseJSON.usedDepositPhotos) {

							try {
								dpSources = JSON.parse(data.responseJSON.usedDepositPhotos);
						    }
						    catch (e) { }

						}
						var order = JSON.parse(data.responseJSON.order_data),
							product = order.product ? order.product : order;

						bulkVariations = order.bulkVariations ? order.bulkVariations : bulkVariations;
						dpSources = order.usedDepositPhotos ? order.usedDepositPhotos : dpSources;

						//replace options
						product.forEach(function(view) {
							view.options = $.extend({}, view.options ? view.options : {}, fpdPluginsOptions);
						});

						fpdLoadOrder(product, bulkVariations, dpSources);

					}
					else {

						fpdMessage(fpd_order_viewer.order_data_error_text, 'error');

					}

					$this.text($this.data('defaultText'));

				}
			});

		}

	});

	//EXPORT
	jQuery('[name="fpd_output_file"]').change(function() {

		jQuery('#fpd-pdf-width, #fpd-pdf-height').parent('label').show();
		jQuery('#fpd-pdf-include-text-summary').parents('tr').show();
		jQuery('[name="fpd_scale"]').parents('tr:first').show();
		jQuery('[name="fpd_view_start"]').parents('tr:first').show();

		if(this.value.search('pdf') == -1) {

			jQuery('#fpd-pdf-width, #fpd-pdf-height').parent('label').hide();
			jQuery('#fpd-pdf-include-text-summary').parents('tr:first').hide();

			if(this.value == 'svg') {
				jQuery('[name="fpd_scale"]').parents('tr:first').hide();
				jQuery('[name="fpd_view_start"]').parents('tr:first').hide();
			}

		}


	}).filter(':checked').change();

	jQuery('input[name="fpd_scale"]').on('keyup change', function() {

		var scale = !isNaN(this.value) && this.value.length > 0 ? this.value : 1,
			mmInPx = 3.779528;

		jQuery('#fpd-pdf-width').val(Math.round((stageWidth * scale) / mmInPx));
		jQuery('#fpd-pdf-height').val(Math.round((stageHeight * scale) / mmInPx));

	}).change();

	jQuery('#fpd-generate-file').click(function(evt) {

		evt.preventDefault();

		if(_checkAPI()) {
			createOutputFile(jQuery('[name="fpd_output_file"]').val());
		}

	});

	function createOutputFile(format) {

		if(format == 'svg') { //svg

			download(
				fancyProductDesigner.currentViewInstance.toSVG({suppressPreamble: false}),
				fpd_order_viewer.order_id+'.svg',
				'image/svg+xml'
			);

		}
		else {

			var start = parseInt(jQuery('[name="fpd_view_start"]').val()),
				end = parseInt(jQuery('[name="fpd_view_end"]').val());

			start = typeof start !== 'number' || start < 1 || start > fancyProductDesigner.viewInstances.length ? 1 : start;
			end = typeof end !== 'number' || end > fancyProductDesigner.viewInstances.length ? fancyProductDesigner.viewInstances.length : end;

			if(format.search('pdf')  > -1) {//pdf

				var pdfWidth = jQuery('#fpd-pdf-width').val(),
					pdfHeight = jQuery('#fpd-pdf-height').val();

				if(pdfWidth == '') {
					fpdMessage(fpd_order_viewer.no_width_text, 'error');
					return false;
				}
				else if(pdfHeight == '') {
					fpdMessage(fpd_order_viewer.no_height_text, 'error');
					return false;
				}

				fpdBlockPanel($tabsContent);

				function _renderData(embedData) {

					var summaryJSON = fancyProductDesigner.getProduct();

					embedData = embedData.slice(start-1, end);
					summaryJSON = summaryJSON.slice(start-1, end);

					jQuery.ajax({
						url: fpd_admin_opts.adminAjaxUrl,
						data: {
							action: 'fpd_pdffromdataurl',
							_ajax_nonce: fpd_admin_opts.ajaxNonce,
							embed_type: format,
							order_id: fpd_order_viewer.order_id,
							item_id: currentItemId,
							data_strings: JSON.stringify(embedData),
							width: pdfWidth,
							height: pdfHeight,
							orientation: stageWidth > stageHeight ? 'L' : 'P',
							summary_json: jQuery('#fpd-pdf-include-text-summary').is(':checked') ? JSON.stringify(summaryJSON) : ''
						},
						type: 'post',
						dataType: 'json',
						complete: function(data) {
							if(data == undefined || data.status != 200) {

								var message = '';
								if(data.responseJSON && data.responseJSON.message) {
									message += data.responseJSON.message;
								}
								message += '.\n';
								message += fpd_order_viewer.pdf_creation_fail_text;
								fpdMessage(message, 'error');

							}
							else {
								var json = data.responseJSON;
								if(json !== undefined) {
									window.open(json.url, '_blank');
								}
								else {
									fpdMessage(fpd_order_viewer.json_parse_error_text, 'error');
								}
							}

							fpdUnblockPanel($tabsContent);

						}
					});

				};

				if(format == 'pdf') {
					_renderData(fancyProductDesigner.getViewsSVG());
				}
				else {

					var multiplier = jQuery('input[name="fpd_scale"]').val().length == 0 ? 1 : Number(jQuery('input[name="fpd_scale"]').val());
					fancyProductDesigner.getViewsDataURL(function(dataURLs) {
						_renderData(dataURLs);
					}, backgroundColor, {format: format, multiplier: multiplier});

				}

			}
			else { //png, jpeg

				var backgroundColor = format == 'jpeg' ? '#ffffff' : 'transparent',
					multiplier = jQuery('input[name="fpd_scale"]').val().length == 0 ? 1 : Number(jQuery('input[name="fpd_scale"]').val());

				fancyProductDesigner.getProductDataURL(function(dataURL) {

					download(
						dataURL,
						fpd_order_viewer.order_id,
						'image/'+format
					);

				}, backgroundColor, {multiplier: multiplier, onlyExportable: true}, [start-1, end]);

			}

		}

	};



	//SINGLE ELEMENT IMAGES
	$customElementsList.on('click', 'li', function(evt) {

		evt.preventDefault();

		var index = $customElementsList.children('li').index(this);

		fancyProductDesigner.currentViewInstance.stage.setActiveObject(customElements[index].element).renderAll().calcOffset();

	});

	jQuery('[name="fpd_single_image_format"]').change(function() {

		if(this.value == 'jpeg') {
			jQuery('[name="fpd_single_element_dpi"]').parents('tr:first').show();
		}
		else {
			jQuery('[name="fpd_single_element_dpi"]').parents('tr:first').hide();
		}

	}).change();


	jQuery('#fpd-save-element-as-image').click(function(evt) {

		evt.preventDefault();

		if(_checkAPI()) {

			var scaleXTo1 = 1,
				scaleYTo1 = 1,
				stage = fancyProductDesigner.currentViewInstance.stage,
				format = jQuery('input[name="fpd_single_image_format"]:checked').val(),
				backgroundColor = format == 'jpeg' ? '#ffffff' : 'transparent',
				dataURLOpts = {
					format: format
				};

			if(stage.getActiveObject()) {

				var $this = jQuery(this),
					element = stage.getActiveObject(),
					tempScale = element.scaleX,
					tempWidth = stage.getWidth(),
					tempHeight = stage.getHeight(),
					dataObj;

				//element can not be saved as svg
				if(format == 'svg') {

					if(element.toSVG().search('<image') != -1) {
						fpdMessage(fpd_order_viewer.svg_bitmap_text, 'info');
						return false;
					}

				}

				fancyProductDesigner.deselectElement();

				//check if origin size should be rendered
				if(jQuery('#fpd-restore-oring-size').is(':checked')) {

					scaleXTo1 = (1 / element.scaleX);
					scaleYTo1 = (1 / element.scaleY);

					element.set('scaleX', 1);
					element.set('scaleY', 1);
				}

				stage.setBackgroundColor(backgroundColor, function() {

					var paddingTemp = element.padding;

					element.padding = jQuery('input[name="fpd_single_element_padding"]').val().length == 0 ? 0 : Number(jQuery('input[name="fpd_single_element_padding"]').val());

					var clipToTemp = element.clipTo;
					if(element.clippingRect) {

						if(!jQuery('#fpd-without-bounding-box').is(':checked')) {

							var elementPoint = element.getBoundingRect();
							dataURLOpts.left = (element.clippingRect.left - elementPoint.left) * scaleXTo1;
							dataURLOpts.top = (element.clippingRect.top - elementPoint.top) * scaleYTo1;
							dataURLOpts.width = element.clippingRect.width * scaleXTo1;
							dataURLOpts.height = element.clippingRect.height * scaleYTo1;

						}

						element.set('clipTo', null);

					}

					element.setCoords();

					var source = format == 'svg' ? source = element.toSVG() : element.toDataURL(dataURLOpts);

					//save on server
					if(jQuery('#fpd-save-on-server').is(':checked')) {

						fpdBlockPanel($tabsContent);

						if(format == 'svg') {

							dataObj = {
								action: 'fpd_imagefromsvg',
								_ajax_nonce: fpd_admin_opts.ajaxNonce,
								order_id: fpd_order_viewer.order_id,
								item_id: currentItemId,
								svg: source,
								width: stage.getWidth(),
								height: stage.getHeight(),
								title: element.title
							};

						}
						else {

							dataObj = {
								action: 'fpd_imagefromdataurl',
									_ajax_nonce: fpd_admin_opts.ajaxNonce,
									order_id: fpd_order_viewer.order_id,
									item_id: currentItemId,
									data_url: source,
									title: element.title,
									format: format,
									dpi: jQuery('[name="fpd_single_element_dpi"]').val().length == 0 ? 72 : jQuery('[name="fpd_single_element_dpi"]').val()
							};
						}

						jQuery.ajax({
							url: fpd_admin_opts.adminAjaxUrl,
							data: dataObj,
							type: 'post',
							dataType: 'json',
							complete: function(data) {

								var json = data.responseJSON;
								if(data.status != 200 || json.code == 500) {
									fpdMessage(fpd_order_viewer.image_creation_fail_text, 'error');
								}
								else if( json.code == 201 ) {
									$orderImageList.append('<li><a href="'+json.url+'" title="'+json.url+'" target="_blank">'+json.title+'.'+format+'</a></li>');
								}
								else {
									//prevent caching
									$orderImageList.find('a[title="'+json.url+'"]').attr('href', json.url+'?t='+new Date().getTime());
								}

								fpdUnblockPanel($tabsContent);

							}
						});

					}
					else { //dont save it on server

						if(format == 'svg') {

							var svgData = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="'+stage.getWidth()+'" height="'+stage.getHeight()+'" xml:space="preserve">'+element.toSVG()+'</svg>';

							download(
								svgData,
								element.title,
								'image/svg+xml'
							);

						}
						else {

							download(
								source,
								element.title,
								'image/'+format
							);

						}

					}

					element.set({scaleX: tempScale, scaleY: tempScale, padding: paddingTemp})
					.set('clipTo', clipToTemp)
					.setCoords();

					stage.setBackgroundColor('transparent')
					.setDimensions({width: tempWidth, height: tempHeight})
					.renderAll();

				});

			}
			else {
				fpdMessage(fpd_order_viewer.no_element_text, 'info');
			}
		}

	});

	jQuery('#fpd-create-new-fp').click(function(evt) {

		evt.preventDefault();

		if(	_checkAPI() ) {

			radykalConfirm({ msg: fpd_admin_opts.addToLibrary}, function(addToLibrary) {

				var options = {stage_width: stageWidth, stage_height: stageHeight};

				fpdBlockPanel($tabsContent);

				fpdAddProduct(function(data) {

					if(data) {

						fpdAddViews(
							data.id,
							fancyProductDesigner.getProduct(),
							addToLibrary,
							//view added
							function(data) {
							},
							//complete
							function() {
								fpdUnblockPanel($tabsContent);
							}
						);

					}
					else {
						fpdUnblockPanel($tabsContent);
					}

				}, options);

			});

		}

	});

	//DEPOSITPHOTOS
	jQuery('#fpd-dp-src-list').on('click', '.button-secondary[data-id]', function(evt) {

		evt.preventDefault();

		var $this = jQuery(this).addClass('fpd-disabled'),
			oldSrc = $this.parents('tr:first').find('img:first').attr('src');

		fancyProductDesigner.toggleSpinner(true, 'Requesting image from depositingphotos.com');
		fancyProductDesigner.getDepositPhotosPurchaseMedia(function(data) {

			if(data && data.downloadLink) {

				fancyProductDesigner.toggleSpinner(true, 'Downloading image to local server (wp-content/uploads/fpd_depositphotos)');

				jQuery.ajax({
					url: fpd_admin_opts.adminAjaxUrl,
					data: {
						action: 'fpd_downloaddpsource',
						_ajax_nonce: fpd_admin_opts.ajaxNonce,
						new_src: data.downloadLink,
						order_type: fpd_order_viewer.order_type
					},
					type: 'post',
					dataType: 'json',
					success: function(data) {

						fancyProductDesigner.toggleSpinner(true, 'Replacing image in canvas');

						var viewImages = fancyProductDesigner.getElements(fancyProductDesigner.currentViewIndex, 'image');
						viewImages.forEach(function(viewImage) {

							if(viewImage.source == oldSrc) {

								var tempWidth = viewImage.width,
									tempHeight = viewImage.height;

								viewImage.source = data.new_src;
								viewImage.setSrc(data.new_src, function() {

									viewImage.scaleToWidth(tempWidth * viewImage.scaleX);
									viewImage.scaleToHeight(tempHeight * viewImage.scaleY);
									viewImage.setCoords();
									viewImage.canvas.renderAll();

									viewImage.depositphotos.downloadedImage = data.new_src;
									fancyProductDesigner.toggleSpinner(false);
									$this.removeClass('fpd-disabled').removeAttr('data-id').attr('href', data.new_src).text('Downloaded');

									fpdMessage(data.message, 'success');

								});
							}

						});

					}

				});

			}
		},this.dataset.id, fpd_order_viewer.dp_username, fpd_order_viewer.dp_password, fpd_order_viewer.dp_image_size);

	});


	jQuery('#fpd-save-order').click(function(evt) {

		evt.preventDefault();

		if(_checkAPI()) {

			fancyProductDesigner.toggleSpinner(true);

			jQuery.ajax({
				url: fpd_admin_opts.adminAjaxUrl,
				data: {
					action: 'fpd_saveorder',
					_ajax_nonce: fpd_admin_opts.ajaxNonce,
					order_type: fpd_order_viewer.order_type,
					id: currentItemId ? currentItemId : fpd_order_viewer.order_id, //if wc, return order item ID, else the post ID
					order: JSON.stringify(fancyProductDesigner.getOrder()),
					print_order: fpd_order_viewer.automated_export_enabled ? JSON.stringify(fancyProductDesigner.getPrintOrderData()) : '',
					gf_field_id: typeof fpdGfHiddenInputID !== 'undefined' ? fpdGfHiddenInputID : null
				},
				type: 'post',
				dataType: 'json',
				success: function(data) {

					if(data && data.updated) {
						fpdMessage(data.message, 'success');
					}

					fancyProductDesigner.toggleSpinner(false);

				}

			});

		}


	});

	//PLUS
	var $nnActionBtn;
	$fancyProductDesigner.on('viewSelect', function(evt, viewIndex, viewInstance) {

		if(typeof FancyProductDesignerPlus !== 'undefined' && viewInstance.names_numbers) {

			if($nnActionBtn) {
				$nnActionBtn.show();
			}
			else {

				$nnActionBtn = $fancyProductDesigner.find('.fpd-actions-wrapper').append('<div class="fpd-action-nn fpd-action-btn fpd-tooltip fpd-primary-text-color" title="View Names & Numbers"><span class="fpd-icon-name-number"></span></div>').children('.fpd-action-nn');

				$nnActionBtn.click(function() {
					$fancyProductDesigner.find('.fpd-mainbar .fpd-navigation [data-module="names-numbers"]').click();
				});

			}

			FPDUtil.updateTooltip($fancyProductDesigner.find('.fpd-actions-wrapper'));

		}
		else if($nnActionBtn){
			$nnActionBtn.hide();
		}

	});

	function _checkAPI() {

		if(fancyProductDesigner.currentViewInstance && fancyProductDesigner.currentViewInstance.stage.getObjects().length > 0 && isReady) {
			return true;
		}
		else {
			fpdMessage(fpd_order_viewer.no_fp_select_text, 'error');
			return false;
		}

	};

});


function fpdLoadOrder(order, bulkVariations, dpSources) {

	if(typeof order !== 'object') { return false; }

	loadingProduct = true;
	$orderImageList.empty();
	fancyProductDesigner.reset();

	stageWidth = (order[0].options === undefined || order[0].options.stageWidth === undefined) ? stageWidth : order[0].options.stageWidth;
	stageHeight = (order[0].options === undefined || order[0].options.stageHeight === undefined) ? stageHeight : order[0].options.stageHeight;

	jQuery('input[name="fpd_scale"]').keyup();

	fancyProductDesigner.loadProduct(order);

	jQuery.ajax({

		url: fpd_admin_opts.adminAjaxUrl,
		data: {
			action: 'fpd_loadorderitemimages',
			_ajax_nonce: fpd_admin_opts.ajaxNonce,
			order_id: fpd_order_viewer.order_id,
			item_id: currentItemId
		},
		type: 'post',
		dataType: 'json',
		success: function(data) {

			if(data == undefined || data.code == 500) {

				fpdMessage(fpd_order_viewer.load_order_error_text, 'info');

			}
			//append order item images to list
			else if( data.code == 200 ) {

				for (var i=0; i < data.images.length; ++i) {
					var title = data.images[i].substr(data.images[i].lastIndexOf('/')+1);
					$orderImageList.append('<li><a href="'+data.images[i]+'" title="'+data.images[i]+'" target="_blank" >'+title+'</a></li>');
				}

			}

		}

	});

	//PLUS
	var $bulkVariationsBody = jQuery('#bulk-variations-tbody').empty();
	if(bulkVariations && Array.isArray(bulkVariations)) {

		jQuery('.radykal-tabs-nav a[href="bulk-add-variations"]').removeClass('fpd-hidden');

		for(var i=0; i<bulkVariations.length; ++i) {

			var variationItem = bulkVariations[i],
				variation = JSON.stringify(variationItem.variation);

			variation = variation.replace(/\{|\}|\"/gi, '').replace(',', ', ');
			$bulkVariationsBody.append('<tr><td>'+variation+'</td><td>'+variationItem.quantity+'</td></tr>');

		}

	}

	//DEPOSITPHOTOS
	var $dpList = jQuery('#fpd-dp-src-list').empty();
	if(dpSources && Array.isArray(dpSources)) {

		jQuery('.radykal-tabs-nav a[href="depositphotos"]').removeClass('fpd-hidden');

		for(var i=0; i<dpSources.length; ++i) {

			var dpItem = dpSources[i],
				actionBtn = '<a class="button-secondary" href="#" target="_blank" data-id="'+dpItem.depositphotos.id+'">Download & Replace</a>';

			if(dpItem.depositphotos.downloadedImage) {
				actionBtn = '<a class="button-secondary" href="'+dpItem.depositphotos.downloadedImage+'" target="_blank">Downloaded</a>';
			}

			$dpList.append('<tr><td><img src="'+dpItem.source+'" /></td><td><a href="'+dpItem.depositphotos.itemURL+'" target="_blank"><span>'+dpItem.depositphotos.id+'</span><i class="dashicons dashicons-external"></i></a></td><td>'+actionBtn+'</td></tr>')

		}

	}

};