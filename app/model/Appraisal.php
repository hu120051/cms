<?php
namespace app\model;

use think\Model;

class Appraisal extends Model
{
    protected $pk = 'AppraisalID';

    public function addappraisal($AppraisalID,$ProductID,$ClientName,$Date,$EndDate,$Quantity,$Remarks)
    {
        $data = [
            'AppraisalID' => $AppraisalID,
            'ProductID' => $ProductID,
            'ClientName' => $ClientName,
            'Date' => $Date,
            'EndDate' => $EndDate,
            'Quantity' => $Quantity,
            'Left_Quantity' => $Quantity,
            'Remarks' => $Remarks,
        ];
        $this->insert($data);
        return true;
    }

    public function getproduct($AppraisalID){
        $data = $this->where('AppraisalID', '=', $AppraisalID)->field('ProductID')->find();
        return $data['ProductID'];
    }

    public function finishproduct($AppraisalID, $Quantity){
        $oldquantity = $this->where('AppraisalID', $AppraisalID)->value('Left_Quantity');
        $newquantity = $oldquantity - $Quantity;
        $this->where('AppraisalID', $AppraisalID)->update([
            'Left_Quantity' => $newquantity,
        ]);
    }
}