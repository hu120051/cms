<?php
namespace app\model;

use think\Model;

class Material extends Model
{
    protected $pk = 'MaterialID';

    public function getallmaterial()
    {
        return $this->order('MaterialID','asc')->select();
    }

    public function getmaterial($MaterialID)
    {
        return $this->where('MaterialID','=',$MaterialID)->select()->toArray();
    }

    public function addmaterial($MaterialID, $MaterialName, $Unit, $Univalence){
        $data = [
            'MaterialID' => $MaterialID,
            'MaterialName' => $MaterialName,
            'Unit' => $Unit,
            'Univalence' => $Univalence,
        ];
        $this->insert($data);
        return true;
    }

    public function deletematerial($MaterialID){
        $this->where('MaterialID', '=', $MaterialID)->delete();
    }

    public function updatematerial($MaterialID,$MaterialName,$Unit,$Univalence){
        $this->where('MaterialID','=',$MaterialID)->update([
            'MaterialName' => $MaterialName,
            'Unit' => $Unit,
            'Univalence' => $Univalence
        ]);
    }

    public function addmaterialstock($MaterialID, $change){
        $oldstock = $this->where('MaterialID', $MaterialID)->value('Stock');
        $newstock = $oldstock + $change;
        $this->where('MaterialID', $MaterialID)->update([
            'Stock' => $newstock
        ]);
        return true;
    }

    public function  use($MaterialID,$change){
        $oldstock = $this->where('MaterialID', $MaterialID)->value('Stock');
        $oldusing = $this->where('MaterialID', $MaterialID)->value('Using');
        $newstock = $oldstock - $change;
        $newusing = $oldusing + $change;
        $this->where('MaterialID', $MaterialID)->update([
            'Stock' => $newstock,
            'Using' => $newusing
        ]);
    }

    public function finshproduct($MaterialID, $change){
        $oldusing = $this->where('MaterialID', $MaterialID)->value('Using');
        $newusing = $oldusing - $change;
        $this->where('MaterialID', $MaterialID)->update([
            'Using' => $newusing
        ]);
    }
}