<?php
header("Content-type:text/html; charset=UTF-8;");
include_once( ROOT_PATH.'/includes/sns/'.$this->sns.'/TopClient.php' );
include_once( ROOT_PATH.'/includes/sns/'.$this->sns.'/UserGetRequest.php' );
include_once( ROOT_PATH.'/includes/sns/'.$this->sns.'/RequestCheckUtil.php' );
include_once( ROOT_PATH.'/includes/sns/'.$this->sns.'/Logger.php' );
$code = $_REQUEST['code'];   //通过访问https://oauth.taobao.com/authorize获取code
$grant_type = 'authorization_code';
//请求参数
$postfields= array('grant_type'     => $grant_type,
				 'client_id'     => WB_AKEY,
				 'client_secret' => WB_SKEY,
				 'code'          => $code,
				 'redirect_uri'  => WB_CALLBACK_URL
);
$url = 'https://oauth.taobao.com/token';
$c = new TopClient; 
$c->appkey = WB_AKEY;
$c->secretKey = WB_SKEY;
$token = json_decode($c->curl($url,$postfields));

$req = new UserGetRequest;
$req->setFields("user_id,nick,seller_credit");
$req->setNick(urlencode($token->taobao_user_nick));		//UTF-8格式
$resp = $c->execute($req, $token->access_token);
var_dump($resp);
/* //返回值
JSON数据格式:
01	{
02	    "user_get_response": {
03	        "user": {
04	            "uid": "10001",
05	            "promoted_type": "authentication",
06	            "birthday": "2000-01-01 00:00:00",
07	            "sex": "m",
08	            "item_img_num": 5,
09	            "location": {
10	                "zip": "310000",
11	                "state": "浙江",
12	                "district": "西湖区",
13	                "country": "中国",
14	                "city": "杭州"
15	            },
16	            "consumer_protection": "true",
17	            "vertical_market": "3C,shoes",
18	            "type": "B",
19	            "has_more_pic": "true",
20	            "auto_repost": "unlimited",
21	            "created": "2000-01-01 00:00:00",
22	            "alipay_no": "10001",
23	            "user_id": 10001,
24	            "last_visit": "2000-01-01 00:00:00",
25	            "liangpin": "true",
26	            "sign_food_seller_promise": "true",
27	            "has_sub_stock": "true",
28	            "has_shop": "true",
29	            "magazine_subscribe": "true",
30	            "buyer_credit": {
31	                "level": 1,
32	                "total_num": 1,
33	                "good_num": 1,
34	                "score": 1
35	            },
36	            "status": "normal",
37	            "prop_img_size": 1024,
38	            "is_golden_seller": "true",
39	            "item_img_size": 1024,
40	            "alipay_bind": "bind",
41	            "avatar": "http://assets.taobaocdn.com/app/sns/img/default/avatar-120.png",
42	            "seller_credit": {
43	                "level": 1,
44	                "total_num": 1,
45	                "good_num": 1,
46	                "score": 1
47	            },
48	            "prop_img_num": 5,
49	            "vip_info": "v1",
50	            "nick": "hz0799",
51	            "online_gaming": "true",
52	            "email": "xiaoming@taobao.com",
53	            "is_lightning_consignment": "true",
54	            "alipay_account": "hz0799@163.com"
55	        }
56	    }
57	} */