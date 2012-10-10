<?php if (!defined('THINK_PATH')) exit();?><link rel="stylesheet" type="text/css" href="__TMPL__public/css/uc_v1.css" />   
<script language="javascript" type="text/javascript" src="__ROOT__/statics/js/jquery/plugins/formvalidatorregex.js"></script>
<div class="register account" id= "register_dialog">
	<div id="reg_left">
		<h2>新会员注册</h2>
		<div class="hint">加入<?php echo ($site_name); ?>，发现时尚，分享购物乐趣。</div>
		<form action="" method="post" id="myform">          
			<table style="margin:20px 0px 0px 0px;">
                        <tr>
                            <th  style="width:85px"><em class="red">*&nbsp;</em>登录帐号：</th>
                            <td><input type="text" class="input_text" id="name" name="name" value="<?php echo ($data["name"]); ?>"/></td>
							<td><div id="nameTip"></div></td>
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
                            	<img src="<?php echo u('public/verify');?>" url="<?php echo u('public/verify');?>" class="verify_img" class="left" 
                                onclick="changeVerify(this)"
                                style="margin:5px 0px 0px 10px;"/>
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
		<a class="login_btn" href="javascript:;" onclick="toLogin()"></a>
		
		<p>您也可以用以下方式登录</p>
		<div class="login_list clearfix">
			<a href="<?php echo u('uc/sina_login');?>" class="sina" target="_blank"></a>
			<a href="<?php echo u('uc/qq_login');?>" class="qq" target="_blank"></a>
		</div>                
	</div>
</div>