<?php
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/tblog.class.php');

$oauth = new OAuth( WB_AKEY, WB_SKEY , $_SESSION['request_token']['oauth_token'] , $_SESSION['request_token']['oauth_token_secret']  );

if ($access_token = $oauth->getAccessToken($_REQUEST['oauth_token'])) {	
	$user = $oauth->get('http://api.t.163.com/users/show.json');
	 $user_openid = $this->user_openid_mod->where("openid='" . $user['id'] . "'")->find();	
	$is_new = false;
	if ($user_openid) {
		if ($this->user_mod->where('id=' . $user_openid['uid'])->count() > 0) {
			$_SESSION['user_id'] = $user_openid['uid'];
			$data = array('last_time' => time(), 'last_ip' => $_SERVER['REMOTE_ADDR']);
			$this->user_mod->where('id=' . $_SESSION['user_id'])->save($data);
		} else {
			$this->user_openid_mod->where("openid='" . $user['id'] . "'")->delete();
			$is_new = true;
		}
	} else {
		$is_new = true;
	}
   
	if ($is_new) {
		$net_info = array('user_info' => $user);
		$data = array(
			'name' => $user['name'],
			'img' => $user['profile_image_url'],
			'last_time' => time(),
			'last_ip' => $_SERVER['REMOTE_ADDR'],
			'add_time' => time(),
			'ip' => $_SERVER['REMOTE_ADDR'],
		);
		$_SESSION['user_id'] = $this->user_mod->add($data);
		$data = array(
			'type' => '163',
			'uid' => $_SESSION['user_id'],
			'openid' => $user['id'],
			'info' => serialize($net_info),
		);
		$this->user_openid_mod->add($data);
		header('Location:' . U('uc/sign'));
		exit;
	}
	$_SESSION['login_type'] = '163';
    // header('Location:' . urldecode($_COOKIE['redirect']));
	 echo("<script> top.location.href='" . urldecode($_COOKIE['redirect']) . "'</script>"); 
	 
}else{
    $this->error("授权失败");
}
