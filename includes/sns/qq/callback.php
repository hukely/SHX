<?php
    header("Content-type:text/html; charset=UTF-8;");
    require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/function.php');

    //if(!isset($_GET["state"])||empty($_GET["state"])||!isset($_GET["code"])||empty($_GET["code"])){
    //    echo "QQ第一步获取参数失败。<br />";
    //}else{
	//	if($_GET["state"]!=$_SESSION["state"]){
	//		echo "网站获取用于第三方应用防止CSRF攻击失败。<br />";
	//		exit;
	//	}
	if ($_REQUEST['state'] == $_SESSION['state']) { 
		$sUrl = "https://graph.qq.com/oauth2.0/token";
		$aGetParam = array(
			"grant_type"    =>    "authorization_code",
			"client_id"        =>    WB_AKEY,
			"client_secret"    =>   WB_SKEY,
			"code"            =>    $_GET["code"],
			"state"            =>    $_GET["state"],
			"redirect_uri"    =>    $_SESSION["URI"]
		);
		unset($_SESSION["state"]);
		unset($_SESSION["URI"]);
		$res = get($sUrl,$aGetParam);
		 if (trim($res) == '') {
			header( 'Content-Type: text/html; charset=UTF-8');
			 $this->error('无法获取认证！');
			 eixt;
		}
		if (strpos($res, "callback") !== false) {
			$lpos = strpos($res, "(");
			$rpos = strrpos($res, ")");
			$res = substr($res, $lpos + 1, $rpos - $lpos - 1);
			$msg = json_decode($res);
			if (isset($msg->error)) {
				/* echo "<h3>error:</h3>" . $msg->error;
				echo "<h3>msg  :</h3>" . $msg->error_description;
				exit; */
				$this->error($msg->error . $msg->error_description);
			}
		}
		parse_str($res, $res);
		$_SESSION["access_token"] = $res['access_token'];
	}
        $url = "https://graph.qq.com/oauth2.0/me";

        $str = $this->get($url, array('access_token' => $_SESSION['access_token']));

        if (strpos($str, "callback") !== false) {
            $lpos = strpos($str, "(");
            $rpos = strrpos($str, ")");
            $str = substr($str, $lpos + 1, $rpos - $lpos - 1);
        }
        $res = json_decode($str);

        $_SESSION['openid'] = $res->openid;

        $user_openid = $this->user_openid_mod->where("openid='" . $res->openid . "'")->find();
        $is_new = false;

        if ($user_openid) {
            if ($this->user_mod->where('id=' . $user_openid['uid'])->count() > 0) {
                $_SESSION['user_id'] = $user_openid['uid'];
                $data = array('last_time' => time(), 'last_ip' => $_SERVER['REMOTE_ADDR']);
                $this->user_mod->where('id=' . $_SESSION['user_id'])->save($data);
            } else {
                $this->user_openid_mod->where("openid='" . $user_openid . "'")->delete();
                $is_new = true;
            }
        } else {
            $is_new = true;
        }
        if ($is_new) {
            $url = "https://graph.qq.com/user/get_user_info?"
                    . "access_token=" . $_SESSION['access_token']
                    . "&openid=" . $_SESSION['openid']
                    . "&oauth_consumer_key=" . $this->setting['qq_app_key']
                    . "&format=json";
            $url = "https://graph.qq.com/user/get_user_info";
            $param = array(
                'access_token' => $_SESSION['access_token'],
                "openid" => $_SESSION['openid'],
                "oauth_consumer_key" => $this->setting['qq_app_key'],
                "format" => 'json',
            );

            $res = $this->get($url, $param);

            if ($res == false) {
                 $this->error('获取用户信息失败！');
                 exit;
            }
            $res = json_decode($res);
            $qq_info = array('user_info' => $res);
            $data = array(
                'name' => $res->nickname,
                'img' => $res->figureurl_2,
                'last_time' => time(),
                'last_ip' => $_SERVER['REMOTE_ADDR'],
                'add_time' => time(),
                'ip' => $_SERVER['REMOTE_ADDR'],
            );

            $_SESSION['user_id'] = $this->user_mod->add($data);
            $data = array(
                'type' => 'qq',
                'uid' => $_SESSION['user_id'],
                'openid' => $_SESSION['openid'],
                'info' => serialize($qq_info),
            );
            $this->user_openid_mod->add($data);
            header('Location:' . U('uc/sign'));
            exit;
        }
        $_SESSION['login_type'] = 'qq';

       //header('Location:' . urldecode($_COOKIE['redirect']));
		echo("<script> top.location.href='" . urldecode($_COOKIE['redirect']) . "'</script>");
    //}