<?php

$activate_url = wp_nonce_url(
		Jetpack::admin_url(
			array(
				'page'   => 'jetpack',
				'action' => 'activate',
				'module' => 'manage',
			)
		),
		'jetpack_activate-manage'
	);

$section = isset( $_GET['section'] ) ? $_GET['section'] : null;

switch( $section ) {
	case 'plugins':
		$description = __( 'Just one more step before your plugins can be managed with WordPress.com. Click the button below and you\'ll be managing all of your plugins in one place.', 'jetpack' );
		break;

	case 'themes':
		$description = __( 'Just one more step before your themes can be managed with WordPress.com. Click the button below and you\'ll be managing your themes with our newly-redesigned user interface.', 'jetpack' );
		break;

	case 'security-settings':
		$description = __( 'Just one more step before your site can be secured by Jetpack and WordPress.com. Click the button below and you\'ll be safe and secure.', 'jetpack' );
		break;

	case 'menus':
		$description = __( 'Just one more step before your menus can be managed with WordPress.com. Click the button below and you\'ll be managing your menus with our newly-redesigned user interface.', 'jetpack' );
		break;

	default:
		$description = __( 'Just one more step before you can manage your site from WordPress.com! Click the button below and you will be good to go.', 'jetpack' );
		break;
}
?>
<div class="page-content landing manage-page">
	<div class="manage__icon">
		<svg width="149px" height="152px" viewBox="0 0 149 152" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
			<defs>
				<path id="path-1" d="M0,71.073 C0,76.696 0.677,82.16 1.919,87.407 L1.919,87.407 C3.934,87.957 6.074,88.157 8.155,88.025 L8.155,88.025 C24.965,86.955 36.859,74.293 47.988,63.218 L47.988,63.218 C48.289,62.92 53.255,57.979 53.255,57.979 L53.255,57.979 L59.009,63.704 C57.815,65.8 56.424,67.737 54.931,69.599 L54.931,69.599 L62.616,77.245 L25.84,113.838 L27.16,115.152 L20.938,121.344 C33.862,134.197 51.711,142.146 71.428,142.146 L71.428,142.146 C110.876,142.146 142.855,110.324 142.855,71.073 L142.855,71.073 C142.855,31.82 110.876,0 71.428,0 L71.428,0 C31.981,0 0,31.82 0,71.073 L0,71.073 Z"></path>
				<path id="path-3" d="M86.3139508,20.091 C86.3139508,20.091 79.5099508,25.071 79.0589508,25.741 L79.0589508,25.741 C78.6099508,26.414 80.8579508,31.113 81.3339508,31.311 L81.3339508,31.311 C81.8099508,31.511 90.6089508,31.19 90.6089508,31.19 L90.6089508,31.19 L93.5729508,25.793 L87.6959508,20 L86.3139508,20.091 Z"></path>
				<path id="path-5" d="M66.647,37.5820009 L45,59.1230009 L56.227,70.2960009 L84.141,42.5210009 L79.239,37.6450009 L79.176,37.5810009 C77.447,35.8600009 75.18,35.0000009 72.913,35.0000009 L72.913,35.0000009 C70.645,34.9990009 68.378,35.8600009 66.647,37.5820009 L66.647,37.5820009 Z"></path>
				<path id="path-7" d="M66.647,37.583 L45,59.124 L56.227,70.297 L84.141,42.522 L79.239,37.646 L79.176,37.582 C77.446,35.861 75.179,35 72.913,35 L72.913,35 C70.645,35 68.378,35.862 66.647,37.583 L66.647,37.583 Z"></path>
				<path id="path-9" d="M120.282,10.301 L120.282,13.022 L110.081,18.113 C104.759,20.77 100.242,24.716 96.875,29.537 L96.875,29.537 L92.488,25.171 L92.483,25.176 L89.051,28.591 C87.765,29.87 85.678,29.87 84.391,28.591 L84.391,28.591 L83.012,27.218 C82.346,26.556 82.346,25.48 83.012,24.818 L83.012,24.818 L87.547,20.305 C87.542,20.301 87.534,20.295 87.528,20.291 L87.528,20.291 L87.524,20.287 L87.524,20.287 C84.951,18.223 81.176,18.38 78.786,20.757 L78.786,20.757 L70.383,29.12 L78.874,37.568 C72.917,38.942 67.877,42.912 65.183,48.41 L65.183,48.41 L56.378,66.386 C49.275,69.043 43.6,74.775 41.15,82.172 L41.15,82.172 L34.145,103.322 L32.701,104.036 C25.038,107.817 18.832,113.993 15.03,121.619 L15.03,121.619 L9.602,132.506 L5.467,131.505 C3.76,131.093 2.039,132.136 1.625,133.835 L1.625,133.835 L-2,148.679 L5.021,141.693 L5.021,141.695 L53.777,93.18 C55.035,94.022 56.367,94.764 57.768,95.395 L57.768,95.395 L77.103,104.096 C71.971,104.937 67.023,106.788 62.568,109.584 L62.568,109.584 L52.321,116.022 L49.487,113.199 C48.348,112.067 46.503,112.067 45.365,113.199 L45.365,113.199 L34.877,123.636 L43.525,121.545 L43.522,121.548 L75.442,113.837 L83.03,112.004 C84.574,111.623 85.867,110.861 86.869,109.863 L86.869,109.863 C89.91,106.837 90.282,101.634 86.872,98.24 L86.872,98.24 L67.993,79.456 L73.85,75.054 L96.733,75.055 L96.732,75.054 L96.858,75.054 C97.996,75.055 99.003,74.501 99.628,73.652 L99.628,73.652 C99.637,73.639 99.648,73.628 99.658,73.617 L99.658,73.617 L99.655,73.615 C100.053,73.057 100.291,72.376 100.291,71.639 L100.291,71.639 L100.291,68.398 C100.291,67.355 99.442,66.509 98.393,66.509 L98.393,66.509 L95.136,66.509 C93.24,66.509 91.703,68.039 91.704,69.926 L91.704,69.926 L91.704,70.989 L85.174,68.831 C84.449,68.592 83.717,68.383 82.981,68.191 L82.981,68.191 L85.502,66.297 C89.664,63.17 92.118,58.29 92.14,53.1 L92.14,53.1 L92.176,44.73 L131.098,6.001 L124.605,6 C122.219,6.001 120.282,7.926 120.282,10.301 L120.282,10.301 Z"></path>
			</defs>
			<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
			<g id="Artboard-1-Copy" sketch:type="MSArtboardGroup">
				<g id="Group" sketch:type="MSLayerGroup" transform="translate(3.000000, 5.000000)">
					<path d="M71.427,0 C31.98,0 0,31.82 0,71.073 C0,76.696 0.676,82.16 1.918,87.408 C3.933,87.958 6.074,88.158 8.154,88.025 C24.965,86.955 36.858,74.294 47.987,63.219 C48.289,62.92 53.254,57.979 53.254,57.979 L59.009,63.705 C57.814,65.8 56.423,67.737 54.93,69.6 L62.615,77.245 L25.839,113.838 L27.159,115.153 L20.937,121.344 C33.861,134.197 51.711,142.146 71.427,142.146 C110.875,142.146 142.854,110.324 142.854,71.073 C142.854,31.82 110.875,0 71.427,0" id="Fill-1" sketch:type="MSShapeGroup"></path>
					<mask id="mask-2" sketch:name="Clip 4" fill="white">
						<use xlink:href="#path-1"></use>
					</mask>
					<g id="Clip-4"></g>
					<path d="M-163,194 L305,194 L305,-285 L-163,-285 L-163,194 Z" id="Fill-3" fill="#8CC257" sketch:type="MSShapeGroup" mask="url(#mask-2)"></path>
					<path d="M-5,-5 L147.855,-5 L147.855,147.146 L-5,147.146 L-5,-5 Z" id="Fill-5" fill="#8CC257" sketch:type="MSShapeGroup" mask="url(#mask-2)"></path>
					<mask id="mask-4" sketch:name="Clip 8" fill="white">
						<use xlink:href="#path-3"></use>
					</mask>
					<g id="Clip-8"></g>
					<path d="M74,15 L98.572,15 L98.572,36.377 L74,36.377 L74,15 Z" id="Fill-7" fill="#FFFFFF" sketch:type="MSShapeGroup" mask="url(#mask-4)"></path>
					<path d="M66.648,37.582375 L45,59.123375 L56.227,70.295375 L84.141,42.520375 L79.24,37.645375 L79.177,37.581375 C75.717,34.139375 70.108,34.139375 66.648,37.582375" id="Fill-10" fill="#B2B2B2" sketch:type="MSShapeGroup" mask="url(#mask-4)"></path>
					<mask id="mask-6" sketch:name="Clip 13" fill="white">
						<use xlink:href="#path-5"></use>
					</mask>
					<g id="Clip-13"></g>
					<path d="M-163,194 L305,194 L305,-285 L-163,-285 L-163,194 Z" id="Fill-12" fill="#B2B2B2" sketch:type="MSShapeGroup" mask="url(#mask-6)"></path>
					<mask id="mask-8" sketch:name="Clip 16" fill="white">
						<use xlink:href="#path-7"></use>
					</mask>
					<g id="Clip-16"></g>
					<path d="M40,30 L89.141,30 L89.141,75.295 L40,75.295 L40,30 Z" id="Fill-15" fill="#498E0B" sketch:type="MSShapeGroup" mask="url(#mask-8)"></path>
					<path d="M124.606,6 C122.219,6.001 120.283,7.926 120.283,10.302 L120.283,13.023 L110.082,18.113 C104.761,20.77 100.243,24.717 96.876,29.538 L92.488,25.172 L92.484,25.176 L89.052,28.591 C87.765,29.871 85.679,29.871 84.392,28.591 L83.013,27.219 C82.347,26.556 82.347,25.481 83.013,24.819 L87.548,20.306 C87.542,20.301 87.535,20.296 87.529,20.291 L87.526,20.288 L87.524,20.288 C84.951,18.224 81.176,18.38 78.787,20.758 L70.384,29.12 L78.875,37.569 C72.917,38.943 67.877,42.913 65.184,48.411 L56.379,66.386 C49.276,69.044 43.601,74.776 41.151,82.173 L34.147,103.323 L32.702,104.036 C25.039,107.818 18.833,113.994 15.031,121.619 L9.603,132.507 L5.468,131.506 C3.761,131.094 2.04,132.137 1.625,133.835 L-2,148.68 L5.021,141.693 L5.021,141.696 L53.778,93.181 C55.035,94.023 56.368,94.765 57.769,95.395 L77.104,104.096 C71.971,104.937 67.024,106.788 62.569,109.585 L52.322,116.022 L49.487,113.2 C48.349,112.068 46.504,112.068 45.366,113.2 L34.878,123.637 L43.526,121.546 L43.523,121.548 L75.443,113.837 L83.03,112.005 C84.575,111.624 85.867,110.862 86.87,109.864 C89.911,106.838 90.283,101.634 86.873,98.241 L67.994,79.456 L73.85,75.054 L96.734,75.055 L96.733,75.054 L96.859,75.054 C97.997,75.055 99.004,74.502 99.628,73.652 C99.638,73.639 99.649,73.629 99.659,73.617 L99.655,73.616 C100.054,73.057 100.292,72.377 100.292,71.64 L100.292,68.399 C100.292,67.356 99.443,66.51 98.394,66.51 L95.137,66.51 C93.241,66.51 91.704,68.04 91.705,69.926 L91.705,70.989 L85.174,68.832 C84.45,68.592 83.718,68.383 82.982,68.192 L85.503,66.298 C89.665,63.171 92.119,58.29 92.141,53.101 L92.176,44.731 L131.099,6.001 L124.606,6" id="Fill-18" sketch:type="MSShapeGroup" mask="url(#mask-8)"></path>
					<mask id="mask-10" sketch:name="Clip 21" fill="white">
						<use xlink:href="#path-9"></use>
					</mask>
					<g id="Clip-21"></g>
						<path d="M-163,194 L305,194 L305,-285 L-163,-285 L-163,194 Z" id="Fill-20" fill="#214703" sketch:type="MSShapeGroup" mask="url(#mask-10)"></path>
						<path d="M-7,1 L136.099,1 L136.099,153.68 L-7,153.68 L-7,1 Z" id="Fill-22" sketch:type="MSShapeGroup" mask="url(#mask-10)"></path>
					</g>
				</g>
			</g>
		</svg>
	</div>
	<h1 class="manage__title"><?php esc_html_e( __( 'Enable Jetpack Manage', 'jetpack' ) ); ?></h1>
	<p class="manage__description">
		<?php esc_html_e( $description, 'jetpack' ); ?>
	</p>
	<p class="manage__description">
		<a class="button-primary manage__button" href="<?php echo esc_url( $activate_url ) ?>">
    		<?php esc_html_e( __( 'Enable Jetpack Manage Now', 'jetpack' ) ); ?>
		</a>
	</p>
</div>
