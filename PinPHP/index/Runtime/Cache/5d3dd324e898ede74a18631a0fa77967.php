<?php if (!defined('THINK_PATH')) exit();?><script type="text/javascript" src="__ROOT__/statics/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="__ROOT__/statics/js/pinphp.js"></script>
<script type="text/javascript" src="__TMPL__public/js/common.js"></script>
<table id="share_result_dialog">
    <tr>
        <th style="width:80px;">宝贝名称：</th>
        <td class='title'></td>
    </tr>
    <tr>
    	<th align="right">所属分类:</th>
        <td><select onchange="get_child_cates(this,'sid');" id="pid" name="pid" class="input_text" style="width:90px;height:30px;">
			<option value="">--请选择--</option>
			<?php if(is_array($item_cate_first_list)): $i = 0; $__LIST__ = $item_cate_first_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><option value="<?php echo ($val["id"]); ?>"><?php echo ($val["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
            </select>&nbsp;-&nbsp;
                        <select onchange="get_child_cates(this,'cid');" id="sid" name="sid"  class="input_text" style="width:90px;height:30px;">
							<option value="">--请选择--</option>
                        </select>
                        &nbsp;-&nbsp;
                        <select id="cid" name="cid"  class="input_text" style="width:95px;height:30px;">
							<option value="">--请选择--</option>
                        </select>
    	</td>
    </tr>
    <tr>
        <th>宝贝图片：</th>
        <td class="img"></td>
    </tr>  
    <tr>
        <th>宝贝标签：</th>
        <td><input type="text" class="tags big_text" value="" maxlength="255"/></td>
    </tr>
    <tr>
        <th>备注:</th>
        <td>
            <textarea class="remark big_text" value="" style="height:100px;" maxlength="50"></textarea>
        </td>
    </tr>                
    <tr>
        <td><input type="submit" class="ui_button commit" value="发布"/></td>
        <td></td>
    </tr>                          
</table>