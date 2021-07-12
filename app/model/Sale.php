<?php
namespace app\model;

use think\Model;

class Sale extends Model
{
    protected $pk = 'SaleID';

    public function addnewsale($SaleID, $AppraisalID, $ProductID, $Quantity, $Date){
        $data = [
            'SaleID' => $SaleID,
            'AppraisalID' => $AppraisalID,
            'ProductID' => $ProductID,
            'Quantity' => $Quantity,
            'Date' => $Date,
        ];
        $this->insert($data);
    }
}