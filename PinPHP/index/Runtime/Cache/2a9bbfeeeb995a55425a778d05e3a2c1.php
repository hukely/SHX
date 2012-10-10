<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title><?php echo ($seo["seo_title"]); ?></title>
<meta name="keywords" content="<?php echo ($seo["seo_keys"]); ?>" />
<meta name="description" content="<?php echo ($seo["seo_desc"]); ?>" />
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/style.css" />
<script type="text/javascript">
var def=<?php echo ($def); ?>;
</script> 
<script type="text/javascript" src="__ROOT__/statics/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="__ROOT__/statics/js/SHX.js"></script>
<script type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="__ROOT__/statics/css/jquery.fancybox.css" />
<script type="text/javascript" src="__TMPL__public/js/common.js"></script>
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/ie.css" />
<![endif]-->
<!--[if lte IE 8]>
<script type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/jquery.corner.js"></script>
<script type="text/javascript">
$(function(){ 
	$('.jq_corner').corner();
});
</script>
<![endif]-->
</head>
<body>
<div class="header">
    <div class="mbox clearfix">
        <span class="logo"> 
        	<a title="<?php echo ($site_name); ?>" href="__APP__/"> 
            	<img alt="<?php echo ($site_name); ?>" src="__TMPL__/public/images/logo.gif"> 
         	</a> 
     	</span>
        <div class="right">
            <ol class="homelogin login_list">
            <?php if(isset($user)): ?><li><a href="<?php echo u('uc/index');?>">我的空间</a></li>
				<li><a href="<?php echo u('uc/account_basic');?>">帐号设置</a></li>
				<li><div id="share_goods" class="left top_share"><div class="button">分享宝贝</div></div></li>
                <li><a href="<?php echo u('uc/logout');?>">退出</a></li>
			<?php else: ?>
	            <li><a id="loginBox" class="nav-link-item sep url_cookie red" href="javascript:;" onclick="login()">登录</a></li>
                <li><a id="registerBox" class="nav-link-item sep url_cookie red" href="javascript:;" onclick="registerBox()">注册</a></li>
                <li><a class="m_sina" href="<?php echo u('uc/sina_login');?>" target="_blank">微博登录</a></li>
                <li><a class="m_qq" href="<?php echo u('uc/qq_login');?>" target="_blank">QQ登录</a></li><?php endif; ?>
            <li><a class="sep nav-link-item" onClick="return SetHome(this,'<?php echo ($site_domain); ?>');">设为首页</a></li>
            <li><a class="sep nav-link-item" onClick="return addBookmark('<?php echo ($site_name); ?>','<?php echo ($site_domain); ?>');">加入收藏</a></li>   
            </ol>
        </div>
    </div>
    <div class="main_nav_wrapper">
        <div class="main_nav">
            <ul class="nav_left">
                <li><a href="__APP__/">首 页</a></li>
                <?php if(is_array($nav_list['main'])): $i = 0; $__LIST__ = $nav_list['main'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><li>
                    <?php if($val['in_site'] == '0'): ?><a href="<?php echo ($val["url"]); ?>" title="<?php echo ($val["name"]); ?>" <?php if($val['system'] == 0): ?>class="f12 fnormal"<?php endif; ?>>
                    <?php else: ?>
                    <a href="__APP__<?php echo ($val["url"]); ?>" title="<?php echo ($val["name"]); ?>" <?php if($val['system'] == 0): ?>class="f12 fnormal"<?php endif; ?>><?php endif; ?>
                    <?php echo ($val["name"]); ?></a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <div class="nav_search">
                <form method="post" action="<?php echo u('search/index');?>" onsubmit="return check_search(this);">
                    <input type="text" value="<?php echo ($default_kw); ?>" autocomplete="off" name="keywords" class="kw_ipt f12 gray">
                    <input type="submit" value="" id="fm_hd_btm_shbx_bttn" class="do_ipt">
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var default_kw = "<?php echo ($default_kw); ?>";
$(function(){
	$(".kw_ipt").focus(function(){
		$(this).val($(this).val()==default_kw ? '' : $(this).val());
	}).blur(function(){
		$(this).val($(this).val()=='' ? default_kw : $(this).val());
	});
});
</script>
<div class="wrapper clearfix">
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/uc_v1.css" />   
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/formvalidatorregex.js"></script>
<style type="text/css">
	.STYLE1 {
		font-size: 12px;
		font-weight: bold;
	}
</style>
<div class="middle">
    <div class="uc clearfix account">
    	<div class="register">
         	<div id="reg_left">
            	<h2>新会员注册</h2>
                <div class="hint">加入<?php echo ($site_name); ?>，发现时尚，分享购物乐趣。</div>
                <form action="" method="post" id="myform">
                    <?php if(isset($err)): ?><div class="err" style="width:150px;">
                        <div class="icon_<?php echo ($err["err"]); ?>"><?php echo ($err["msg"]); ?></div>                
                    </div><?php endif; ?>                  
                    <table style="margin:20px 0px 0px 0px;">
                        <tr>
                            <th><em class="red">*&nbsp;</em>登录帐号：</th>
                            <td><input type="text" class="input_text" id="name" name="name" value="<?php echo ($data["name"]); ?>"/></td>
							<td><div id="nameTip" style="width:260px"></div></td>
                        </tr>
                        <tr>
                            <th><em class="red">*&nbsp;</em>登录密码：</th>
                            <td><input type="password" class="input_text" name="passwd" id="passwd" value="<?php echo ($data["passwd"]); ?>"/></td>
							<td><div id="passwdTip"></div></td>
                        </tr>
                        <tr>
                            <th><em class="red">*&nbsp;</em>确认密码：</th>
                            <td><input type="password" class="input_text" id="confirm_passwd" name="confirm_passwd" /></td>
							<td><div id="confirm_passwdTip"></div></td>
                        </tr>
						<tr>
                            <th><em class="red">*&nbsp;</em>电子邮箱：</th>
                            <td><input type="text" class="input_text" id="email" name="email" value="<?php echo ($data["email"]); ?>"/></td>
							<td><div id="emailTip"></div></td>
                        </tr>
						<tr>
                            <th><em class="red">*&nbsp;</em>手机号码：</th>
                            <td><input type="text" class="input_text" id="tel" name="tel" value=""/></td>
							<td><div id="telTip"></div></td>
                        </tr>					
                        <tr>
                            <th><em class="red">*&nbsp;</em>验证码：</th>
                            <td>
                            	<input type="text" name="verify" id="verify" class="input_text left" style="width:100px;"/>
                            	<img src="<?php echo u('public/verify');?>" url="<?php echo u('public/verify');?>" class="verify_img"  id="verify_img" class="left" onclick="changeVerify(this)" style="margin:5px 0px 0px 10px;" />
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input id="submit" name="dosubmit" type="submit" value=" " class="reg_btn"/>
                            </td>
                        </tr>
                    </table>
				</form>                
            </div>
            <div id="reg_right" class="login">
            	已有账号?请直接登录
                <a class="login_btn" href="<?php echo u('uc/login');?>"></a>
                
                <p>您也可以用以下方式登录</p>
                <div class="login_list clearfix">
                    <a href="<?php echo u('uc/sina_login');?>" class="sina" target="_blank"></a>
                    <a href="<?php echo u('uc/qq_login');?>" class="qq" target="_blank"></a>
                </div>                
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	validatorReg();
</script>

</div>
<div class="footer">
	<div class="box_shadow clearfix">
        <div class="footer_top">
            <div class="f_list">
                <h4><b>发现热门</b></h4>
                <ul class="l_one">
                    <li><a target="_blank" href="./?m=group">逛宝贝</a></li>
                    <li><a target="_blank" href="./?m=cate&a=index&cid=1">找鞋子</a></li>
                    <li><a target="_blank" href="./?a=index&m=cate&cid=2">选包包</a></li>
                    <li><a target="_blank" href="./?a=index&m=cate&cid=3">搭配饰</a></li>
					<li><a target="_blank" href="./?a=index&m=cate&cid=4">爱美妆</a></li>
					<li><a target="_blank" href="./?a=index&m=cate&cid=5">装家居</a></li>
                </ul>
            </div>
            <div class="f_list">
                <h4><b>关于我们</b></h4>
                <ul class="l_one">
                    <li><a target="_blank" href="<?php echo u('article/index',array('id'=>1));?>">关于我们</a></li>
                    <li><a target="_blank" href="<?php echo u('article/index',array('id'=>3));?>">联系我们</a></li>
                    <li><a target="_blank" href="<?php echo u('article/index',array('id'=>2));?>">网站地图</a></li>
                    <li><a target="_blank" href="<?php echo u('article/index',array('id'=>4));?>">隐私政策</a></li>
                </ul>
            </div>
            <div class="f_list">
                <h4><b>合作伙伴</b></h4>
                <ul class="l_one">
                    <li><a target="_blank" href="http://www.pinphp.com" target=_blank>PinPHP</a></li>
                    <li><a target="_blank" href="http://www.liqu.com" target=_blank>淘宝返利网</a></li>
                    <li><a target="_blank" href="http://www.yifen.com" target=_blank>一分网</a></li>
					<li><a target="_blank" href="http://www.doudou.com" target=_blank>豆豆网</a></li>
					<?php if(is_array($flink_list)): $i = 0; $__LIST__ = $flink_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i; if(($val["cate_id"] == '2')): ?><li><a target="_blank" href="<?php echo ($val["url"]); ?>" class="f_links fl"><?php echo ($val["name"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>              
                </ul>
            </div>
            <div class="f_list">
                <h4><b>友情链接</b>  更多>></h4>
                <ul class="l_two">
                    <?php if(is_array($flink_list)): $i = 0; $__LIST__ = $flink_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i; if(($val["cate_id"] == '1')): ?><li><a target="_blank" href="<?php echo ($val["url"]); ?>" class="f_links fl"><?php echo ($val["name"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                 </ul>
            </div>
            <div class="f_list">
                <h4><b>关注我们</b></h4>
                <ul class="l_one">
					<?php if(($follow_us["weibo_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["weibo_url"]); ?>"><span class="s_sina">&nbsp;&nbsp;</span>新浪微博</a></li><?php endif; ?>
                    <?php if(($follow_us["renren_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["renren_url"]); ?>"><span class="renren">&nbsp;&nbsp;</span>公共主页</a></li><?php endif; ?>
					<?php if(($follow_us["qqweibo_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["qqweibo_url"]); ?>"><span class="s_tx">&nbsp;&nbsp;</span>腾讯微博</a></li><?php endif; ?>
					<?php if(($follow_us["qqzone_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["qqzone_url"]); ?>"><span class="s_qzone">&nbsp;&nbsp;</span>QQ空间</a></li><?php endif; ?>
					<?php if(($follow_us["163_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["163_url"]); ?>"><span class="h_wangyi">&nbsp;&nbsp;</span>网易微博</a></li><?php endif; ?>
					<?php if(($follow_us["douban_url"] != '')): ?><li><a target="_blank" href="<?php echo ($follow_us["douban_url"]); ?>"><span class="s_dbai">&nbsp;&nbsp;</span>豆瓣</a></li><?php endif; ?>
                </ul>
            </div>
        </div>
        
		<!--友情链接-->
        </present>
        <div class="new_footer tc">
        	<div class="copyright">Copyright &copy;2012 <?php echo ($site_name); ?>. All Rights Reserved. <?php echo ($site_icp); ?> <?php echo ($statistics_code); ?></div>
        </div>
	</div>
</div>

<div style="display:none;" id="gotopbtn" class="to_top"></div>
<script type="text/javascript">
	$(document).ready(function(){
	
		//首先将#gotopbtn隐藏
		 $("#gotopbtn").hide();
	
		//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
		$(function () {
			$(window).scroll(function(){
				if ($(window).scrollTop()>100){
					$("#gotopbtn").fadeIn(600);
				}else{
					$("#gotopbtn").fadeOut(600);
				}
			});
	
			//当点击跳转链接后，回到页面顶部位置
			$("#gotopbtn").click(function(){
				$('body,html').animate({scrollTop:0},600);
				return false;
			});
		});
	});
</script>
</body>
</html>