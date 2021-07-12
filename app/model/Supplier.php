<?php
namespace app\model;

use think\Model;

class Supplier extends Model
{
    protected $pk = 'SupplierID';

    public function getallsupplier(){
        $data = $this->order('SupplierID', 'asc')->select();
        return $data;
    }

    public function changename($SupplierID,$SupplierName){
        $this->where('SupplierID','=',$SupplierID)->update([
            'SupplierName' => $SupplierName,
        ]);
    }

    public function addsupplier($SupplierID,$SupplierName){
        $data = [
            'SupplierID' => $SupplierID,
            'SupplierName' => $SupplierName,
        ];
        $this->insert($data);
    }
}