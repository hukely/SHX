<?php

class itemAction extends baseAction {

    public function index() {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : $this->error("404");

        $items_mod = D('items');
        $items_pics_mod = D('items_pics');
        $items_cate_mod = D('items_cate');

        $item = $items_mod->where("id=".$id." and status='1'")->find();
        if( !$item ){
            $this->redirect('index/index');
        }
        $item['items_cate'] = $items_mod->relationGet("items_cate");
        $item['items_site'] = $items_mod->relationGet("items_site");
        $item['items_tags'] = $items_mod->relationGet("items_tags");
        $tag_str = '';
        foreach ($item['items_tags'] as $tag) {
            $tag_str .= $tag['name'] . ' ';
        }
		if($item['sid'] == 2) {
			$item['img'] = __ROOT__.$item['img'];
			$item['simg'] = __ROOT__.$item['simg'];
			$item['bimg'] = __ROOT__.$item['bimg'];
		}
        $this->seo['seo_title'] = !empty($item['seo_title']) ? $item['seo_title'] : $item['title'];
        $this->seo['seo_title'] = $this->seo['seo_title'] . ' - ' . $this->setting['site_name'];
        $this->seo['seo_keys'] = !empty($item['seo_keys']) ? $item['seo_keys'] : $tag_str;
        if($item['seo_title']=="") {
            $this->seo['seo_title'] = $item['title'];
        }else{
            $this->seo['seo_title'] = $item['seo_title'];
        }
        if($item['seo_keys']=="") {
            $this->seo['seo_keys'] = $tag_str." ".$item['title'];
        }else{
            $this->seo['seo_keys'] = $item['seo_keys'];
        }
        
        if($item['seo_desc']=="") {
            $this->seo['seo_desc'] = $item['title']." ".$item['info'];
        }else{
            $this->seo['seo_desc'] = $item['seo_desc'];
        }
        
        //同大类商品
        $siblings_cate_group = $items_cate_mod->where("pid=" . $item['items_cate']['pid'] . " AND is_hots=1")->limit('0,4')->order("ordid DESC")->select();
        foreach ($siblings_cate_group as $key => $val) {
            $siblings_cate_group[$key]['items'] = $this->get_group_items($val['id']);
        }
        $items_list = $items_mod->relation('items_site')->where('cid=' . $item['cid'])->limit('0,20')->select(); //同类商品
        $this_cate_group = $this->get_group_items($item['cid']); //所在分类展示
        $source_group = $this->get_group_items_bysource($item['sid']); //相同来源展示
        $items_mod->where('id=' . $id)->setInc('hits'); //浏览次

        $pics = $items_pics_mod->where("item_id=".$id)->order('add_time DESC')->select();

        $this->assign('items_id',$id);
        $this->assign('pics',$pics);
        $this->assign('seo', $this->seo);
        $this->assign('item', $item);
        $this->assign('items_list', $items_list);
        $this->assign('siblings_cate_group', $siblings_cate_group);
        $this->assign('this_cate_group', $this_cate_group);
        $this->assign('source_group', $source_group);

        $this->display();
    }

    function tao(){
    	$id=intval($_REQUEST['id']);
    	$res=$this->items_mod->where('id='.$id)->find();
    	if($res){
        	redirect($res['url']);
    	}
    }
    function img(){
    	$id = intval($_REQUEST['id']);
    	$type = $_REQUEST['type'];
    	$res = $this->items_mod->where('id='.$id)->find();
       	if($res){
           header("content-type:image/jpg");
           print_r(file_get_contents($res[$type]));
       }
    }

    public function submit_comment()
    {
        $data = 1;
        if($this->check_login()){
            $data = 0;
        }
        if( $data == 0 ){
            $item_id = $this->_get('item_id','intval');
            $info = $this->_get('info','trim');
            $item_comment_mod = D('items_comments');
            $items_mod = D('items');
            $comment['uid'] = $_SESSION['user_id'];
            $comment['item_id']=$item_id;
            $comment['info']=$info;
            $comment['add_time']=time();
            $comment['type']='album';
            $comment['status']=1;
            if( $item_comment_mod->add($comment) ){
                $items_mod->where('id='.$item_id)->setInc('comments');
                $data = 1;
            }else{
                $data = 0;
            }
        }
        echo $data;
    }
	public function sharePicture() {
		if(!isset($_SESSION['user_id'])) {
			$this->redirect('uc/login');
		}
		$shareUrl = 'javascript:(function(){shx=&quot;'.$this->site_root.'&quot;;theindex_username=&quot;'.base64_encode($_SESSION['user_id'].'@S#H$X%').'&quot;;var script_id = &quot;theindex_tagger_bookmarklet_helper_js&quot;;var s = document.getElementById(script_id);var can_continue = true;if (s) {var t = window;try {if (t.theindex_bookmarklet) {t.theindex_bookmarklet.tagger.clean_listeners();s.parentNode.removeChild(s);} else {can_continue = false;}} catch (e5) {can_continue = false;}};if (can_continue) {_my_script = document.createElement(&quot;SCRIPT&quot;);_my_script.type = &quot;text/javascript&quot;;_my_script.id = script_id;_my_script.src = &quot;'.$this->site_root.'statics/js/shx_tagger.js?x=&quot; + (Math.random());document.getElementsByTagName(&quot;head&quot;)[0].appendChild(_my_script);}})();';
		if(isset($_POST['submitPicture'])) {
			if ($_FILES['img']['name'] != '') {
				$upload_list = $this->_upload($_FILES['img']);
			}
			$items_cate_mod = D('items_cate');
			$item_cate_first_list = $items_cate_mod->field('id,name')->where(array('pid' => 0))->order('ordid DESC')->select();
			$this->assign('first_cates_list', $item_cate_first_list);
			$this->assign('pictureUrl', $upload_list['0']['shortUrl'].$upload_list['0']['savename']);
			$this->display('addPicture');
			exit;
		}
		$this->assign('shareUrl', $shareUrl);
		$this->display();
	}
	public function addPicture() {
		$items_mod = D('items');
		$items_site_mod = D('items_site');
		if ($_POST['title'] == '') {
			$this->error('请填写商品标题');
		}
		if (false === $data = $items_mod->create()) {
			$this->error($items_mod->error());
		}
		$data['add_time'] = time();
		$data['last_time'] = time();
		if (($_POST['cid'] != "")&&($_POST['scid'] != "")&&($_POST['pcid'] != "")) {
			$data['cid']    = $_POST['cid'];
			$data['level']  = "3";
		} elseif (($_POST['scid'] != "")&&($_POST['pcid'] != "")) {
			$data['cid'] = $_POST['scid'];
			$data['level'] = "2";               
		}elseif ($_POST['pcid'] != "") {
			$data['cid'] = $_POST['pcid'];
			$data['level'] = "1";
		}elseif ($_POST['pcid'] == "") {
			$this->error('请选择分类');
		}

		if ($_POST['img'] != '') {
			$data['img'] = dirname($_POST['img']).'/m_'.basename($_POST['img']);
			$data['simg'] = dirname($_POST['img']).'/s_'.basename($_POST['img']);
			$data['bimg'] = dirname($_POST['img']).'/b_'.basename($_POST['img']);
		} else {
			$this->error('您还没分享图片呢!');
		}

		$data['item_key'] = 'handel_' . time();
		//来源
		$author = 'handel';
		$data['sid'] = $items_site_mod->where("alias='" . $author . "'")->getField('id');
		$item_id = $items_mod->where("item_key='" . $data['item_key'] . "'")->getField('id');
		if ($item_id) {
			$items_mod->where('id=' . $item_id)->save($data);
			$this->success(L('operation_success'));
		} else {
			$new_item_id = $items_mod->add($data);
		}
		if($new_item_id){
			echo("<script> top.location.href='" .__ROOT__.'/item/index/id/'.$new_item_id . "'</script>");
			exit;
		}else{
			$this->error('图片上传失败!');
		}
	}
	private function _upload($imgage, $path = '', $isThumb = true) {
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        //设置上传文件大小
        $upload->maxSize = 3292200;
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
		
        if (empty($path)) {
			$shortUrl = '/data/items/' . date('Y') . '/' . date("md") . "/";
            $upload->savePath = ROOT_PATH.$shortUrl;
        } else {
            $upload->savePath = $path;
        }
        if ($isThumb === true) {
            $upload->thumb = true;
            $upload->imageClassPath = 'ORG.Util.Image';
            $upload->thumbPrefix = 'b_,m_,s_';
            $upload->thumbMaxWidth = '1000,210,64';
            //设置缩略图最大高度
            $upload->thumbMaxHeight = '5000,3000,1000';
            $upload->saveRule = uniqid;
            $upload->thumbRemoveOrigin = false;
        }
        if (!$upload->uploadOne($imgage)) {
            //捕获上传异常
            $this->error($upload->getErrorMsg());
        } else {
            //取得成功上传的文件信息
            $uploadList = $upload->getUploadFileInfo();
			$uploadList[0]['shortUrl'] = $shortUrl;
        }
        return $uploadList;
    }
	public function tagger() {
		$rand = '@S#H$X%';				//固定值,用于加密用户ID;也可为每个id单独使用一个随机值,但会增大数据库开销
		$user_mod = D('user');
		if(isset($_SESSION['user_id'])) {
			$user = $user_mod->field('name')->where(array('id'=>$_SESSION['user_id']))->find();
			$user['name'] = empty($user['name'])?'登入失败':$user['name'];
		}else{
			$userID = rtrim(base64_decode($_GET['user_id']), $rand);
			$user = $user_mod->field('name')->where(array('id'=>$userID))->find();
			$user['name'] = empty($user['name'])?'登入失败':$user['name'];
		}
		$this->assign('user_name', $user['name']);
		$this->assign('csrftoken', $_SESSION['PHPSESSID']);
		$items_cate_mod = D('items_cate');
		$item_cate_first_list = $items_cate_mod->field('id,name')->where(array('pid' => 0))->order('ordid DESC')->select();
		$this->assign('first_cates_list', $item_cate_first_list);
		$this->assign('pictureUrl', $upload_list['0']['shortUrl'].$upload_list['0']['savename']);
		$this->assign('shx', $this->site_root);
		$this->display();
		exit();
	}
	public function ajaxAddPicture() {
		C('DEFAULT_AJAX_RETURN', 'XML');
		$items_mod = D('items');
		if(empty($_POST['user_key'])){
			$this->ajaxReturn(array('message'=>'用户账号有误,重试若无法生效,请重新安装插件!'), '', 0);
			exit;
		}
		$userID = rtrim(base64_decode($_POST['user_key']), '@S#H$X%');
		if (false === $data = $items_mod->create()) {
			$this->ajaxReturn(array('message'=>'抱歉,数据调用失败!'), '', 0);
			exit;
		}
		$data['img'] = $_POST['photo_url'];
		$data['bimg'] = $_POST['photo_url'];
		$data['simg'] = $_POST['photo_url'];
		$data['add_time'] = time();
		$data['uid'] = $userID;
		$data['last_time'] = time();
		if($_POST['category'] != "") {
			$data['cid'] = $_POST['category'];
			$data['level'] = "1";
		}elseif ($_POST['category'] == "") {
			$data['cid'] = $_POST['category'];
			$data['level'] = "0";
		}
		$data['status'] = 0;
		$data['title'] = $_POST['name'];
		//来源
		$author = 'handel';
		$new_item_id = $items_mod->add($data);
		if(!empty($_POST['note'])) {
			$user_comments = D('user_comments');
			$comment = array('info'=>$_POST['note'], 'uid'=>$data['uid'], 'pid'=>$new_item_id, 'add_time'=>time(), 'type'=>'item', 'orig'=>'index');
			$new_comments_id = $user_comments->add($comment);
		}
		$result['status'] = array(
			'status_code'=>1
		);  
		if($new_item_id){
			$this->ajaxReturn('', '添加成功!', 1);
			exit;
		}else{
			$this->ajaxReturn(array('message'=>'抱歉,图片未能抓取成功!'), '', 0);
		}
		
	}
	public function add_photo_tags() {
		C('DEFAULT_AJAX_RETURN', 'XML');
		$data['status'] = array(
			'status_code'=>1,
			'photo_id'=>'bNLfaab',
			'photo_url'=>$_POST['photo_url']
		);
		$this->ajaxReturn($data, '',1);
	}
	
	private function catchPictrue() {
		import("ORG.Net.Http");
		$getHttp = new Http();
		$img = ROOT_PATH. '/data/items/' . date('Y') . '/' . date("md");
		if(!file_exists($img)) {
			mkdir($img);
		}
		$img .= "/".time().'_'.basename($_POST['photo_url']);
		$getHttp->curlDownload($_POST['photo_url'], $img);
		$imgArray = getimagesize($img);
		$uploadImg = array(
			'name'=>basename($img),
			'type'=>$imgArray['mime'],
			'tmp_name'=>$img,
			'error'=>0,
			'size'=>$imgArray['bits']
		);
		 if (file_exists($img)) {
			$upload_list = $this->_upload($uploadImg);
			$data['simg'] = $upload_list['0']['shortUrl'] . '/s_' . $upload_list['0']['savename'];
			$data['img'] = $upload_list['0']['shortUrl'] . '/m_' . $upload_list['0']['savename'];
			$data['bimg'] = $upload_list['0']['shortUrl'] . '/b_' . $upload_list['0']['savename'];
			//$data['img'] = $data['simg'] = $data['bimg'] = $this->site_root . 'data/items/m_' . $upload_list['0']['savename'];
		} else {
			$this->ajaxReturn('', '图片读取失败!', 0);
			exit;
		}
	}
}