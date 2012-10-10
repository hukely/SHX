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
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/uc.css" />   

<div class="middle">
    <div class="uc clear-fix">
		<div id="uc_head">
	<div class="top">
        <table style="width:100%;">
            <tr>
                <td style="width:120px;"><img src="<?php echo uimg($u['img']);?>" class="avatar"/></td>
                <td valign="top"><h1><?php echo ($u["name"]); ?></h1>
                	<?php if($u['id'] == $user['id']): ?><a href="<?php echo u('uc/account_basic');?>" class="uc_home_link">个人资料&nbsp;&nbsp;(设置)</a>
                   	<?php else: ?>
						<div class="add_follow <?php if($u["is_follow"] == 1): ?>yet<?php endif; ?>" fans_id="<?php echo ($uid); ?>"></div><?php endif; ?>
                </td>
                <td class="collect_list_wrap"  valign="top">
                    <div class="right">
                        <div class="collect_list"> 
                            <a href="<?php echo uc('uc/follow');?>"><?php echo ($u["follow_num"]); ?><br>
                            <span>关注</span> </a>
                        </div>
                        <div class="collect_list"> 
                            <a href="<?php echo uc('uc/fans');?>"><?php echo ($u["fans_num"]); ?><br>
                            <span>粉丝</span> </a>
                        </div>
                        <div class="collect_list" style="border:0px;"> 
                            <a href="<?php echo uc('uc/like');?>"><font color="#FF6FA6"><b><?php echo ($u["like_num"]); ?></b></font><br>
                            <span><font color="#FF6FA6">被喜欢</font> </a>
                        </div>
                    </div>
                </td>
            </tr>
        </table>    
    </div>

    <div class="nav clear-fix">
        <a href="<?php echo uc('uc/index');?>" <?php if(ACTION_NAME == index): ?>class="current"<?php endif; ?>>封面</a>
        <a href="<?php echo uc('uc/me');?>" <?php if(ACTION_NAME == me): ?>class="current"<?php endif; ?>>动态</a>         
        <a href="<?php echo uc('uc/album');?>" <?php if((ACTION_NAME == album) OR (ACTION_NAME == album_info)): ?>class="current"<?php endif; ?>>专辑</a>
        <a href="<?php echo uc('uc/like');?>" <?php if(ACTION_NAME == like): ?>class="current"<?php endif; ?>>喜欢</a>
        <a href="<?php echo uc('uc/share');?>" <?php if((ACTION_NAME == share) OR (ACTION_NAME == share_item)): ?>class="current"<?php endif; ?>>分享</a>
    </div>
</div>

		<div class="clearfix mt20">

            <div class="uc_index album radius7">
                <?php if(isset($album_list)): if(is_array($album_list)): $key = 0; $__LIST__ = $album_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($key % 2 );++$key;?><div class="album_item radius7 mt15" <?php if($key%2 == 0): ?>style="float:right;"<?php endif; ?>>
        <div class="clearfix act" style="text-align:right;">
        <?php if(isset($me)): if($type != 'follow'): ?><a href="<?php echo uc('uc/album_info',array('act'=>'edit','id'=>$val['id']));?>" target="_blank">编辑</a>
            |<a href="<?php echo uc('uc/album_info',array('act'=>'del','id'=>$val['id']));?>" onclick="{if(confirm('确定要删除记录吗?')){return true;}return false;}">删除</a><?php endif; endif; ?>
        </div>                
        <a href="<?php echo u('album/details',array('id'=>$val['id'],'uid'=>$val['uid']));?>" target="_blank">
            <?php if(is_array($val['items'])): $i = 0; $__LIST__ = $val['items'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ival): $mod = ($i % 2 );++$i;?><li><img src="<?php echo ($ival); ?>" /></li><?php endforeach; endif; else: echo "" ;endif; ?>       	
        </a>
        <div class="clearfix title">
        	<div class="clearfix">
                <h3 class="left"><?php echo ($val["title"]); ?></h3>
                <div class="right">
                    <div class="like left">
                        <i><?php echo ($val["like_num"]); ?></i>
                        喜欢
                    </div>
                    <div class="comment left">
                        <i><?php echo ($val["comment_num"]); ?></i>
                        评论
                    </div>
                </div>            
            </div>
            <?php if($type == 'follow'): ?><div class="clearfix" style="line-height:20px;">
                <a href="<?php echo u('uc/album',array('uid'=>$val['user']['id']));?>" target="_blank">
	                <img src="<?php echo uimg($val['user']['img']);?>" class="avatar left"/>@<?php echo ($val['user']['name']); ?>
              	</a>
            </div><?php endif; ?>
        </div>
    </div><?php endforeach; endif; else: echo "" ;endif; ?> 
                <?php else: ?>
                	<?php if($u['id'] == $user['id']): ?><span>你还没有专辑哦~赶紧创建一个，收集你心爱的宝贝吧~</span>
                        <a class="upload" href="<?php echo u('uc/album_info');?>">创建新专辑</a>
                    <?php else: ?>
	                    <span>ta还没有专辑哦~</span><?php endif; endif; ?>
            </div>
  
			<div class="right">
            	<div class="uc_user_info ">
    <div class="clearfix top"> 
        <a href="<?php echo uc('uc/index');?>" target="_blank" class="left">
            <img src="<?php echo uimg($u['img']);?>" width="48" height="48" alt="<?php echo ($u["name"]); ?>" class="avatar">
        </a>
        <div class="user_name left"> 
            <a href="<?php echo uc('uc/index');?>" target="_blank"><?php echo ($u["name"]); ?></a>
			<div class="add_follow <?php if($u["is_follow"] == 1): ?>yet<?php endif; ?>" fans_id="<?php echo ($u["id"]); ?>"></div>
        </div>    
    </div>
    <div class="user_collect_info"> 
    	<a href="<?php echo uc('uc/album');?>" target="_blank">专辑<span><?php echo ($u["album_num"]); ?></span></a> 
        <a href="<?php echo uc('uc/like');?>" target="_blank">喜欢<span><?php echo ($u["like_num"]); ?></span></a> 
    	<a href="<?php echo uc('uc/share');?>" target="_blank">分享<span><?php echo ($u["share_num"]); ?></span></a>
  	</div>
<?php if(MODULE_NAME == 'album' and ACTION_NAME == 'details'): ?><p class="album_intro mt15">
    	<?php echo ($info["remark"]); ?>
    </p>
  
    <div class="comments mt15">
        <textarea class="comments_box" id="comments_box" def="你也可以顺便说点什么 O(∩_∩)O"></textarea>
       	<div class="clearfix">
        	<input type="button" class="submit comments_btn" pid="<?php echo ($info['album_id']); ?>" id="comments_btn"value="确定"/>
        </div>
        <div class="list_wrap"></div>
    </div>
<?php endif; ?>    
</div> 
            </div>			                        
        </div>
  
		<div class="share mt20">
        	<h3><?php echo ($u["name"]); ?>的分享</h3>
            <div class="item_list infinite_scroll like_list" style="min-height:200px;">
                <?php if(!empty($items_list)): if(is_array($items_list)): $i = 0; $__LIST__ = $items_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><div class="item mt15 masonry_brick jq_corner" data-corner="7px" iid="<?php echo ($val['id']); ?>">
        <div class="item_t">
            <div class="img tc"> 
            	<a href="<?php echo ($val['bimg']); ?>" rel="nofollow" class="fancybox" title="<?php echo ($val["title"]); ?>">
                	<img alt="<?php echo ($val["title"]); ?>" url="<?php echo base64_encode($val['img']);?>" style="display:inline;" class="encode_url">
            	</a>
                <span class="price">￥<?php echo ($val["price"]); ?></span> 
                <div class="btns">
                	<a href="javascript:;" class="img_album_btn" iid="<?php echo ($val["id"]); ?>">
                        加入专辑
                    </a>               
                </div>
         	</div>
            <div class="title">
                <a target="_blank" href="<?php echo u('item/index',array('id'=>$val['id']));?>" hidefocus="true" rel="nofollow"><span><?php echo ($val["title"]); ?></span></a>
            </div>
        </div>
        <div class="item_b clearfix">
            <div class="items_likes fl"> 
            	<a href="javascript:;" class="like_btn" iid="<?php echo ($val["id"]); ?>" iurl="<?php echo u('item/index',array('id'=>$val['id']));?>"></a>
                <em class="red bold" id="like_num_<?php echo ($val["id"]); ?>"><?php echo ($val["likes"]); ?></em> 
           	</div>
            <div class="items_comment fr">
            	<a href="<?php echo u('item/index',array('id'=>$val['id']));?>#items_comments" target="_blank">评论</a>
                <em class="red bold">(<?php echo ($val["comments"]); ?>)</em> 
            </div>
        </div>  
		
		<?php if(isset($val['user'])): ?><div class="user clearfix">
					<div class="clearfix">
						<div class="avatar">
							<img src="<?php echo uimg($val['user']['img']);?>" width="30px" height="30px"/> 
						</div>                
						<div class="user_info">
							<a href="<?php echo u('uc/index',array('uid'=>$val['user']['id']));?>">来自#<em><?php echo ($val["user"]["name"]); ?></em>#的分享</a>
							<span>
								<?php if($val["remark_status"] == 1): echo ($val["remark"]); endif; ?>
							</span>
						</div>
					</div>
				</div><?php endif; ?>         
		
		<?php if(isset($val['comments_list'])): ?><div class="comments_list">
				<?php if(is_array($val['comments_list'])): $i = 0; $__LIST__ = $val['comments_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$comment): $mod = ($i % 2 );++$i;?><div class="clearfix comment_item">
                    	<div class="fl">
                        	<img src="<?php echo uimg($comment['img']);?>"  width="20px" height="20px" class="uimg fl"/><span class="uname"><?php echo ($comment["name"]); ?></span> :
                        </div>
                    	<?php echo (mb_substr($comment["info"],0,50,'utf-8')); ?>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>
			</div><?php endif; ?>		
    </div><?php endforeach; endif; else: echo "" ;endif; ?>

                <?php else: ?>                
                    <div class="home_empty">
                    <?php if($u['id'] == $user['id']): ?><span class="des"><a class="upload left" href="<?php echo U('uc/share_item');?>">你还没有分享宝贝哦~马上分享@^@</a></span>
					 <?php else: ?>
                        <span class="des">ta还没有分享宝贝哦~</span><?php endif; ?>
                    </div><?php endif; ?>
            </div>            
            <a href="<?php echo uc('uc/share');?>" class="more"></a>
        </div>	
        
    </div>
</div>
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