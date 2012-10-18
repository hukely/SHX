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
$sUri =  "http://".$_SERVER["HTTP_HOST"].str_replace("/sns/login", "/sns/callback", $_SERVER["REQUEST_URI"]);
$_SESSION["URI"] = $sUri;
$aParam = array(
    "response_type"    => "code",
    "client_id"        =>    $this->setting[$this->sns.'_app_key'],
    "redirect_uri"    =>    $sUri,
    "state"            =>    $sState,
	"scope"            =>    join(",", $aScope),
);
$aGet = array();
foreach($aParam as $key=>$val){
    $aGet[] = $key."=".urlencode($val);
}
$sUrl = "https://graph.qq.com/oauth2.0/authorize?";
$sUrl .= join("&",$aGet);
    header("location:".$sUrl);