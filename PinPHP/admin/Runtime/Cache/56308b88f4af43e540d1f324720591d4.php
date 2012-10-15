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
    <div class="col-tab">
      <ul class="tabBut cu-li">
        	<li id="tab_setting_1" class="on" onclick="SwapTab('setting','on','',3,1);">瀑布流显示</li>
        	<li id="tab_setting_2" onclick="SwapTab('setting','on','',3,2);">URL模式</li>
        	<li id="tab_setting_3" onclick="SwapTab('setting','on','',3,3);">采集设置</li>
      </ul>
      
      <div id="div_setting_1" class="contentList pad-10">
          <table width="100%" cellpadding="2" cellspacing="1" class="table_form">
            <tr>
              <th width="120">每页显示数量 :</th>
              <td><input type="text" name="site[waterfall_sp]" value="<?php echo ($set["waterfall_sp"]); ?>"/></td>
            </tr>
            <tr>
              <th>瀑布流单次显示数量 :</th>
              <td><input type="text" name="site[waterfall_items_num]" value="<?php echo ($set["waterfall_items_num"]); ?>"/></td>
            </tr>            
        </table>
      </div>
      
      <div id="div_setting_2" class="contentList pad-10 hidden">
      	<table width="100%" cellpadding="2" cellspacing="1" class="table_form">       
            <tr>
              <th width="120">URL显示模式 :</th>
              <td width="120"><input type="radio" <?php if($set["url_model"] == '0'): ?>checked="checked"<?php endif; ?> value="0" name="site[url_model]">&nbsp;普通模式 &nbsp;&nbsp;</td>
              <td><font color=red>(注：普通模式是最基本的URL模式，为系统的默认模式！)</font></td>
            </tr>
            <tr>
              <th></th>
              <td width="150"><input type="radio" <?php if($set["url_model"] == '1'): ?>checked="checked"<?php endif; ?> value="1" name="site[url_model]">&nbsp;PATHINFO 模式 &nbsp;&nbsp;</td>
              <td><font color=red>(注：PATHINFO模式需要Web服务器支持，如果Web服务器没有开启相关的功能，则无法正常运行！)</font></td>            
            </tr>
            <tr>
              <th></th>
              <td><input type="radio" <?php if($set["url_model"] == '2'): ?>checked="checked"<?php endif; ?> value="2" name="site[url_model]">&nbsp;REWRITE 模式 &nbsp;&nbsp;</td>
              <td><font color=red>(注：Rewrite模式需要通过配置Apache、Nginx、IIS服务器才能正常使用，不同的Web服务器配置选项也不同!)</font></td>            
            </tr>
            <tr>
              <th></th>
              <td><input type="radio" <?php if($set["url_model"] == '3'): ?>checked="checked"<?php endif; ?> value="3" name="site[url_model]">&nbsp;兼容模式&nbsp;&nbsp;</td>
              <td><font color=red>(注：兼容模式是普通模式和PATHINFO模式的结合。)</font></td>
            </tr>
            
         </table>      
      </div>
      
      <div id="div_setting_3" class="contentList pad-10 hidden">
      	<table width="100%" cellpadding="2" cellspacing="1" class="table_form">       
            <tr>
              <th width="100">喜欢数 :</th>
              <td>
                <input type="radio" <?php if($set["likes_status"] == '1'): ?>checked="checked"<?php endif; ?> value="1" name="site[likes_status]"> 采集喜欢数 &nbsp;&nbsp;
                <input type="radio" <?php if($set["likes_status"] == '0'): ?>checked="checked"<?php endif; ?> value="0" name="site[likes_status]"> 默认为0 &nbsp;&nbsp;
              </td>
            </tr>            
         </table>      
      </div>

      <div class="bk15"></div>

      <div class="btn"><input type="submit" value="<?php echo (L("submit")); ?>" onclick="return submitFrom();" name="dosubmit" class="button" id="dosubmit"></div>

    </div>

  </div>

</form>

<script type="text/javascript">
function SwapTab(name,cls_show,cls_hide,cnt,cur){
    for(i=1;i<=cnt;i++){
		if(i==cur){
			 $('#div_'+name+'_'+i).show();
			 $('#tab_'+name+'_'+i).attr('class',cls_show);
		}else{
			 $('#div_'+name+'_'+i).hide();
			 $('#tab_'+name+'_'+i).attr('class',cls_hide);
		}
	}
}

</script>

</body></html>