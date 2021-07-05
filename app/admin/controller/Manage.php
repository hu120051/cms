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

    /**
     * 添加用户
     *
     * @return \json
     */
    public function addmaterial()
    {
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $MaterialName = $params['MaterialName'];
        $Unit = $params['Unit'];
        $Univalence = $params['Univalence'];
        $material = new \app\model\Material();
        $result = $material->addmaterial($MaterialID, $MaterialName, $Unit, $Univalence);
        if ($result) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }

}