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
}