<?php
//此为集成帐号登录,免验证.得到的信息有限.callback副本为调用完整淘宝api的例子
header("Content-type:text/html; charset=UTF-8;");
if(base64_encode(md5($_GET['top_parameters'].WB_SKEY, true)) == $_GET['top_sign']) {
	$data = base64_decode($_GET['top_parameters']);
//string(58) "nick=汤逊湖边乱飞&ts=1351580539566&user_id=143476137" 
}else{
	$this->error{'登入校验失败,请重新登入'};
}