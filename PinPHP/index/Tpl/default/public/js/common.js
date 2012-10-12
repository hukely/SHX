function item_masonry(){ 
    $('.item img').load(function(){ 
        $('.infinite_scroll').masonry({ 
            itemSelector: '.masonry_brick',
            columnWidth:226,
			isFitWidth:true,
            gutterWidth:15								
        });		
    });
}
//商品列表
$(function(){
    function user_callback(context){
        context=typeof context=='undefined'?$('body'):context;
        if(def.user_id==null||def.uid!=def.user_id)return;
        function append(){
            $('.item_list .item',context).append("<div class='del'></div>")
            .hover(function(){ 
                $('.del',this).show();								 
            },function(){ 
                $('.del',this).hide();
            });
        }
        append();
        var url;
        if(def.module=="uc"&&def.action=='like'){ 
            url=def.root+"index.php?act=del&m=uc&a=like";
        }else if(def.module=="album"&&def.action=="details"){
            url=def.root+"index.php?act=del&m=album&a=items";
        }
        $('.item_list .del',context).click(function(){ 
            if(confirm("确定要删除吗?")){ 
                var id=$(this).parent().attr('iid');
                $.post(url,{
                    id:id
                },function(data){ 
                    if(data.data>0){ 
                        window.location.href="";
                    }else{ 
                        alert("删除错误!");
                    }
                },"json");		
            }
        });				 		
    }
    function item_callback(context){
        context=typeof context=='undefined'?$('body'):context;
        item_masonry();	
        $('.encode_url',context).each(function(){
            var url=$(this).attr('url')||"";
            var tag=$(this).prop('tagName').toLowerCase();
            if(tag=='img'){ 
                $(this).attr('src',base64_decode(url));
            }else if(tag=='a'){ 
                $(this).attr('href',base64_decode(url));
            }	
        });			
        user_callback(context);
        album_callback(context);
        //商品喜欢
        $(".like_it,.img_like_btn,.like_btn",context).click(function(){	
            var iid = $(this).attr('iid');
            var iurl = $(this).attr('iurl');
            if(!iurl){ 
                var iurl=window.location.href.substr(0,window.location.href.indexOf('#'));	
            }
            var btn=$(this);
            $.get(def.root+"index.php?m=uc&a=like&act=add", {
                id: iid
            }, function(data){
                if(data.data=='not_login'){ 
                    login();
                    return;	
                }else if(data.data=='yet_exist'){ 
                    tips(btn.parent(),">_<喜欢过了 <a href='"+iurl+"#items_comments'>再说两句</a>",'yes');
                }else if(data.data>0){ 
                    $("#like_num_"+iid).html(parseInt($("#like_num_"+iid).html())+1);				
                    tips(btn.parent(),"添加成功! <a href='"+iurl+"#items_comments'>再说两句</a>",'yes');
                }
            },'json'); 
        });
      
		
        jq_corner(context);
    }
    item_callback();  
    $('.item').fadeIn();
    /**/
    var sp = 1
    $(".infinite_scroll").infinitescroll({
        navSelector  	: "#more",
        nextSelector 	: "#more a",
        itemSelector 	: ".item",
        loading: {
            img: def.root+"statics/images/masonry_loading.gif",
            msgText: "加载更多商品",
            finishedMsg: '你好坏，都被你看光了!',
            finished: function(){
                sp++;
                if(sp>=def.waterfall_sp){
                    $("#more").remove();
                    $("#infscr-loading").hide();
                    $("#page").show();
                    $(window).unbind('.infscr');
                }
            }	
        },
        errorCallback:function(){ 
            $("#page").show();
        }
    }, function(newElements){
        var $newElems = $(newElements);
        $('.infinite_scroll').masonry('appended', $newElems, false);
        $newElems.fadeIn();
        item_callback($newElems);		
    });	
	imgBox();	
});

//添加评论
$(function(){ 
    $('.comments').each(function(){ 
        var context=$(this);
        var comments_box=$('.comments_box',context);
        var comments_btn=$('.comments_btn',context);
		
        var pid=comments_btn.attr('pid');
        var default_comment=comments_box.attr('def');
        var type = def.module;
        var orig = def.action;
		
        page(def.root+"index.php?m=uc&a=comments&pid="+pid+"&type="+type+"&orig="+orig);

        comments_box.focus(function(){ 
            if($.trim($(this).val())==default_comment){ 
                $(this).val("");												   
            }
        }).blur(function(){ 
            if($.trim($(this).val()).length==0){ 
                $(this).val(default_comment);
            }
        }).val(default_comment);
		
        comments_btn.click(function(){ 
            if(!login())return;
            var info=$.trim(comments_box.val());
			
            if(info.length==0 || info==default_comment){ 
                alert("评论不能为空!");
                return;
            }
			
            $.post(def.root+"index.php?m=uc&a=comments&act=add",{
                pid:pid,
                info:info,
                type:type,
                orig:orig
            },
            function(data){ 																	
                page(def.root+"index.php?m=uc&a=comments&pid="+pid+"&type="+type+"&orig="+orig);
                cbpage();
                comments_box.val(default_comment);
            },'json');													 
        });
        //分页
        function page(url){ 
            var comments_list=$('.list',context);
            var pager="";
            if($('li',comments_list).size()!=0){
                pager=$('#page_wrap',context).html();
            }else{ 
                //第一次添加评论
                comments_list.height(32);
            }
            var height=comments_list.height();
            var width=comments_list.width();
            comments_list.append("<div class='loading'></div>");
            $('.loading',context).css({
                "height":height+"px",
                "width":width+"px"
            });
            $.post(url,function(data){ 
                data=data.data;		
                $('.list_wrap',context).html(data.list);
                $('#comments_count').html(data.count);
                cbpage();
                item_masonry();					
            },'json');		
        }
		
        function cbpage(){ 
            $('.page_num a',context).click(function(){
                $(this).click(function(){
                    return false;
                });
                page($(this).attr('href'));
                return false;
            });		
        }
        cbpage();								 
    });
});

//加入专辑
function album_callback(context){ 
    context=typeof context=='undefined'?$('body'):context;
    $('.img_album_btn',context).click(function(){ 
        var iid = $(this).attr('iid');
        var btn=$(this);
        if(def.user_id==null){ 
            login();
            return;	
        }
        $.post(def.root+"index.php?m=album&a=album_items_add_dialog",function(data){ 
            try{ 
                var error= eval("("+data+")");
                if(error.data=='not_login'){ 
                    login();
                    return;	
                }
            }catch(e){}
			
            var album_items_add_dialg=art.dialog({
                title:'加入专辑',
                id:'album_items_add_dialg',
                content:data,
                lock:true
            });	
            //console.log(album_items_add_dialg);
            var $dlg=$(".album_items_add_dialog");
            $('.thumb',$dlg).html($('.encode_url',btn.parent().parent()).parent().html());
            $('.submit',$dlg).click(function(){ 
                $.post(def.root+"index.php?m=album&a=items", 
                {
                    act:'add',
                    items_id:iid,
                    pid:$('#pid',$dlg).val(),
                    remark:$('textarea',$dlg).val()
                },
                function(data){
                    if(data.data=='yet_exist'){ 
                        alert("已经添加到该专辑了");
                        album_items_add_dialg.close();
                        return;
                    }
                    alert("添加成功!");
                    //messagebox('添加成功!');
                    album_items_add_dialg.close();
                },
                'json'); 																	
            });						
        });							   
    });	
}

//关注
$(function(){ 
    function add_follow(){ 
        $('.add_follow').click(function(){
            var context=$(this);
            if(def.user_id==null){ 
                login();
                return;	
            }	
            if($.trim($(this).attr("class"))!="add_follow")return;
			
            var fans_id=$(this).attr('fans_id');
            if(fans_id==def.user_id){
                alert('不能关注自己!');
                return;
            }
            $.post(def.root+'index.php?m=uc&a=follow&act=add',{
                fans_id:fans_id
            },function(data){ 
                if(data.data=='success'){ 
                    messagebox("添加成功!");
                    context.addClass('yet');
                    context.unbind("click");
                    del_follow();
                }
            },'json');
        });	
    }
    function del_follow(){ 
        $('.add_follow.yet').hover(function(){ 
            $(this).addClass("bg_none");
            $(this).html('取消');
        },function(){
            $(this).removeClass('bg_none');
            $(this).html('');
        }).click(function(){ 
            var context=$(this);
            var fans_id=$(this).attr('fans_id');
            $.post(def.root+'index.php?m=uc&a=follow&act=del',{
                fans_id:fans_id
            },function(data){ 
                if(data.data=='success'){ 
                    messagebox("成功取消关注该用户!");
                    context.removeClass('yet');
                    context.unbind("mouseover");
                    context.unbind("click");
                    add_follow();
                }
            },'json');
        });	 	
    }
    add_follow();
    del_follow();
});

var Browser_Name = navigator.appName;
var Browser_Version = parseFloat(navigator.appVersion);
var Browser_Agent = navigator.userAgent;
var Actual_Version, Actual_Name;
var is_IE = (Browser_Name == "Microsoft Internet Explorer");
if(is_IE) {
    var Version_Start = Browser_Agent.indexOf("MSIE");
    var Version_End = Browser_Agent.indexOf(";", Version_Start);
    Actual_Version = Browser_Agent.substring(Version_Start + 5, Version_End)
    Actual_Name = Browser_Name;
    if(Browser_Agent.indexOf("Maxthon") != -1) {
        Actual_Name += "(Maxthon)";
    }
}
function addBookmark(title,url) 
{
    if($.browser.webkit){ 
        alert("请用CTRL+D收藏本网页！");
        return true;
    }
    if (window.sidebar){ 
        window.sidebar.addPanel(title, url,""); 
    } 
    else if( document.all ){
        window.external.AddFavorite( url, title);
    } 
    else if( window.opera && window.print ){
        return true;
    }
}
function SetHome(obj,url){ 
    if($.browser.webkit){ 
        alert("请手动设置，webkit浏览器暂不支持！");
        return true;
    }
    try{ 
        obj.style.behavior='url(#default#homepage)';
        obj.setHomePage(url); 
    } 
    catch(e){ 
        if(window.netscape) { 
            try { 
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
            } 
            catch (e) { 
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
            } 
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
            prefs.setCharPref('browser.startup.homepage',url); 
        } 
    } 
} 
function jq_corner(context){ 
    var context=typeof context=='undefined'?$('body'):context;
    try{ 
        $('.jq_corner',context).corner();	
    }catch(e){}
}

$(function(){ 
    $('input[type="text"],textarea').focus(function(){ 
        $(this).addClass('input_on');
    }).blur(function(){
        $(this).removeClass('input_on');
    });
    jq_corner();
});
//禁止选择一级分类
function check_cate(obj){ 
    var level=parseInt($("option:selected",$(obj)).attr('level'));
    var pid=parseInt($("option:selected",$(obj)).attr('pid'));
    if(pid==0||level==0||level==1){
        alert("一级、二级分类禁止选择!");
        $('option[value="0"]',$(obj)).attr('selected','selected');
    }
}
//记录点击前url
$(function(){ 
    uc_share(".top_share");
    $('.url_cookie').click(function(){ 
        $.cookie('redirect',window.location.href,{
            path:'/'
        });
    });
    $('.login_list a').click(function(){ 
        $.cookie('redirect',window.location.href,{
            path:'/'
        });	
    });	
});

//图片框
function imgBox() {
	$('.fancybox').fancybox({
			padding: 10,
			openEffect : 'elastic',
			openSpeed  : 300,
			closeEffect : 'elastic',
			closeSpeed  : 150,
			closeClick : true,
			helpers : {
				
			}
	});
}

//提示框
var hMessagebox;
function messagebox(s,cls){ 
    cls=typeof cls=='undefined'?'yes':cls;
    var html="<div class='d-"+cls+"'>"+s+"</div>";
    hMessagebox=art.dialog({
        id:'messagebox',
        title:false,
        content:html,
        lock:true
    });	
    hMessagebox.time(1000);
}
//登录框
function login(){ 
    if(parseInt(def.user_id)>0)return true;
    $.post(
    	def.root+'index.php?m=uc&a=login_dialog',
    	function(data){ 
	        art.dialog({ 
	            id:'login',
	            title:'登录',
	            content:data,
	            lock:true,
				initialize: function () {
					$('.d-content').css('height', '200');
				}
	        });
	        var context=$('#login_dialog');
	        $('.login_list a').click(function(){ 
	            $.cookie('redirect',window.location.href,{
	                path:'/'
	            });								  
	        });
	        $('.submit',context).click(function(){ 
	            var name=$.trim($('#name',context).val());
	            var passwd=$.trim($('#passwd',context).val());
				
	            $.post(
	            	def.root+'index.php?m=uc&a=login',
	            	{name:name,passwd:passwd},
		            function(data){ 
		                data=data.data;
		                if(data.err=="0"){ 
		                    $('.hint',context).html(data.msg);
		                    return;
		                }
		                window.location.href="";
		            },
		            'json'
	            );
	        });
	        return false;	
	    }
    );
}
//从注册框跳往登陆框
function toLogin() {
	var dialog = art.dialog.get('register');
	dialog.close();
	login();
}

//注册框
function registerBox() {
	if(parseInt(def.user_id)>0)return true;
    $.post(
    	def.root+'index.php?m=uc&a=register_dialog',
    	function(data){ 
    		art.dialog({ 
    			id:'register',
	            title:'注册',
	            content:data,
	            lock:true,
				initialize: function () {
					$('.d-content').css('height', '450');
				}
	        });
			jQuery.getScript(def.root+'statics/js/jquery/plugins/formValidatorRegex.js', function() {
				validatorReg();
			});
	        var context=$('#register_dialog');
	        $('.login_list a').click(function(){ 
	            $.cookie('redirect',window.location.href,{
	                path:'/'
	            });								  
	        });
			$('#myform').submit(function() { return false; });
	        $('input[name="dosubmit"]', context).click(function(){ 
	            var name=$.trim($('#name',context).val());
	            var passwd=$.trim($('#passwd',context).val());
	            var email=$.trim($('#email',context).val());
	            var phone=$.trim($('#phone',context).val());
	            var verify=$.trim($('#verify',context).val());
	            $.post(
					def.root+'index.php?m=uc&a=ajaxRegister',
	            	{name:name, passwd:passwd, email:email, phone:phone, verify:verify},
		            function(data){ 
		                data=data.data;
		                if(data.err=="0"){ 
		                    $('.hint',context).html(data.msg);
		                    return;
		                }else{
							 $('.hint',context).html(data.msg);
							setTimeout(function(){ 
								dialog.close();
							},1000);
						}
						 window.location.reload();
		            },
		            'json'
	            );
	        });
	        return false;	
	    }
    );
}

//从注册框跳往登录框
function toRegister() {
	var dialog = art.dialog.get('login');
	dialog.close();
	registerBox();
}

//validator注册验证
function validatorReg(){
	$.formValidator.initConfig({
		theme:"126",
		submitOnce:true,
		formID:"myform",
		onError:function(msg){alert(msg);},
		submitAfterAjaxPrompt : '正在向服务器验证，请稍等...'
	});
	$('#name').formValidator({onShowText:"请输入用户名",onShow:"请推填写登录用户名",onFocus:"6~12个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾",onCorrect:"该用户名可以注册"}).inputValidator({min:6,max:12,onError:"你输入的用户长度不正确,请确认"}).regexValidator({regExp:"username",dataType:"enum",onError:"用户名格式不正确"})
	    .ajaxValidator({
		dataType : "html",
		type : "POST",
		async : true,
		url : def.root+"uc/ajaxRegister",
		success : function(data){
            if( data == 1) {
				return true;
			}else{
				return false;
			}
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该用户名不可用，请更换用户名",
		onWait : "正在进行合法性校验，请稍候..."
	});
	$("#passwd").formValidator({onShow:"6~16个字符，包括字母、数字、特殊符号，区分大小写",onFocus:"6~16个字符，包括字母、数字、特殊符号，区分大小写",onCorrect:"密码格式正确"}).inputValidator({min:6,max:16,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码长度错误,请确认"}).passwordValidator({compareID:"us"});
	$("#confirm_passwd").formValidator({onShow:"再次输入密码",onFocus:"必须与登录密码相同",onCorrect:"密码一致"}).inputValidator({min:1,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"passwd",operateor:"=",onError:"2次密码不一致,请确认"});
	$("#email").formValidator({onShow:"请输入邮箱",onFocus:"email地址包含6-100个字符及@符",onCorrect:"邮箱格式正确",defaultValue:"@"}).inputValidator({min:6,max:100,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"}).ajaxValidator({
		dataType : "html",
		type : "POST",
		async : true,
		url : def.root+"uc/ajaxRegister",
		success : function(data){
            if( data == 1) {
				return true;
			}else{
				return false;
			}
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该邮箱已被注册，请更换",
		onWait : "正在进行合法性校验，请稍候..."
	});
	$("#phone").formValidator({onShow:"请输入手机号码",onFocus:"手机的长度必须是11位",onCorrect:"手机格式正确"}).inputValidator({min:11,max:11,onError:"手机号码必须为11位,请确认"}).regexValidator({regExp:"mobile",dataType:"enum",onError:"手机的格式不正确"}).ajaxValidator({
		dataType : "html",
		type : "POST",
		async : true,
		url : def.root+"uc/ajaxRegister",
		success : function(data){
            if( data == 1) {
				return true;
			}else{
				return false;
			}
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "该手机号码已被注册，请更换",
		onWait : "正在进行合法性校验，请稍候..."
	});
}

//验证码更换
function changeVerify(obj){
	var timenow =new Date().getTime();
	obj.src =$(obj).attr('url')+'&time='+timenow;
}

//搜索
function check_search(obj){ 
    var context=$(obj);
    var keywords=$.trim($("input[name='keywords']",context).val());
    if(keywords.length==0||keywords==default_kw)return false;
    window.location.href=def.root+"index.php?m=search&a=index&type=search&keywords="+encodeURIComponent(keywords);
    return false;
}
//创建提示
function tips(context,msg,err){ 
    var html="<div class='append'>\
	<div class='tips'><div class='tips_content'>"+msg+"</div></div>\
	</div>";
    $('.append',context).remove();
    context.append(html);
    $('.tips_content',context).addClass(err);
    if(def.module=='cate'||def.module=='search'){ 
        $('.tips_content a',context).attr('target','_blank');	
    }

    $('.tips',context).show();
    //return;
    setTimeout(function(){ 
        $('.tips',context).fadeOut();
        $('.append',context).remove();
    },2000);
}
/*
分享宝贝
*/
function uc_share(mixed){
    var context=$(mixed);
    function _callback(){ 
        $('.close',context).click(function(){ 
            $('.dialog',context).hide();											 
        });
        $('.submit',context).click(function(){ 
            var submit=$(this);
			
            submit.addClass('on').attr('disabled','disabled');
            $('.hint',context).html('宝贝信息抓取中……').show();
            var url=$.trim($('.url',context).val());
            if(url.length==0){ 
                $('.hint',context).html("<span class='error'>请输入网址!</span>");
                submit.removeClass('on').attr('disabled','');
                return;
            }
            $.post(def.root+'index.php?m=uc&a=items_collect',{
                url:url
            },function(data){ 
                data=data.data;
                submit.removeClass('on').attr('disabled','');
                if(data.code){
                    $('.hint',context).html("<span class='error'>配置错误("+data.msg+")!</span>")
                    return;
                }					
                if(data.err=='yet_exist'){ 
                    $('.hint',context).html("<span class='error'>商品已经存在!</span>[<a href='"+data.url+"' target='_blank'>点击查看</a>]")
                    return;
                }
                if(data.err=='remote_not_exist'){ 
                    $('.hint',context).html("<span class='error'>抓取失败，网址错误!</span>")
                    return;
                }			
                $('.hint',context).hide();
                $('.dialog',context).hide();

                data.user_id=def.user_id;
                $.post(def.root+'index.php?m=uc&a=share_result_dialog',function(content){ 
                    var share_result_dialog=art.dialog({
                        id:'share_result_dialog',
                        title:'嗯~ 就是它吧',
                        content:content,
                        lock:true
                    });			
					
                    $('#share_result_dialog .title').html(data.title);
                    $('#share_result_dialog .tags').val(data.tags);
                    $('#share_result_dialog .img').html("<img src='"+data.simg+"'/>");
					
                    var dialog=$('#share_result_dialog');
					
                    $('.commit',dialog).click(function(){ 
                        var cid=parseInt($("#share_result_dialog #cid").val());
                        if(cid==0){ 
                            alert('请选择分类!');
                            return;
                        }
						
                        $(this).attr('disabled','disabled');
                        data.pid=$("select[name='pid']",dialog).val();
                        data.sid=$("select[name='sid']",dialog).val();
                        data.cid=$("select[name='cid']",dialog).val();
                        data.tags=$(".tags",dialog).val();
                        data.remark=$(".remark",dialog).val();
                        //console.log(data);return;
                        $.post(def.root+'index.php?m=uc&a=share&act=add',data,function(data){
                            data=data.data;
                            if(data=='success'){
                                share_result_dialog.close();
                                window.location.href=def.root+"index.php?m=uc&a=share";
                            }
                            $(this).attr('disabled','');
                        },'json');							  
                    });						
                });
            },'json');											   
        });		
    }	
    $('.button,.uc_share_btn',context).click(function(){	
        $.post(def.root+'index.php?m=uc&a=share_dialog',function(data){
            var html="<div class='append'>"+data+"</div>";
            $(".append",context).remove();
            context.append(html);
            _callback();
            if($('.dialog:visible',context).size()>0){ 
                $('.dialog',context).hide();
            }else{ 
                $('.dialog',context).show();	
            }			
        });

    });
}


var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
//将Ansi编码的字符串进行Base64编码
function base64_encode(input) {
    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;

    do {
        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (isNaN(chr2)) {
            enc3 = enc4 = 64;
        } else if (isNaN(chr3)) {
            enc4 = 64;
        }

        output = output + 
        keyStr.charAt(enc1) + 
        keyStr.charAt(enc2) + 
        keyStr.charAt(enc3) + 
        keyStr.charAt(enc4);
        chr1 = chr2 = chr3 = "";
        enc1 = enc2 = enc3 = enc4 = "";
    } while (i < input.length);

    return output;
}


//将Base64编码字符串转换成Ansi编码的字符串
function base64_decode(input) {
    var output = "";
    var chr1, chr2, chr3 = "";
    var enc1, enc2, enc3, enc4 = "";
    var i = 0;
    //if(typeof input.length=='undefined')return '';
    if(input.length%4!=0){
        return "";
    }
    var base64test = /[^A-Za-z0-9\+\/\=]/g;
	
    if(base64test.exec(input)){
        return "";
    }
	
    do {
        enc1 = keyStr.indexOf(input.charAt(i++));
        enc2 = keyStr.indexOf(input.charAt(i++));
        enc3 = keyStr.indexOf(input.charAt(i++));
        enc4 = keyStr.indexOf(input.charAt(i++));
		
        chr1 = (enc1 << 2) | (enc2 >> 4);
        chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
        chr3 = ((enc3 & 3) << 6) | enc4;
		
        output = output + String.fromCharCode(chr1);
		
        if (enc3 != 64) {
            output+=String.fromCharCode(chr2);
        }
        if (enc4 != 64) {
            output+=String.fromCharCode(chr3);
        }
		
        chr1 = chr2 = chr3 = "";
        enc1 = enc2 = enc3 = enc4 = "";
	
    } while (i < input.length);
    return output;
}
function get_child_cates(obj,to_id)
{
	var parent_id = $(obj).val();
	if(to_id == 'sid') {
		$('#cid').html( '<option value=\"\">--请选择--</option>');
	}
	if( parent_id ){
		$.get('?m=uc&a=get_child_cates&parent_id='+parent_id,function(data){
				var obj = eval("("+data+")");
				$('#'+to_id).html( obj.content );
	    });
    }
}