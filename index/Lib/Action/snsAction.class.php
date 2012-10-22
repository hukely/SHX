<?php
class snsAction extends baseAction {
	public $sns;
	public function _initialize() {
        parent::_initialize();
		$this->sns = $this->sname();
		define( "WB_AKEY" ,  $this->setting[$this->sns.'_app_key']);
		define( "WB_SKEY" ,  $this->setting[$this->sns.'_app_Secret']);
		$url = "http://".$_SERVER["HTTP_HOST"].str_replace("/sns/login", "/sns/callback", $_SERVER["REQUEST_URI"]);
		$urlArray = explode('?', $url);
		if($urlArray[0]) {
			define( "WB_CALLBACK_URL", $urlArray[0]);
		}else{
			define( "WB_CALLBACK_URL", $url);
		}	
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
			case 3:
				$sns = 'taobao';
			break;
			case 4:
				$sns = 'alipay';
			break;
			case 5:
				$sns = 'tencent';
			break;
			case 6:
				$sns = 'douban';
			break;
			case 7:
				$sns = 'renren';
			break;
			default:
				$sns = 0;
			break;
		}
		return $sns;
	}
   
}
