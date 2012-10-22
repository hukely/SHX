<?php
header("Content-type:text/html; charset=UTF-8;");
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/config.inc.php');
$sState = md5(date("YmdHis".rand(0,10000)));
$_SESSION["state"] = $sState;
$code_url = "https://graph.renren.com/oauth/authorize?client_id=".$config->APIKey."&response_type=code&scope=".$config->scope."&state=".$sState."&redirect_uri=".$config->redirecturi."&x_renew=true";

COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header('Location:'.$code_url);
