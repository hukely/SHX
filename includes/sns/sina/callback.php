<?php
	header("Content-type:text/html; charset=UTF-8;");
	require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/saetv2.ex.class.php');

	$o = new SaeTOAuthV2( WB_AKEY , WB_SKEY );
	if (isset($_REQUEST['code'])) {
		$keys = array();
		$keys['code'] = $_REQUEST['code'];
		$keys['redirect_uri'] = WB_CALLBACK_URL;
		try {
			$token = $o->getAccessToken( 'code', $keys ) ;
		} catch (OAuthException $e) {
		}
	}
	$c = new SaeTClientV2(WB_AKEY, WB_SKEY, $token['access_token'], '');
        if (!$token) {
            $this->error('登录失败,再登一次！');
            exit;
        }
       
        $_SESSION['token'] = $token;
        $_SESSION['access_token'] = $token['access_token'];
        $_SESSION['openid'] = $token['uid'];
        $user_openid = $this->user_openid_mod->where("openid='" . $token['uid'] . "'")->find();

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
            $res = $c->show_user_by_id($token['uid']);
            if ($res['error_code'] == 21321) {
                $this->error('新浪微博网站接入审核未通过，无法获取该账户资料！');
                exit;
            }
            $sina_info = array('user_info' => $res);
            $data = array(
                'name' => $res['screen_name'],
                'img' => $res['profile_image_url'],
                'last_time' => time(),
                'last_ip' => $_SERVER['REMOTE_ADDR'],
                'add_time' => time(),
                'ip' => $_SERVER['REMOTE_ADDR'],
            );
            $_SESSION['user_id'] = $this->user_mod->add($data);
            $data = array(
                'type' => 'sina',
                'uid' => $_SESSION['user_id'],
                'openid' => $_SESSION['openid'],
                'info' => serialize($sina_info),
            );
            $this->user_openid_mod->add($data);
            header('Location:' . U('uc/sign'));
            exit;
        }
        $_SESSION['login_type'] = 'sina';
     header('Location:' . urldecode($_COOKIE['redirect']));