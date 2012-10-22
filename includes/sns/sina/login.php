<?php
header("Content-type:text/html; charset=UTF-8;");
include_once( ROOT_PATH.'/includes/sns/'.$this->sns.'/saetv2.ex.class.php' );
$o = new SaeTOAuthV2( WB_AKEY , WB_SKEY );
$code_url = $o->getAuthorizeURL( WB_CALLBACK_URL );
COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header('Location:'.$code_url);