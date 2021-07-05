<?php
namespace app\admin\controller;


use app\admin\BaseController;
use think\facade\Session;
use think\facade\View;


//前端通过axios_post传一个json对象到后端，后端用input函数接收，并不是接收前端input标签中的信息！


class Manage extends BaseController
{
    public function getallmaterial(){
        $material = new \app\model\Material();
        $data = $material->getallmaterial();
        return jok('',$data);
    }

}