<?php
namespace app\model;

use think\Model;

class Appraisal extends Model
{
    protected $pk = 'AppraisalID';

    public function addappraisal($AppraisalID,$ProductID,$ClientID,$Date,$Quantity)
    {
        $data = [
            'AppraisalID' => $AppraisalID,
            'ProductID' => $ProductID,
            'ClientID' => $ClientID,
            'Date' => $Date,
            'Quantity' => $Quantity,
            'Left_Quantity' => $Quantity
        ];
        $this->insert($data);
        return true;
    }
}