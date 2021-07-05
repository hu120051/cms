<?php
namespace app\model;

use think\Model;

class StockIn extends Model
{
    protected $pk = 'PurchaseID';

    public function addpurchase($PurchaseID, $SupplierID, $MaterialID, $Date, $Quantity, $Amount){
        $data = [
            'PurchaseID' => $PurchaseID,
            'SupplierID' => $SupplierID,
            'MaterialID' => $MaterialID,
            'Date' => $Date,
            'Quantity' => $Quantity,
            'Amount' => $Amount,
        ];
        $this->insert($data);
        return true;
    }
}