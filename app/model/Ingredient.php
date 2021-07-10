<?php
namespace app\model;

use think\Model;

class Ingredient extends Model
{

    public function getingredient($ProductID)
    {
        $data = $this->where('ProductID','=',$ProductID)->order('MaterialID','asc')->select();
        return $data;
    }

    public function changeingredient($ProductID,$MaterialID,$BOM){
        $this->where([
            'ProductID' => $ProductID,
            'MaterialID' => $MaterialID,
        ])->update([
            'BOM' => $BOM
        ]);
        return true;
    }
}