<?php


$post_data = array();  
$post_data['client_id'] = WB_AKEY;
$post_data['client_secret'] = WB_SKEY;  
$post_data['redirect_uri'] = WB_CALLBACK_URL;   
$post_data['grant_type'] = "authorization_code";   
$post_data['code'] = $_GET['code'];   
$url='https://www.douban.com/service/auth2/auth';  
$o=""; 
foreach ($post_data as $k=>$v)    {        
	$o.= "$k=".urlencode($v)."&";  
}  
$post_data=substr($o,0,-1);   
$ch = curl_init();
curl_setopt($ch, CURLOPT_POST, 1);  
curl_setopt($ch, CURLOPT_HEADER, 0); 
curl_setopt($ch, CURLOPT_URL,$url);
//为了支持cookie  curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');  
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data); 
$result = curl_exec($ch);

var_dump($result);