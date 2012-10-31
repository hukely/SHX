<?php
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/tblog.class.php');
COOKIE('redirect', $_SERVER['HTTP_REFERER']);
$oauth = new OAuth(WB_AKEY, WB_SKEY);
$request_token = $oauth->getRequestToken();
$aurl = $oauth->getAuthorizeURL( $request_token['oauth_token'], WB_CALLBACK_URL);
$_SESSION['request_token'] = $request_token;

echo("<script> top.location.href='" . $aurl . "'</script>");