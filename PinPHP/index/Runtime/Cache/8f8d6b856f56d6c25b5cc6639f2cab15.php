<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title><?php echo ($seo["seo_title"]); ?></title>
<meta name="keywords" content="<?php echo ($seo["seo_keys"]); ?>" />
<meta name="description" content="<?php echo ($seo["seo_desc"]); ?>" />
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/style.css" /><script src="http://tjs.sjs.sinajs.cn/t35/apps/opent/js/frames/client.js" language="JavaScript"></script>
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
<div id="header" class="header">
	<div class="m-head">
		<div class="layout980 clearfix">
			<h1 class="g-logo"><a href="__APP__/">SHX，发现喜欢<span class="goup"></span></a></h1>
			<a title="SHX 手机版" href="#" class="iphoe-app">SHX 手机版</a>
			<form action="<?php echo u('search/index');?>" method="post" onsubmit="return check_search(this);">
				<div class="g-slogan">
					<input type="text" autocomplete="off" value="<?php echo ($default_kw); ?>" name="keywords" maxlength="50" class="fl search-input-keyword" id="J_SearchKeyword">
					<input value="" type="submit" class="header-search-button fl" id="J_SearchBarSubmit" />
					<div class="suggest-wrap">
						<div style="top: 29px; left: 8px; display: none;" class="suggest" id="J_SearchSuggestList">
							<div class="suggest-tip"></div>
							<ol class="autocomplete"></ol>
						</div>
					</div>
				</div>
			</form>	
		</div>
	</div>
	<div class="m-nav">
		<div class="layout980 clearfix pos-r">
			<ul class="channel clearfix">
				<li><a href="__APP__/" class=" on ">首页</a>
				<span>-</span>
				</li>
				<li>
					<dl class="clearfix">
					
					<dt><a href="javascript:;" class="">发现</a></dt>
					<?php if(is_array($nav_list['main'])): $i = 0; $__LIST__ = $nav_list['main'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><dd>
							  <?php if($val['in_site'] == '0'): ?><a href="<?php echo ($val["url"]); ?>" title="<?php echo ($val["name"]); ?>" <?php if($val['system'] == 0): ?>class=""<?php endif; ?>>
							<?php else: ?>
							<a href="__APP__<?php echo ($val["url"]); ?>" title="<?php echo ($val["name"]); ?>" <?php if($val['system'] == 0): ?>class=""<?php endif; ?>><?php endif; ?>
							<?php echo ($val["name"]); ?></a>
						</dd><?php endforeach; endif; else: echo "" ;endif; ?>
					</dl>
				</li>
				<li>
					<dl class="clearfix">
						<dt>
						<span>-</span>
							<a href="" class="">讨论吧</a>
							<span>-</span>
						</dt>
						<dt id="feeds-xiaoxi" class="pos-ie">
							<a href="" class="">我关注</a>
						</dt>
					</dl>
				</li>
				<li class="first">
				<span>-</span>
					<a href="" class="">主题</a>
				</li>
				<li class="first">
				<span>-</span>
					<a href="" class="">品牌</a>
				</li>
			</ul>
			<a title="搜索" class="header-nav-search fr"></a>
			<a rel="signIn" href="javascript:;" class="btn-signIn fr">签到</a>
			<div class="shareIt fr">
				<div id="share_goods" class="left top_share"><div class="button">分享好东西</div><span class="arrow-dn"></span></div>
				<!-- <ul class="dropdown shareit-dropdown">
					<li class="sg-li"><a class="hd-share-goods" href="javascript:;" rel="shareGoods">发布宝贝</a></li>
					<li><a class="hd-create-topic" rel="nofollow" href="/u/topic/create">创作主题</a></li>
				</ul>  -->
			</div>
			<?php if(isset($user)): ?><div class="regLogin fr">
				<a href="<?php echo u('uc/index');?>">空间</a><span class="vline5">|</span>
				<a href="<?php echo u('uc/account_basic');?>">设置</a><span class="vline5">|</span>
                <a href="<?php echo u('uc/logout');?>">退出</a>
			</div>	
			<?php else: ?>
			<div class="regLogin fr">
				<a href="javascript:;" onclick="login()">登录</a><span class="vline5">|</span><a  onclick="registerBox()">注册</a>
				<span class="arrow-dn-r"></span>
				<ul class="share-link login-dropdown">
					<li><a href="<?php echo u('uc/qq_login');?>" class="s-qq">QQ登录</a></li>
					<li><a href="<?php echo u('uc/sina_login');?>" class="s-sina">新浪微博登录</a></li>
					<li><a href="" class="s-tao">淘宝登录</a></li>		
					<li><a href="" class="s-alipay">支付宝登录</a></li>
					<li><a href="" class="s-tencent">腾讯微博登录</a></li>
					<li><a href="" class="s-douban">豆瓣登录</a></li>
					<li><a href="" class="s-renren">人人网登录</a></li>
				</ul>
			</div><?php endif; ?>
			
			<a href="/u/anonymous" class="unlogin-like fr clearfix" style="display: none;">
				<div class="unlogin-like-png">
				</div>
				<span class="unlogin-like-text">喜欢(<span class="count"></span>)</span>
			</a>
		</div>
	</div>
</div>


<script type="text/javascript">
var default_kw = "<?php echo ($default_kw); ?>";
$(function(){
	$("#J_SearchKeyword").focus(function(){
		$(this).val($(this).val()==default_kw ? '' : $(this).val());
	}).blur(function(){
		$(this).val($(this).val()=='' ? default_kw : $(this).val());
	});
});
$(function() {
	$(window).scroll(function(){
		if($(window).scrollTop()>84){
			$(".m-nav").addClass("fixed");
			$(".header-nav-search").show();
		}
		if($(window).scrollTop()<84){
			$(".m-nav").removeClass("fixed");
			$(".header-nav-search").hide();
		}
	});
});
$(".header-nav-search").bind("click",function(){
	$(".search-input-keyword").val("");
	$(document).scrollTop(0);
	$(".search-input-keyword").focus();
}); 
$(".regLogin").mouseover(function() {
	$('.login-dropdown').show();
});
$(".regLogin").mouseleave(function() {
	$('.login-dropdown').hide();
});
</script>
<div class="wrapper clearfix">
<div class="content">
	
<?php if($type == 'search'): ?><div class="search_top box_shadow mt15">
        <div class="search_box">
            <form method="get" action="<?php echo u('search/index');?>" onsubmit="return check_search(this);">
                <input type="text" value="<?php echo ($keywords); ?>" name="keywords" id="keyword" class="fl">
                <input type="submit" value="搜索" id="search_btn" class="white tc fl cursor">
            </form>
        </div>
    </div><?php endif; ?>    

    <div class="search_result">
        <?php if($items_list == ''): ?><div class="no_result break_word mt15">很抱歉，没有找到与“<span class="keyword"><?php echo ($keywords); ?></span>”相关的内容</div>
            <?php else: ?>
            <div class="result_header clearfix">
            	<?php if(!empty($keywords)): ?><div class="fl">找到<?php echo ($items_total); ?>条与“<span class="keyword"><?php echo ($keywords); ?></span>”相关的宝贝</div><?php endif; ?>
                <div class="fr">
                    <a href="<?php echo u('search/index',array('sortby'=>'likes','keywords'=>$keywords));?>" <?php if($sortby == 'likes'): ?>class="red"<?php endif; ?>>按喜欢排序</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<?php echo u('search/index',array('sortby'=>'time','keywords'=>$keywords));?>" <?php if($sortby == 'time'): ?>class="red"<?php endif; ?>>按时间排序</a>
                </div>
            </div><?php endif; ?>
            <div class="item_list infinite_scroll">  

<?php if($type == 'guang'): ?><div class="box_shadow masonry_brick mt15" style="position: absolute; top: 0px; left: 0px;">
                    <div class="catalog search_catalog clearfix">
                        <div class="catalog_item">
                            <h3>社区热荐</h3>
                            <div class="clearfix">
                                <a href="<?php echo u('search/index',array('sortby'=>'dlikes'));?>" class="<?php if(($sortby == 'dlikes') OR ($sortby == '')): ?>bg_red<?php endif; ?> jq_corner" data-corner="10px">24小时最热</a>
                                <a href="<?php echo u('search/index',array('sortby'=>'sort_order'));?>" class="<?php if($sortby == 'sort_order'): ?>bg_red<?php endif; ?> jq_corner" data-corner="10px">推荐</a>
                                <a href="<?php echo u('search/index',array('sortby'=>'time'));?>" class="<?php if($sortby == 'time'): ?>bg_red<?php endif; ?> jq_corner" data-corner="10px">最新</a>
                            </div>
                        </div>    
                        <div class="catalog_item">
                            <h3>热门搜索</h3>
                            <div class="clearfix">
                            	<?php if(is_array($search_keywords)): $i = 0; $__LIST__ = $search_keywords;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><a href="<?php echo u('search/index',array('keywords'=>$val));?>" 
                                	class="<?php if($request["keywords"] == $val): ?>bg_red<?php endif; ?> jq_corner" 
                                    data-corner="10px"><?php echo ($val); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                        </div>                                    	
                    </div>
                </div><?php endif; ?>

				<?php if(is_array($items_list)): $i = 0; $__LIST__ = $items_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><div class="item mt15 masonry_brick jq_corner" data-corner="7px" iid="<?php echo ($val['id']); ?>">
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

            </div>
            <?php if($show_sp == 1): ?><div id="more" class="center"><a href="<?php echo u('search/index',array('keywords'=>$keywords,'sp'=>2,'p'=>$p));?>" hidefocus="true"></a></div><?php endif; ?>
            <?php if($page != ''): ?><div id="page" class="page mt20" style="display: none;"><div class="page_num"><?php echo ($page); ?></div></div><?php endif; ?>
        </if>
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
		$(function() {
			$("#gotopbtn").mouseover(function() { $("#gotopbtn").css('background-position', '0 -47px'); }).mouseleave(function() { $("#gotopbtn").css('background-position', '0 0px'); });
		});
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