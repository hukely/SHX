<?php if (!defined('THINK_PATH')) exit();?><div id="login_dialog" class="login box_content" style="width:500px;">
	<table style="width:100%;">
		<tr>
			<th style="width:54px;">帐号：</th>
			<td style="width:240px;"><input type="text" class="input_text" id="name" value="邮箱/会员帐号" /></td>
			<td rowspan="4" valign="top">
				<div style="border-left:1px dotted #CDCDCD;padding-left:10px;height:150px;">
					你也可以使用这些帐号登录
					<div class="login_list clearfix mt10">
						<!--<a href="<?php echo u('uc/taobao_login');?>" target="_blank" class="taobao"></a>-->
						<a href="<?php echo u('uc/sina_login');?>" class="sina" target="_blank"></a>
						<a href="<?php echo u('uc/qq_login');?>" class="qq" target="_blank"></a>
						<a href="<?php echo u('uc/linkedin_login');?>" class="linkedin" target="_blank"></a>
						<a href="<?php echo u('uc/tencentWeibo_login');?>" class="tencentWeibo" target="_blank"></a>
						<a href="<?php echo u('uc/renren_login');?>" class="renren" target="_blank"></a>
						<a href="<?php echo u('uc/NetEase_login');?>" class="NetEase" target="_blank"></a>
						<a href="<?php echo u('uc/kaixin_login');?>" class="kaixin" target="_blank"></a>
					</div>    
					<br/>
					还没有账户？请<a href="javascript:;" onclick="toRegister()">注册</a>
				</div>
			</td>
		</tr>
		<tr>
			<th>密码：</th>
			<td><input type="password" class="input_text" id="passwd"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="checkbox" style="margin-right:4px;"/>两周内自动登录</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" class="submit" value="登录"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<p class="hint"></p>
			</td>
		</tr>
	</table>        	
</div>