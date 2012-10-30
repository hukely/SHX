<?php
header("Content-type:text/html; charset=UTF-8;");
COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header("Location:https://oauth.taobao.com/authorize?response_type=user&client_id=".WB_AKEY."&redirect_uri=".WB_CALLBACK_URL);
