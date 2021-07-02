<?php
namespace app\model;

use think\Model;

class Location extends Model
{
    protected $pk = 'lid';
    public function addlocation($userid,$carid,$lng,$lat){
        $car = new Car();
        $car->where('cid','=',$carid)->update(['userid'=>$userid,'status'=>'using']);
        $data = [
            'userid' => $userid,
            'carid' => $carid,
            'lng' => $lng,
            'lat' => $lat,
        ];
        $this->insert($data);
    }
}