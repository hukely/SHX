<?php
//此为集成帐号登录,免验证.得到的信息有限.callback副本为调用完整淘宝api的例子
header("Content-type:text/html; charset=UTF-8;");
if(base64_encode(md5($_GET['top_parameters'].WB_SKEY, true)) == $_GET['top_sign']) {
	$str = explode('&', base64_decode($_GET['top_parameters']));
	foreach($str as $v) {
		$array = array();
		$array = explode('=', $v);
		$user[$array[0]] = $array[1];
	}

    $_SESSION['openid'] = $user['user_id'];		//为获取授权,吧uid当做openid
    $user_openid = $this->user_openid_mod->where("openid='" . $user['user_id'] . "'")->find();

        $is_new = false;
        if ($user_openid) {
            if ($this->user_mod->where('id=' . $user_openid['uid'])->count() > 0) {
                $_SESSION['user_id'] = $user_openid['uid'];
                $data = array('last_time' => time(), 'last_ip' => $_SERVER['REMOTE_ADDR']);
                $this->user_mod->where('id=' . $_SESSION['user_id'])->save($data);
            } else {
                $this->user_openid_mod->where("openid='" . $user['user_id'] . "'")->delete();
                $is_new = true;
            }
        } else {
            $is_new = true;
        }
       	// $user['nick'];
    // $user['user_id'];
        if ($is_new) {
            $sina_info = array('user_info' => $user);
            $data = array(
                'name' => $user['nick'],
               // 'img' => $res['profile_image_url'],
                'last_time' => time(),
                'last_ip' => $_SERVER['REMOTE_ADDR'],
                'add_time' => time(),
                'ip' => $_SERVER['REMOTE_ADDR'],
            );
            $_SESSION['user_id'] = $this->user_mod->add($data);
            $data = array(
                'type' => 'taobao',
                'uid' => $_SESSION['user_id'],
                'openid' => $_SESSION['openid'],
                'info' => serialize($sina_info),
            );
            $this->user_openid_mod->add($data);
            header('Location:' . U('uc/sign'));
            exit;
        }
        $_SESSION['login_type'] = 'taobao';
		header('Location:' . urldecode($_COOKIE['redirect']));
		exit;
}else{
	$this->error{'登入校验失败,请重新登入'};
}