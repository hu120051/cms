<?php
namespace app\model;

use think\Model;

class StockIn extends Model
{
    protected $pk = 'PurchaseID';

    public function addpurchase($PurchaseID, $SupplierName, $MaterialID, $Date, $Quantity, $Amount){
        $data = [
            'PurchaseID' => $PurchaseID,
            'SupplierName' => $SupplierName,
            'MaterialID' => $MaterialID,
            'Date' => $Date,
            'Quantity' => $Quantity,
            'Amount' => $Amount,
        ];
        $this->insert($data);
        return true;
    }
}