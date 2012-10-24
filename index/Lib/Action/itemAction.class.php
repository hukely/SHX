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
		if(isset($_POST['submitPicture'])) {
			if ($_FILES['img']['name'] != '') {
				$upload_list = $this->_upload($_FILES['img']);
			}
			$this->assign('pictureUrl', $upload_list['0']['shortUrl'].$upload_list['0']['savename']);
			$this->display('addPicture');
		}
		$this->display();
	}
	public function addPicture() {
		$items_mod = D('items');
		$items_cate_mod = D('items_cate');
		$items_site_mod = D('items_site');
		$items_tags_mod = D('items_tags');
		$items_pics_mod = D('items_pics');
		$items_tags_item_mod = D('items_tags_item');
		if (isset($_POST['dosubmit'])) {
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

			if ($_FILES['img']['name'] != '') {
				$upload_list = $this->_upload($_FILES['img']);

				$data['simg'] = $upload_list['0']['shortUrl'] . '/s_' . $upload_list['0']['savename'];
				$data['img'] = $upload_list['0']['shortUrl'] . '/m_' . $upload_list['0']['savename'];
				$data['bimg'] = $upload_list['0']['shortUrl'] . '/b_' . $upload_list['0']['savename'];
				//$data['img'] = $data['simg'] = $data['bimg'] = $this->site_root . 'data/items/m_' . $upload_list['0']['savename'];
			} else {
				$this->error('商品图片不能为空');
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
			if ($new_item_id) {
				//相册上传
				if ($_FILES['pic']['name'][0] != '') {
					$pic_list = array();
					$_upload_list = $this->_upload($_FILES['pic']);

					foreach ($_upload_list as $_img) {
						$pic_list[] = array(
							'item_id' => $new_item_id,
							'add_time' => time(),
							'url' => $upload_list['0']['shortUrl'] . $_img['savename'],
						);
					}
					$items_pics_mod->addAll($pic_list);
				}

				//处理标签
				$tags = isset($_POST['tags']) && trim($_POST['tags']) ? trim($_POST['tags']) : '';
				if ($tags) {
					$tags_arr = explode(' ', $tags);
					$tags_arr = array_unique($tags_arr);
					foreach ($tags_arr as $tag) {
						$isset_id = $items_tags_mod->where("name='" . $tag . "'")->getField('id');
						if ($isset_id) {
							$items_tags_mod->where('id=' . $isset_id)->setInc('item_nums');
							$items_tags_item_mod->add(array(
								'item_id' => $new_item_id,
								'tag_id' => $isset_id
							));
						} else {
							$tag_id = $items_tags_mod->add(array(
								'name' => $tag
									));
							$items_tags_item_mod->add(array(
								'item_id' => $new_item_id,
								'tag_id' => $tag_id
							));
						}
					}
				}
				$items_cate_mod->setInc('item_nums', 1);
				$this->success(L('operation_success'));
			} else {
				$this->error(L('operation_failure'));
			}
		}

		$site_list = $items_site_mod->field('id,name,alias')->select();

		//商品分类最上级分类
		$first_cates_list = $items_cate_mod->field('id,name')->where(array('pid' => 0 ))->order('ordid DESC')->select();
		$this->assign('first_cates_list', $first_cates_list);

		$this->assign('site_list', $site_list);
		$this->display();
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
            $upload->thumbMaxWidth = '450,210,64';
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
	public function ajaxAddPicture() {
		header("Content-Type:text/xml; charset=utf-8");
		$result = array();
		$result['status'] =  '<status><status_code>1</status_code><photo_url>http://media.thingd.com/default/215370781603928191_3f1a851be5e2.jpg</photo_url><thing_url>/things/215370781603928191/%E5%9B%BE%E4%B8%BD---%E7%BE%8E%E5%A5%B3%E5%9B%BE%E7%89%87</thing_url><thing_id>215370781603928191</thing_id><user_id>3497569</user_id><width>196</width><height>235</height></status>';
        echo(xml_encode($result, 'utf-8'));
	}
}