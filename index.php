<?php
/**
 * All page enter.
 */

require '/Users/Wzy/GitHub/cabbit.me/smarty/Smarty.class.php';

$smarty = new Smarty;

$smarty->debugging = false;
$smarty->caching = true;
$smarty->cache_lifetime = 120;

$smarty->template_dir = "templates/";
$smarty->compile_dir = "bin/templates_c/";
$smarty->cache_dir = "bin/cache/";
$smarty->config_dir = "smarty/config/";

$smarty->display('index.tpl');
