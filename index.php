<?php
/**
 * All page enter.
 */

$WEB_PATH = dirname(__FILE__);
<<<<<<< HEAD
$WEB_ROOT = '//test.cabbit.me/141014/';
=======
$WEB_ROOT = '//192.168.1.104/test';
>>>>>>> develop


// Initialize smary compnent
require 'smarty/Smarty.class.php';

$smarty = new Smarty;
$smarty->debugging = false;
$smarty->caching = true;
$smarty->cache_lifetime = 120;

// Initialize smarty directory configurations
$smarty->template_dir = 'templates/';
$smarty->compile_dir = 'bin/templates_c/';
$smarty->cache_dir = 'bin/cache/';
$smarty->config_dir = 'smarty/config/';

// Initialize root path
$smarty->assign('WEB_ROOT', $WEB_ROOT);

// Route all project pages to unique template
if (isset($_GET['proj'])) {
  $proj_name = $_GET['proj'];
  $proj_template = $WEB_PATH . '/templates/projects/' . $proj_name . '.tpl';
  if (file_exists($proj_template)) {
    $smarty->display($proj_template);
  } else {
    // TODO: 404 page.
  }
} else {
  $smarty->display('index.tpl');
}
