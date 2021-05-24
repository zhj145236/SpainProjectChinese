<?php

namespace app\h5api\controller;
use think;
use app\BaseController;

class AppNotice extends BaseController {

	/**
	 * 获取h5端商城公告
	 */
	public function getlist()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
	    $article_model = model('article');
	    $condition[]=array('ac_id','=',1);
	    $condition[] = array('article_show','=',1);
	    $article_list = $article_model->getArticleList($condition, '', 'article_sort asc,article_time desc');
	    $json_data = json_encode($article_list, true);
	    exit($json_data);
	}

	/**
	 * 获取h5端商城公告详情
	 */
	public function getdetail()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
		$id = input('get.article_id');
	    $article_model = model('article');
	    $condition[]=array('article_id','=',$id);
	    $article_list = $article_model->getOneArticle($condition);
	    if(!empty($article_list)){
	    	$article_list['article_time'] = date('Y-m-d H:i:s',$article_list['article_time']);
	    }
	    $json_data = json_encode($article_list, true);
	    exit($json_data);
	}

	/**
	 * h5端--通知列表
	 */
	public function getNoticeList()
	{
		header('Content-Type: text/html;charset=utf-8');
		header('Access-Control-Allow-Origin:https://m.domibuy.com');
		header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE');
		header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin');
        $pagesize = max(1, intval(input('get.page')));
		$result['state'] = 0;
        $result['msg'] = '';
        $result['notice_list'] = array();

        $article_model = model('article');
	    $condition[]=array('ac_id','=',1);
	    $condition[] = array('article_show','=',1);
	    $notice_list = $article_model->getMobileArticleList($condition, 'article_id,article_title,article_pic,article_time', $pagesize, 20, 'article_time desc');
	    foreach ($notice_list as &$value) {
	    	$value['create_time'] = date('Y-m-d H:i',$value['article_time']);
	    	if(!empty($value['article_pic'])){
	    		$value['article_pic'] = ds_get_pic(ATTACH_ARTICLE,$value['article_pic']);
	    	}
	    }
	    unset($value);

        $result['state'] = 1;
        $result['page'] = $pagesize;
        $result['pagesize'] = 20;
        $result['notice_list'] = $notice_list;
	    
	    $json_data = json_encode($result, true);
	    exit($json_data);
	}

}


