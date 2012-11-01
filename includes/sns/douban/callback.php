<?php
	if(isset($_GET['error'])) {
		$this->redirect('uc/login', '', 3, $_GET['error']);
	}
	$url='https://www.douban.com/service/auth2/token?client_id='.WB_AKEY.'&client_secret='.WB_SKEY.'&redirect_uri='.WB_CALLBACK_URL.'&grant_type=authorization_code&code='.$_GET['code'];
	$result = _http($url, '', 'post');
	$openID = json_decode($result, true);
	if(!empty($openID["douban_user_id"])) {
		$info = _http('https://api.douban.com/v2/user/~me', array('Authorization: Bearer '.$openID['access_token']));
		$user = json_decode($info, true);
	}else{
		$this->error('授权出错,请重新登陆!');
	}

    $user_openid = $this->user_openid_mod->where("openid='" . $user['id'] . "'")->find();

    $is_new = false;
	if ($user_openid) {
		if ($this->user_mod->where('id=' . $user_openid['uid'])->count() > 0) {
			$_SESSION['user_id'] = $user_openid['uid'];
			$data = array('last_time' => time(), 'last_ip' => $_SERVER['REMOTE_ADDR']);
			$this->user_mod->where('id=' . $_SESSION['user_id'])->save($data);
		} else {
			$this->user_openid_mod->where("openid='" . $token['uid'] . "'")->delete();
			$is_new = true;
		}
	} else {
		$is_new = true;
	}
  
	if ($is_new) {
		$douban_info = array('user_info' => $user);
		$data = array(
			'name' => $user['name'],
			'img' => $user['avatar'],
			'last_time' => time(),
			'last_ip' => $_SERVER['REMOTE_ADDR'],
			'add_time' => time(),
			'ip' => $_SERVER['REMOTE_ADDR']
		);
		$_SESSION['user_id'] = $this->user_mod->add($data);
		$data = array(
			'type' => 'douban',
			'uid' => $_SESSION['user_id'],
			'openid' => $user['id'],
			'info' => serialize($douban_info),
		);
		$this->user_openid_mod->add($data);
		header('Location:' . U('uc/sign'));
		exit;
	}
	$_SESSION['login_type'] = 'douban';
 //header('Location:' . urldecode($_COOKIE['redirect']));
 echo("<script> top.location.href='" . urldecode($_COOKIE['redirect']) . "'</script>");

/*用curl向豆瓣请求信息*/
function _http($url, $data =null,  $type='') {
	$ch = curl_init();
	/* cURL settings */
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 300);
	curl_setopt($ch, CURLOPT_TIMEOUT, 300);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_HEADER, false);
	$data != null && curl_setopt($ch, CURLOPT_HTTPHEADER, $data);
	curl_setopt($ch, CURLOPT_URL,$url);
	if($type == 'post') {
		curl_setopt($ch, CURLOPT_POST, 1); 
		if ($data != null) {
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		}
	}
	$res = curl_exec($ch);
	curl_close($ch);
	return $res;
}