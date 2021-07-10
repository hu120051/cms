<?php
namespace app\model;

use think\Model;

class StockOutQuantity extends Model
{

    public function addstockoutquantity($StockOutID, $MaterialID, $Qty){
        $data = [
            'StockOutID' => $StockOutID,
            'MaterialID' => $MaterialID,
            'Qty' => $Qty,
        ];
        $this->insert($data);
        return true;
    }
}