<?php
namespace app\model;

use think\Model;

class Application extends Model
{
    protected $pk = 'applyid';

    public function pass($pk){
        $this->where([
            "applyid" => $pk,
        ])->update([
            'status' => 'pass'
        ]);
    }

    public function fail($pk){
        $this->where([
            "applyid" => $pk,
        ])->update([
            'status' => 'fail'
        ]);
    }

    public function getmyapplication($username){
        $user = new User();
        $pk = $user->where('username','=',$username)->find();

        return $this->where('userid','=',$pk['uid'])->order('start_date','desc')->select();
    }

    public function addapplication($userid,$carid,$start_date,$end_date,$remark){
        $data = [
            'userid' => $userid,
            'carid' => $carid,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'remark' => $remark
        ];
        $this->insert($data);
    }
}