<?php
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/tblog.class.php');

$oauth = new OAuth( WB_AKEY, WB_SKEY , $_SESSION['request_token']['oauth_token'] , $_SESSION['request_token']['oauth_token_secret']  );

if ($access_token = $oauth->getAccessToken($_REQUEST['oauth_token'])) {	
	$user = $oauth->get('http://api.t.163.com/users/show.json');
	var_dump($user);
}else{
    $this->error("授权失败");
}
