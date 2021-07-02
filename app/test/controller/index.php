<?php


namespace app\test\controller;


use think\facade\Db;

class index
{
    public function index(){
        return 'index';
    }
    public function getlocation(){
        $subQuery = Db::table('cm_location')
            ->alias('l')
            ->join(['cm_car'=>'c'],'l.carid=c.cid')
            ->join(['cm_user'=>'u'],'l.userid=u.uid')
            ->where('c.userid','<>','null')
            ->field('l.lid,c.license,c.type,u.uid,u.name,l.lng,l.lat,l.time')
            ->order('l.lid','desc')
            ->limit(1000)
            ->buildSql();
        $data = Db::table($subQuery . ' tmp')
            ->field('lid,license,type,uid,name,lng,lat,time')
            ->group('uid')
            ->select();
        return jok('',$data);
    }
}