<?php
namespace app\model;

use think\Model;

class Material extends Model
{
    protected $pk = 'MaterialID';

    public function getallmaterial()
    {
        return $this->order('MaterialID','asc')->select();
    }

    public function addmaterial($MaterialID, $MaterialName, $Unit, $Univalence){
        $data = [
            'MaterialID' => $MaterialID,
            'MaterialName' => $MaterialName,
            'Unit' => $Unit,
            'Univalence' => $Univalence,
        ];
        $this->insert($data);
        return true;
    }
}