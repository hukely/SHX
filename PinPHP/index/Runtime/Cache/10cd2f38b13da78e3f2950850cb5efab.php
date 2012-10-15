<?php if (!defined('THINK_PATH')) exit();?><div class="list">
    <ul>
        <?php if(is_array($comments['list'])): $i = 0; $__LIST__ = $comments['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><li class="clearfix">
            <em class="avatar">
            	<a href="<?php echo u('uc/index',array('uid'=>$val['user']['id']));?>" title="<?php echo ($val["user"]["name"]); ?>" target="_blank">
                    <img src="<?php echo uimg($val['user']['img']);?>"/>                
                </if>
            </a></em>
            <div class="item_info">
            	<div class="left">
                    <a class="name" href="<?php echo u('uc/index',array('uid'=>$val['user']['id']));?>" target="_blank"><?php echo ($val["user"]["name"]); ?>：</a>
                    <?php echo ($val["info"]); ?>                
                </div>
                <div class="right"><?php echo date("m月d日   H:i",$val["add_time"]);?></div>
                <div class="clear"></div>
			</div>
        </li><?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</div>
<?php if(strlen(trim($comments['page'])) != 0): ?><div id="page_wrap">
    <div id="page" class="page mt20 clearfix comments" style="display:block;">
	    <div class="page_num"><?php echo ($comments["page"]); ?></div>
    </div>
</div><?php endif; ?> 
<script type="text/javascript">
$(function(){ 
	if(def.module=="album"){ 
		$('.comments .unprev,.comments .prev').html('<');
		$('.comments .unnext,.comments .next').html('>');
	}else{
		$('.comments .unprev,.comments .prev').html('上一页');
		$('.comments .unnext,.comments .next').html('下一页');	
	}			   	
	$('#items_comments span').each(function(){ 
		if($(this).attr('class')=='unprev'||$(this).attr('class')=='prev'||$(this).attr('class')=='unnext'||$(this).attr('class')=='next'){ 
			$(this).hide();
		}										
	});
});
</script>