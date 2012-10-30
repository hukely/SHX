<?php
if(isset($_GET['error'])) {
	$this->redirect('uc/login', '', 3, $_GET['error']);
}
$post_data = array();  
$post_data['client_id'] = WB_AKEY;
$post_data['client_secret'] = WB_SKEY;  
$post_data['redirect_uri'] = WB_CALLBACK_URL;   
$post_data['grant_type'] = "authorization_code";   
$post_data['code'] = $_GET['code'];   
$url='https://www.douban.com/service/auth2/auth';  

if(isset($_GET['code'])) {
	 $result = _post($post_data, $url);
}
//curl "https://api.douban.com/v2/user/~me" -H "Authorization: Bearer a14afef0f66fcffce3e0fcd2e34f6ff4"
if(isset($_)) {

}

function _post($post_data, $url) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HEADER, 0); 
	curl_setopt($ch, CURLOPT_URL,$url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_POST, 1);  
	//为了支持cookie  
	curl_setopt($ch, CURLOPT_COOKIEJAR, './cookie.txt');  
	curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data); 
	$res = curl_exec($ch);
	curl_close($ch);
	return $res;
}