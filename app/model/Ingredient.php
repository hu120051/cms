<?php
namespace app\model;

use think\Db;
use think\Model;

class Ingredient extends Model
{

    public function getingredient($ProductID)
    {
        $data = $this->where('ProductID','=',$ProductID)->order('MaterialID','asc')->select();
        return $data;
    }

    public function changeingredient($ProductID,$MaterialID,$BOM){
        if($BOM=='0'){
            $this->where([
                'ProductID' => $ProductID,
                'MaterialID' => $MaterialID,
            ])->delete();
        }
        else{
            $this->where([
                'ProductID' => $ProductID,
                'MaterialID' => $MaterialID,
            ])->update([
                'BOM' => $BOM
            ]);
        }
        return true;
    }

    public function addingredient($ProductID,$MaterialID,$BOM){
        $data = [
            'ProductID' => $ProductID,
            'MaterialID' => $MaterialID,
            'BOM' => $BOM
        ];
        $this->insert($data);
        return true;
    }
}