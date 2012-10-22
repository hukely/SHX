<?php
header("Content-type:text/html; charset=UTF-8;");
$aScope = 'publish_feed,photo_upload';
$sState = md5(date("YmdHis".rand(0,10000)));
$_SESSION["state"] = $sState;
$code_url = "https://graph.renren.com/oauth/authorize?client_id=".WB_AKEY."&response_type=code&scope=".$aScope."&state=".$sState."&redirect_uri=".WB_CALLBACK_URL."&x_renew=true";

COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header('Location:'.$code_url);
