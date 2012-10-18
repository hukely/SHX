<?php
class snsAction extends baseAction {
	public $sns;
	public function _initialize() {
        parent::_initialize();
		$this->sns = $this->sname();
	}
	
	//生成授权登陆链接,并跳转到相关授权页
	function login() {
		require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/login.php');
	}
	
	//获取access_token
	function callback() {
		require_once(ROOT_PATH.'/includes/sns/'.$this->sns.'/callback.php');
	
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
