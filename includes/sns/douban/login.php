<?php
header("Content-type:text/html; charset=UTF-8;");
COOKIE('redirect', $_SERVER['HTTP_REFERER']);
header("Location:https://www.douban.com/service/auth2/auth?response_type=code&client_id=".WB_AKEY."&redirect_uri=".WB_CALLBACK_URL.'&scope=douban_basic_common');
