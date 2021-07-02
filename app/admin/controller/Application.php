<?php
namespace app\admin\controller;

use app\admin\BaseController;
use think\facade\Db;

class Application extends BaseController
{
    public function getallapplication(){
        $data = Db::table('cm_application')
            ->alias('a')
            ->join(['cm_car'=>'c'],'a.carid=c.cid')
            ->join(['cm_user'=>'u'],'a.userid=u.uid')
            ->field('a.applyid,a.userid, u.name,a.carid,c.type,c.license,a.apply_time,a.start_date,a.end_date,a.status,a.remark')
            ->order('apply_time','desc')
            ->select();
        return jok('',$data);
    }

    public function pass($pk){
        $apply = new \app\model\Application();
        $apply->pass($pk);
        $cu = new \app\model\CarUse();
        $params=json_decode(file_get_contents("php://input"),true);
        $userid = $params['userid'];
        $carid = $params['carid'];
        $start_date = $params['start_date'];
        $end_date = $params['end_date'];
        $data = [
            'userid' => $userid,
            'carid' => $carid,
            'start_date' => $start_date,
            'end_date' => $end_date,
        ];
        $cu->insert($data);
        return jok('修改成功');
    }

    public function fail($pk){
        $apply = new \app\model\Application();
        $apply->fail($pk);
        $cu = new \app\model\CarUse();
        $params=json_decode(file_get_contents("php://input"),true);
        $userid = $params['userid'];
        $carid = $params['carid'];
        $start_date = $params['start_date'];
        $end_date = $params['end_date'];
        $cu->where('userid',$userid)
            ->where('carid',$carid)
            ->where('start_date',$start_date)
            ->where('end_date',$end_date)
            ->delete();
        return jok('修改成功');
    }
}