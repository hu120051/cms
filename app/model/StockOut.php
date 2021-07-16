<?php
namespace app\model;

use think\Model;

class StockOut extends Model
{
    protected $pk = 'StockOutID';

    public function addstockout($StockOutID, $AppraisalID, $Date){
        $data = [
            'StockOutID' => $StockOutID,
            'AppraisalID' => $AppraisalID,
            'Date' => $Date,
        ];
        $this->insert($data);
        return true;
    }
}