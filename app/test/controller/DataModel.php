<?php


namespace app\test\controller;


use app\model\Material;

use think\facade\Db;


class DataModel
{
    public function index()
    {
//        $user = User::select();
//        dump($user);
//        return json($user);
        $material = new Material();
        ;
        dump($material->addmaterialstock('200002', '20'));

    }
    public function choosematerial(){
        $StockOutID = '132544';
        $AppraisalID = '21-06/03';
        $data = Db::table('appraisal')
            ->where([
                'AppraisalID' => $AppraisalID
            ])
            ->field('ProductID,Left_Quantity')
            ->select();
        $data = $data[0];
        $ProductID = $data['ProductID'];
        $LeftQuantity = $data['Left_Quantity'];
        $temp = Db::table('ingredient')
            ->where([
                'ProductID' => $ProductID
            ])
            ->field('MaterialID,BOM')
            ->select()->toArray();
//        dump($temp[0]['BOM']*2);

        foreach ($temp as $key => $value){
            $temp[$key]['BOM'] = $value['BOM']*2;
        }
        dump($temp);

    }

}