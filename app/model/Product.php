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

    public function addproduct($ProductID, $ProductName, $Unit)
    {
        $data = [
            'ProductID' => $ProductID,
            'ProductName' => $ProductName,
            'Unit' => $Unit,
        ];
        $this->insert($data);
        return true;
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
}