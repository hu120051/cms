<?php
namespace app\model;

use think\Model;

class Product extends Model
{
    protected $pk = 'ProductID';

    public function getallproduct()
    {
        return $this->order('ProductID','asc')->select();
    }

    public function addproduct($ProductID,$ProductClientID, $ProductName,$Type, $Price,$ClientName01,$ClientName02)
    {
        $data = [
            'ProductID' => $ProductID,
            'ProductClientID' => $ProductClientID,
            'ProductName' => $ProductName,
            'Type' => $Type,
            'Price' => $Price,
            'ClientName01' => $ClientName01,
            'ClientName02' => $ClientName02,
        ];
        $this->insert($data);
        return true;
    }

    public function getproductidbyout($ProductID){
        return $this->where('ProductClientID','=',$ProductID)->value('ProductID');
    }

    public function productin($ProductID, $Quantity){
        $oldquantity = $this->where('ProductID', $ProductID)->value('Stock');
        $newquantity = $oldquantity + $Quantity;
        $this->where('ProductID', '=', $ProductID)->update([
            'Stock' => $newquantity,
        ]);
    }

    public function productout($ProductID, $Quantity){
        $oldquantity = $this->where('ProductID', $ProductID)->value('Stock');
        $newquantity = $oldquantity - $Quantity;
        $this->where('ProductID', '=', $ProductID)->update([
            'Stock' => $newquantity,
        ]);
    }

    public function changeproduct($ProductID,$ProductClientID, $ProductName,$Type, $Price,$ClientName01,$ClientName02){
        $this->where('ProductID','=',$ProductID)->update([
            'ProductClientID' => $ProductClientID,
            'ProductName' => $ProductName,
            'Type' => $Type,
            'Price' => $Price,
            'ClientName01' => $ClientName01,
            'ClientName02' => $ClientName02,
        ]);
        return true;
    }
}