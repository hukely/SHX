<?php
class snsAction extends baseAction {
	public $sns;
	public function _initialize() {
		parent::_initialize();
		$snsName = $this->sname();
		$this->sns = $snsName;
		require_once(ROOT_PATH.'/includes/sns/'.$snsName.'.php');
        //if()						判断是否已经登陆
    }

	//生成授权登陆链接,并跳转到相关授权页
	function login() {	
		$loginUrl = redirect_url($this->setting[$this->sns.'_app_key'], $this->setting[$this->sns.'_app_Secret']);
		echo("<script> top.location.href='" . $loginUrl . "'</script>");
	}
	
	//获取access_token
	function callback() {
		$accessToken = get_access($this->setting[$sns.'_app_key'], $this->setting[$sns.'_app_Secret']);
		$this->bind();
	
	}	
	
	//获取用户信息,账号绑定
	function bind() {
	
	
	
	
	}
	function unbind() {
	
	
	
	
	}
	//获取登陆sns名
	function sname() {
		switch($_GET['type']) {
			case 1:
				$sns = 'qq';
			break;
			case 2:
				$sns = 'sina';
			break;
			default:
				$sns = 0;
			break;
		}
		return $sns;
	}
   
}
