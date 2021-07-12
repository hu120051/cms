<?php
namespace app\model;

use think\Model;

class Client extends Model
{
    protected $pk = 'ClientID';

    public function getallclient(){
        $data = $this->order('ClientID', 'asc')->select();
        return $data;
    }

    public function changename($ClientID,$ClientName){
        $this->where('ClientID','=',$ClientID)->update([
            'ClientName' => $ClientName,
        ]);
    }

    public function addclient($ClientID,$ClientName){
        $data = [
            'ClientID' => $ClientID,
            'ClientName' => $ClientName,
        ];
        $this->insert($data);
    }
}