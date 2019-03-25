<?php

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly

if( !class_exists('FPD_Designs') ) {

	class FPD_Designs {

		public $category_ids;
		public $default_image_options;

		private $designs_json = array();

		public function __construct( $category_ids, $default_image_options ) {

			$this->category_ids = $category_ids;
			$this->default_image_options = $default_image_options;

		}

		private function category_loop( $categories, $next_category=array() ) {

			foreach( $categories as $category ) {

				$category_obj = array(
					'title' => $category->name,
					'thumbnail' => get_option('fpd_category_thumbnail_url_'.$category->term_id, '')
				);

				if( isset($category->children) && sizeof($category->children) ) {

					$category_obj['category'] = array();
					$category_obj['category'] = $this->category_loop( $category->children, $category_obj['category'] );

				}
				else {

					$category_obj['designs'] = array();


					//general parameters
					$general_parameters_array = $this->default_image_options;
					$final_parameters = array();

					//get attachments from fancy design category
					$args = array(
						 'posts_per_page' => -1,
						 'post_type' => 'attachment',
						 //'orderby' => 'menu_order',
						 'orderby' => 'meta_value_num',
                         'meta_key' => "{$category->slug}_order",
						 'order' => 'ASC',
						 'fpd_design_category' => $category->slug
					);
					$designs = get_posts( $args );

					//category parameters
					$category_parameters_array = array();
					$category_parameters = get_option( 'fpd_category_parameters_'.$category->slug );
					if( strpos($category_parameters, 'enabled') !== false ) {
						//convert string to array
						parse_str($category_parameters, $category_parameters_array);
					}

					if(is_array($designs)) {
						foreach( $designs as $design ) {

							//merge general parameters with category parameters
							$final_parameters = array_merge( $general_parameters_array, $category_parameters_array );

							//single element parameters
							$single_design_parameters = get_post_meta($design->ID, 'fpd_parameters', true);
							if( strpos($single_design_parameters, 'enabled') !== false ) {
								$single_design_parameters_array = array();
								parse_str($single_design_parameters, $single_design_parameters_array);
								$final_parameters = $single_design_parameters_array;
							}

							//get design thumbnail
							$design_thumbnail = get_post_meta($design->ID, 'fpd_thumbnail', true); //custom thumbnail
							if( empty($design_thumbnail) ) {
								$design_thumbnail = wp_get_attachment_image_src( $design->ID, 'medium' );
								$design_thumbnail = $design_thumbnail[0] ? $design_thumbnail[0] : $design->guid;
							}

							$origin_image = wp_get_attachment_image_src( $design->ID, 'full' );
							$origin_image = $origin_image[0] ? $origin_image[0] : $design->guid;

							if( isset($origin_image) ) {

								$category_obj['designs'][] = array(
									'source' => $origin_image,
									'title' => $design->post_title,
									'thumbnail' => $design_thumbnail,
									'parameters' => FPD_Parameters::to_json($final_parameters, 'image', false)
								);

							}

						}

					}

				}

				array_push($next_category, $category_obj);

			}

			return $next_category;

		}

		public function get_json() {


			$categories = get_terms('fpd_design_category', array(
				'hide_empty' => false,
				'include'	=> $this->category_ids
			));

			if( isset($this->category_ids) && !empty($this->category_ids) ) {

				//single id is returned as string, cast to array
				$this->category_ids = is_string($this->category_ids) ? str_split($this->category_ids, strlen($this->category_ids)) : $this->category_ids;

				foreach($this->category_ids as $category_id) {

					//get children ids
					$term_children_ids = get_term_children( $category_id, 'fpd_design_category' );

					//get term children
					if( !empty($term_children_ids) ) {
						$term_children = get_terms('fpd_design_category', array(
							'hide_empty' => false,
							'include'	=> $term_children_ids
						));

						//merge into categories
						$categories = array_merge($categories, $term_children);
					}

				}

			}

			$category_hierarchy = array();
			fpd_sort_terms_hierarchicaly($categories, $category_hierarchy);

			$designs_json = $this->category_loop( $category_hierarchy );

			if( !is_array($designs_json) )
				$designs_json = array();

			return json_encode($designs_json, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES );

		}

	}

}