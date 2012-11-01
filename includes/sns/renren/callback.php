<?php
$code = $_REQUEST["code"];
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/config.inc.php');
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/RenrenOAuthApiService.class.php');
require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/RenrenRestApiService.class.php');


if($_REQUEST['state'] == $_SESSION['state']) {
	if($code) {
		//使用code换取accesstoken
		//获取accesstoken
		$oauthApi = new RenrenOAuthApiService;
		$post_params = array(
				'client_id'=>WB_AKEY,
				'client_secret'=>WB_SKEY,
				'redirect_uri'=>WB_CALLBACK_URL,
				'grant_type'=>'authorization_code',
				'code'=>$code
				);
		$token_url='http://graph.renren.com/oauth/token';
		$access_info=$oauthApi->rr_post_curl($token_url,$post_params);//使用code换取token
		//$access_info=$oauthApi->rr_post_fopen($token_url,$post_params);//如果环境无法支持curl函数，可以用基于fopen函数的该函数发送请求
		$access_token=$access_info["access_token"];
		$expires_in=$access_info["expires_in"];
		$refresh_token=$access_info["refresh_token"];
		$_SESSION["access_token"]=$access_token;

		//使用accesstoken获取登录用户的信息
		//获取用户信息RenrenRestApiService
		$restApi = new RenrenRestApiService;
		$params = array('fields'=>'uid,name,sex,birthday,mainurl,hometown_location,university_history,tinyurl,headurl','access_token'=>$access_token);
		$res = $restApi->rr_post_curl('users.getInfo', $params);//curl函数发送请求
		//$res = $restApi->rr_post_fopen('users.getInfo', $params);//如果环境无法支持curl函数，可以用基于fopen函数的该函数发送请求
		//print_r($res);//输出返回的结果

        $_SESSION['openid'] = $res[0]['uid'];
        $user_openid = $this->user_openid_mod->where("openid='" . $token['uid'] . "'")->find();

        $is_new = false;
        if ($user_openid) {
            if ($this->user_mod->where('id=' . $user_openid['uid'])->count() > 0) {
                $_SESSION['user_id'] = $user_openid['uid'];
                $data = array('last_time' => time(), 'last_ip' => $_SERVER['REMOTE_ADDR']);
                $this->user_mod->where('id=' . $_SESSION['user_id'])->save($data);
            } else {
                $this->user_openid_mod->where("openid='" .  $_SESSION['openid'] . "'")->delete();
                $is_new = true;
            }
        } else {
            $is_new = true;
        }
       
        if ($is_new) {
            $renren_info = array('user_info' => $res);
            $data = array(
                'name' => $res[0]['name'],
                'img' => $res[0]['mainurl'],
                'last_time' => time(),
                'last_ip' => $_SERVER['REMOTE_ADDR'],
                'add_time' => time(),
                'ip' => $_SERVER['REMOTE_ADDR'],
            );
            $_SESSION['user_id'] = $this->user_mod->add($data);
            $data = array(
                'type' => 'renren',
                'uid' => $_SESSION['user_id'],
                'openid' => $_SESSION['openid'],
                'info' => serialize($renren_info),
            );
            $this->user_openid_mod->add($data);
            header('Location:' . U('uc/sign'));
            exit;
        }
        $_SESSION['login_type'] = 'renren';
		
		echo("<script> top.location.href='" . urldecode($_COOKIE['redirect']) . "'</script>");
		
	}else{
		//如果获取不到code，将错误信息打出来
		$this->error('errorparameter code is null:<br>'.$_SERVER["QUERY_STRING"]);
	}	
} else {
	$this->error("The state does not match. You may be a victim of CSRF.");
}