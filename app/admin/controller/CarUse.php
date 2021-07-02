<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\Db;

class CarUse extends BaseController
{
    public function getalllog(){
        $data = Db::table('cm_car_use')
            ->alias('cu')
            ->join(['cm_car'=>'c'],'cu.carid=c.cid')
            ->join(['cm_user'=>'u'],'cu.userid=u.uid')
            ->field('cu.logid,cu.carid,c.license,cu.userid,u.name,cu.start_date,cu.end_date')
            ->order('cu.logid','asc')
            ->select();
        return jok('',$data);
    }
}