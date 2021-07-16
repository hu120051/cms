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
            ->alias('i')
            ->join(['material'=>'m'],'i.MaterialID=m.MaterialID')
            ->where([
                'i.ProductID' => $ProductID
            ])
            ->field('i.MaterialID,i.BOM,m.MaterialName')
            ->select()->toArray();
//        dump($temp[0]['BOM']*2);

        foreach ($temp as $key => $value){
            $temp[$key]['BOM'] = $value['BOM']*2;
        }
        dump($temp);

    }

    public function getproduct(){
        $data = Db::table('Appraisal')->where('AppraisalID', '=', '21-06/03')->field('ProductID')->find();
        dump( $data['ProductID']);
    }

    public function changekey(){
        $data = Db::table('sale')
            ->alias('s')
            ->join(['appraisal'=>'a'],'s.AppraisalID=a.AppraisalID')
            ->join(['product'=>'p'], 'a.ProductID=p.ProductID')
            ->order('s.SaleID','desc')
            ->field('s.SaleID,s.AppraisalID,a.ProductID,p.ProductName,a.ClientName,s.Quantity,s.Date')
            ->select()->toArray();
        $tags = array_map(function($data) {
            return array(
                'label' => $data['SaleID'],
                'value' => $data['AppraisalID'],
                'test' => $data['ClientName']
            );
        }, $data);
        dump($tags);
    }

    public function getmateriallog(){
        $MaterialID = '58010001';
        $in = Db::table('stock_in')
            ->where('MaterialID','=',$MaterialID)
            ->field('Date,Quantity,Symbol')
            ->select()->toArray();

        //格式化
        $tags = array_map(function($in) {
            return array(
                'Date' => $in['Date'],
                'Qty' => $in['Quantity'],
                'Symbol' => $in['Symbol']
            );
        }, $in);
        $in = $tags;
        $out = Db::table('stock_out_quantity')
            ->alias('soq')
            ->where('soq.MaterialID','=','58010001')
            ->join(['stock_out'=>'so'],'soq.StockOutID = so.StockOutID')
            ->field('so.Date,soq.Qty,so.Symbol')
            ->select()->toArray();
        $in = array_merge($in,$out);
        //升序排列，按照“juli”字段排列
        $juli_sort = array();
        foreach ($in as $arr2) {
            $juli_sort[] = $arr2['Date'];
}
        array_multisort($juli_sort, SORT_DESC, $in);
        dump($in);


    }

    public function checkout(){
        $out = Db::table('stock_out_quantity')
            ->alias('soq')
            ->where('soq.MaterialID','=','58010001')
            ->join(['stock_out'=>'so'],'soq.StockOutID = so.StockOutID')
            ->field('so.Date,soq.Qty,so.Symbol')
            ->select()->toArray();

        dump($out);
    }
}