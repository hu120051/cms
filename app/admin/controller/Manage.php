<?php
namespace app\admin\controller;


use app\admin\BaseController;
use app\model\Appraisal;
use app\model\Ingredient;
use app\model\Product;
use app\model\StockIn;
use app\model\StockOut;
use app\model\StockOutQuantity;
use think\facade\Db;
use think\facade\View;
use think\Model;
use think\response\Json;

//前端通过axios_post传一个json对象到后端，后端用input函数接收，并不是接收前端input标签中的信息！


class Manage extends BaseController
{
    /**
     * 获取物料清单
     *
     * @return \json
     */
    public function getallmaterial(){
        $material = new \app\model\Material();
        $data = $material->getallmaterial();
        return jok('',$data);
    }

    /**
     * 添加物料
     *
     * @return \json
     */
    public function addmaterial()
    {
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $MaterialName = $params['MaterialName'];
        $Unit = $params['Unit'];
        $Univalence = $params['Univalence'];
        $material = new \app\model\Material();
        $result = $material->addmaterial($MaterialID, $MaterialName, $Unit, $Univalence);
        if ($result) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }

    /**
     * 获取入库记录
     *
     * @return \json
     */
    public function getallpurchase(){
        $data = Db::table('stock_in')
            ->alias('p')
            ->join(['supplier'=>'s'],'p.SupplierID=s.SupplierID')
            ->join(['material'=>'m'],'p.MaterialID=m.MaterialID')
            ->order('p.PurchaseID','desc')
            ->field('p.PurchaseID,p.SupplierID,s.SupplierName,p.MaterialID,m.MaterialName,p.Date,p.Quantity,p.Amount')
            ->select();
        return jok('',$data);

    }

    /**
     * 添加入库记录
     *
     * @return \json
     */
    public function addpurchase()
    {
        $params = json_decode(file_get_contents("php://input"), true);
        $PurchaseID = $params['PurchaseID'];
        $SupplierID = $params['SupplierID'];
        $MaterialID = $params['MaterialID'];
        $Date = $params['Date'];
        $Quantity = $params['Quantity'];
        $Amount = $params['Amount'];
        $material = new \app\model\Material();
        $purchase = new StockIn();
        $result1 = $material->addmaterialstock($MaterialID, $Quantity);
        $result2 = $purchase->addpurchase($PurchaseID, $SupplierID, $MaterialID, $Date, $Quantity, $Amount);
        if ($result1&&$result2) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }

    /**
     * 获取评审表
     *
     * @return \json
     */
    public function getallappraisal(){
        $data = Db::table('appraisal')
            ->alias('a')
            ->join(['product'=>'p'],'a.ProductID=p.ProductID')
            ->join(['Client'=>'c'],'a.ClientID=c.ClientID')
            ->order('a.AppraisalID','desc')
            ->field('a.AppraisalID,a.ClientID,c.ClientName,a.ProductID,p.ProductName,a.Quantity,a.Left_Quantity,a.Date')
            ->select();
        return jok('',$data);

    }

    /**
     * 添加评审表
     *
     * @return \json
     */
    public function addappraisal(){
        $params = json_decode(file_get_contents("php://input"), true);
        $AppraisalID = $params['AppraisalID'];
        $ProductID = $params['ProductID'];
        $ClientID = $params['ClientID'];
        $Date = $params['Date'];
        $Quantity = $params['Quantity'];
        $appraisal = new Appraisal();
        $result = $appraisal->addappraisal($AppraisalID,$ProductID,$ClientID,$Date,$Quantity);
        if ($result) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }

    /**
     * 获取出库记录
     *
     * @return \json
     */
    public function getallstockout(){
        $data = Db::table('stock_out')
            ->alias('so')
            ->join(['appraisal'=>'a'],'so.AppraisalID=a.AppraisalID')
            ->join(['stock_out_quantity'=>'q'],'so.StockOutID=q.StockOutID')
            ->join(['material'=>'m'],'q.MaterialID=m.materialID')
            ->order('so.Datetime','desc')
            ->field('so.StockOutID,so.AppraisalID,a.ProductID,a.Quantity,q.MaterialID,q.Qty,m.MaterialName,so.Datetime')
            ->select();
        return jok('',$data);
    }

    /**
     * 设置cookie
     *
     * @return \json
     */

//        $data = Db::table('appraisal')
//            ->where([
//                'AppraisalID' => $AppraisalID
//            ])
//            ->field('ProductID,Left_Quantity')
//            ->select()->toArray();
//        $data = $data[0];
//        $ProductID = $data['ProductID'];
//        $LeftQuantity = $data['Left_Quantity'];
//        $temp = Db::table('ingredient')
//            ->where([
//                'ProductID' => $ProductID
//            ])
//            ->field('MaterialID,BOM')
//            ->select()->toArray();
//        foreach ($temp as $key => $value){
//            $temp[$key]['BOM'] = $value['BOM']*$LeftQuantity;
//        }
    public function setcookie()
    {
        $params = json_decode(file_get_contents("php://input"), true);
        $StockOutID = $params['StockOutID'];
        $AppraisalID = $params['AppraisalID'];
        $Date = $params['Date'];
        setCookie('StockOutID',$StockOutID, time() + 3600, '/');
        setCookie('AppraisalID',$AppraisalID, time() + 3600, '/');
        setCookie('Date',$Date, time() + 3600, '/');
        return jok("正在跳转中");
    }

    /**
     * 确定物料数量
     *
     * @return \json
     */

    public function confirmmaterial(){
        $StockOutID = cookie('StockOutID');
        $AppraisalID = cookie('AppraisalID');
        $data = Db::table('appraisal')
            ->where([
                'AppraisalID' => $AppraisalID
            ])
            ->field('ProductID,Left_Quantity')
            ->select()->toArray();
        $data = $data[0];
        $ProductID = $data['ProductID'];
        $LeftQuantity = $data['Left_Quantity'];
        setCookie('LeftQuantity',$LeftQuantity, time() + 3600, '/');
        $temp = Db::table('ingredient')
            ->alias('i')
            ->join(['material'=>'m'],'i.MaterialID=m.MaterialID')
            ->where([
                'i.ProductID' => $ProductID
            ])
            ->field('i.MaterialID,i.BOM,m.MaterialName')
            ->select()->toArray();
        foreach ($temp as $key => $value){
            $temp[$key]['BOM'] = round($value['BOM']*$LeftQuantity,4);
//            $temp[$key]['BOM'] = $temp[$key]['BOM'].toFixed(4);
        }
        return jok("", $temp);

    }

    /**
     * 确定物料数量
     *
     * @return \json
     */
    public function addbring(){
        $StockOutID = cookie('StockOutID');
        $AppraisalID = cookie('AppraisalID');
        $Date = cookie('Date');
        $LeftQuantity = cookie('LeftQuantity');
        $params = json_decode(file_get_contents("php://input"), true);
        $material = new \app\model\Material();
        $stockqty = new StockOutQuantity();
        $stockout = new StockOut();
        $stockout->addstockout($StockOutID, $AppraisalID, $Date);
        foreach($params as $key=>$value){
//          return jok('',$value['MaterialID']);
            $material->use($value['MaterialID'],$value['input']);
            $stockqty->addstockoutquantity($StockOutID, $value['MaterialID'], $value['input']);
        }

        setCookie('StockOutID',null, time() + 3600, '/');
        setCookie('AppraisalID',null, time() + 3600, '/');
        setCookie('Date',null, time() + 3600, '/');
        setCookie('LeftQuantity',null, time() + 3600, '/');
        return jok();
    }

    /**
     * 获取产品清单
     *
     * @return \json
     */
    public function getallproduct(){
        $product = new Product();
        $data = $product->getallproduct();
        return jok('',$data);
    }

    /**
     * 添加产品
     *
     * @return \json
     */
    public function addproduct(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $ProductName = $params['ProductName'];
        $Unit = $params['Unit'];
        $product = new Product();
        $result = $product->addproduct($ProductID, $ProductName, $Unit);
        if($result){
            return jok('添加成功');
        }
        return jerr('未知错误，添加失败');
    }

    public function getproductingredient(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        setCookie('ProductID',$ProductID, time() + 3600, '/');
//        $ingredient = new Ingredient();
//        $data = $ingredient->getingredient($ProductID);
        $data = Db::table('ingredient')
            ->alias('i')
            ->join(['material'=>'m'],'i.MaterialID=m.MaterialID')
            ->where('ProductID','=',$ProductID)
            ->order('i.MaterialID','asc')
            ->field('i.MaterialID,i.ProductID,m.MaterialName,i.BOM')
            ->select();
        if($data!=null){
            return jok('success',$data);
        }
        else{
            return jerr('请检查输入');
        }

    }

    public function changeingredient(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $MaterialID = $params['MaterialID'];
        $BOM = $params['BOM'];
        $ingredient = new Ingredient();
        $result = $ingredient->changeingredient($ProductID,$MaterialID,$BOM);
        if($result){
            return jok();
        }
        else{
            return jerr('未知错误，修改失败');
        }
    }
}