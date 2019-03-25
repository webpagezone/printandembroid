<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'webpage1_pae');

/** MySQL database username */
define('DB_USER', 'webpage1_pae');

/** MySQL database password */
define('DB_PASSWORD', '83fY8h@S)p');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ncjxyidtbfrcfphee7vqwspvyrdln6iaepqjt3bbzw34i6goz2ho60iz66np0j2g');
define('SECURE_AUTH_KEY',  'pve4eao0jzi2jwcn0igsv8qf6s7gfpnquhlewfmqgtck7lklpotcbhbqa152prf7');
define('LOGGED_IN_KEY',    'sa54xboo8blnqkmywnlx1wue76oiyadyandya4ztyuxivws6kuvl6dcgfb83oci9');
define('NONCE_KEY',        'jsz6pcvtc8ifoykvnrlkwiisyvy14vnaejljfgmpuctuayqq2hkecyajvz2afvz0');
define('AUTH_SALT',        'xns91bozrkrrgi5ymn2kjnwrvjeq9zuqq9zbtou9duf1fw7sx19dcmpfymvtsk8k');
define('SECURE_AUTH_SALT', 'nkc8wjzab0haxrkzua60wtqgf5dqvmnt5ngkra88xfimexl6zpjgihsjfxgoui2r');
define('LOGGED_IN_SALT',   'vin2sx4nccxbynuoik476xdvi21gzu0rqx7wgqy6du1egpchkvwfwqavps2pmidc');
define('NONCE_SALT',       'jcznkvc0tbuh9julon4h2puqnnyesthitu8e0mlcxnnrqwsf53gv5yi1tub0rizf');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'pae_';


/* Multisite */
//define( 'WP_ALLOW_MULTISITE', true );

define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'printandembroid.com');
define('PATH_CURRENT_SITE', '/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);


/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
