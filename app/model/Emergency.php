<?php
namespace app\model;

use think\Model;

class Emergency extends Model
{
    protected $pk = 'mid';

    public function addemergency($userid,$carid,$remark,$lng,$lat){
        $data = [
            'userid' => $userid,
            'carid' => $carid,
            'lng' => $lng,
            'lat' => $lat,
            'remark' => $remark
        ];
        $this->insert($data);
    }
}