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
<form id="myform" name="myform" action="<?php echo u('setting/edit');?>" method="post">
  <div class="pad-10">

 		<table width="100%" cellpadding="2" cellspacing="1" class="table_form">
            <tr>
              <th width="100">新浪微薄 :</th>
              <td><input type="text" name="site[weibo_url]" size="50" value="<?php echo ($set["weibo_url"]); ?>"></td>
            </tr>
            <tr>
              <th>腾讯微薄 :</th>
              <td><input type="text" name="site[qqweibo_url]" size="50" value="<?php echo ($set["qqweibo_url"]); ?>"></td>
            </tr>
            <tr>
              <th>人人主页 :</th>
              <td><input type="text" name="site[renren_url]" size="50" value="<?php echo ($set["renren_url"]); ?>"></td>
            </tr>
            <tr>
              <th>网易微薄 :</th>
              <td><input type="text" name="site[163_url]" size="50" value="<?php echo ($set["163_url"]); ?>"></td>
            </tr>
            <tr>
              <th>QQ空间 :</th>
              <td><input type="text" name="site[qqzone_url]" size="50" value="<?php echo ($set["qqzone_url"]); ?>"></td>
            </tr>
            <tr>
              <th>豆瓣 :</th>
              <td><input type="text" name="site[douban_url]" size="50" value="<?php echo ($set["douban_url"]); ?>"></td>
            </tr>
        </table>
      <div class="bk15"></div>

      <div class="btn"><input type="submit" value="<?php echo (L("submit")); ?>" onclick="return submitFrom();" name="dosubmit" class="button" id="dosubmit"></div>

    </div>


</body></html>