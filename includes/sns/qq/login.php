<?php
include(ROOT_PATH.'/includes/sns/'.$this->sns.'/function.php');
$aScope = array (
    0 => 'get_user_info',
    1 => 'get_info',
    2 => 'list_album',
    3 => 'get_repost_list',
);
$sState = md5(date("YmdHis".getip()));
$_SESSION["state"] = $sState;
$_SESSION["URI"] = WB_CALLBACK_URL;
$aParam = array(
    "response_type"    => "code",
    "client_id"        =>    WB_AKEY,
    "redirect_uri"    =>    WB_CALLBACK_URL,
    "state"            =>    $sState,
	"scope"            =>    join(",", $aScope),
);
$aGet = array();
foreach($aParam as $key=>$val){
    $aGet[] = $key."=".urlencode($val);
}
$sUrl = "https://graph.qq.com/oauth2.0/authorize?";
$sUrl .= join("&",$aGet);
COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header("location:".$sUrl);