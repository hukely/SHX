<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="__ROOT__/statics/admin/css/style.css" rel="stylesheet" type="text/css"/>
<title>管理中心</title>
</head>

<body scroll="no" class="login_body">
  <table class="login_table">
  	<tbody>
    <tr>
      <td class="logo">
      	<h1>管理中心</h1>
      </td>
      <td class="loginform">
      	<form action="<?php echo u('public/login');?>" method="post" id="myform">
        <table>
          <tr>
          	<th>用户名：</th>
            <td><input class="text user" type="text" name="username" id="username" /></td>
          </tr>
          <tr>
          	<th>密&nbsp;&nbsp;码：</th>
            <td><input class="text pass" type="password" name="password" id="password" /></td>
          </tr>
          <tr>
          	<th></th>
            <td><input type="submit" name="dosubmit" value=" " class="login_btn" /></td>
          </tr>
        </table>
      	</form>
      </td>
    </tr>
    </tbody>
  </table>
</body>
</html>