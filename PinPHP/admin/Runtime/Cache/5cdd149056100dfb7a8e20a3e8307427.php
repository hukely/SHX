<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link href="__ROOT__/statics/admin/css/style.css" rel="stylesheet" type="text/css"/>
<link href="__ROOT__/statics/css/dialog.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/jquery/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/formvalidator.js"></script>
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/formvalidatorregex.js"></script>

<script language="javascript" type="text/javascript" src="__ROOT__/statics/admin/js/admin_common.js"></script>
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/dialog.js"></script>
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/iColorPicker.js"></script>

<script language="javascript">
var URL = '__URL__';
var ROOT_PATH = '__ROOT__';
var APP	 =	 '__APP__';
var lang_please_select = "<?php echo (L("please_select")); ?>";
var def=<?php echo ($def); ?>;
$(function($){
	$("#ajax_loading").ajaxStart(function(){
		$(this).show();
	}).ajaxSuccess(function(){
		$(this).hide();
	});
});

</script>
<title><?php echo (L("website_manage")); ?></title>
</head>
<body>
<div id="ajax_loading">提交请求中，请稍候...</div>
<?php if($show_header != false): if(($sub_menu != '') OR ($big_menu != '')): ?><div class="subnav">
    <div class="content-menu ib-a blue line-x">
    	<?php if(!empty($big_menu)): ?><a class="add fb" href="<?php echo ($big_menu["0"]); ?>"><em><?php echo ($big_menu["1"]); ?></em></a>　<?php endif; ?>
    </div>
</div><?php endif; endif; ?>
  <div class="pad-10">
    <div class="col-tab">
    
      <ul class="tabBut cu-li">
        <li id="tab_setting_1" class="on">缓存管理</li>
      </ul>
      
      <div id="div_setting_1" class="contentList pad-10">
          <table width="100%" cellpadding="2" cellspacing="1" class="table_form">
            <tr>
                <td width="150">全站缓存</td>
                <td align="left"><a href="<?php echo U('cache/clearCache',array('id'=>1));?>" class="button">更新</a></td>
            </tr>
            <tr>
                <td width="150">后台模版缓存</td>
                <td align="left"><a href="<?php echo U('cache/clearCache',array('id'=>2));?>" class="button">更新</a></td>
            </tr>
            <tr>
                <td width="150">前台模版缓存</td>
                <td align="left"><a href="<?php echo U('cache/clearCache',array('id'=>3));?>" class="button">更新</a></td>
            </tr>
            <tr>
                <td width="150">数据库缓存</td>
                <td align="left"><a href="<?php echo U('cache/clearCache',array('id'=>4));?>" class="button">更新</a></td>
            </tr>
            
        </table>
        <div class="bk15"></div>
        <table width="100%" cellspacing="0" class="search-form">
        <tbody>
            <tr>
            <td>
            <div class="explain-col">
            	<font color=red>
            	<b>功能说明：</b><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、更新前台变更过的模板及缓存；<br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、更新商品喜欢的数量；<br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、更新商品的评论数量；<br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、更新商品分类的数量；<br>
            	</font>
        	</div>
            </td>
            </tr>
        </tbody>
      </table>
      </div>
     
      <div class="bk15"></div>

    </div>

  </div>
</body></html>