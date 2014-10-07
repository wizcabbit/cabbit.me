<?php
/**
 * All page enter.
 */

// Initialize smary compnent
require '/Users/Wzy/GitHub/cabbit.me/smarty/Smarty.class.php';

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
$smarty->assign('WEB_ROOT', '//localhost/test');

// Route all project page to unique template
$projName = $_GET['proj'];
if (empty($projName)) {
  $smarty->display('index.tpl');
} else {
  $smarty->display('projects/' . $projName . '.tpl');
}
