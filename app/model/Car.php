<?php
namespace app\model;

use think\Model;

class Car extends Model
{
    protected $pk = 'cid';

    public function getallcar(){
        return $this->order('cid','asc')->select();
    }

    public function getallfreecar(){
        return $this->where('userid','=',null)->order('cid','asc')->select();
    }

    public function addcar($license,$brand,$price,$bought_time,$type){
        $data = [
            'license' => $license,
            'brand' => $brand,
            'price' => $price,
            'bought_time' => $bought_time,
            'type' => $type
        ];
        $this->insert($data);
        return true;
    }

    /**
     * @param $pk
     *
     * @return array
     */
    public function getmyvaluebypk($pk){
        return $this->find($pk)->toArray();
    }

    public function deletecarbypk($cid){
        $this->where('cid',$cid)->delete();
        return true;
    }

    public function stop($cid){
        $this->where('cid',$cid)->update(['userid'=>null,'status'=>'free']);
        return true;
    }
}