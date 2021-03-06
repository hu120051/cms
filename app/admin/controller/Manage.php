<?php
namespace app\admin\controller;


use app\admin\BaseController;
use app\model\Appraisal;
use app\model\Client;
use app\model\Ingredient;
use app\model\Material;
use app\model\Product;
use app\model\ProductIn;
use app\model\Sale;
use app\model\StockIn;
use app\model\StockOut;
use app\model\StockOutQuantity;
use app\model\Supplier;
use think\facade\Db;

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
        $material = new Material();
        $result = $material->addmaterial($MaterialID, $MaterialName, $Unit, $Univalence);
        if ($result) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }


    /**
     * 获取物料信息
     *
     * @return \json
     */
    public function getmaterialdata(){
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $material = new Material();
        $data = $material->getmaterial($MaterialID);

        return jok('',$data);
    }

    /**
     * 更新物料信息
     *
     *
     */
    public function updatematerial(){
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $MaterialName = $params['MaterialName'];
        $Unit = $params['Unit'];
        $Univalence = $params['Univalence'];
        $material = new Material();
        $material->updatematerial($MaterialID,$MaterialName,$Unit,$Univalence);

        return jok('修改成功');
    }

    /**
     * 删除物料
     *
     * @return \json
     */
    public function deletematerial(){
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $material = new Material();
        $material->deletematerial($MaterialID);

        return jok('删除成功');
    }

    /**
     * 获取物料出入库记录
     *
     * @return \json
     */
    public function getmateriallog(){
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        setCookie('MaterialID',$MaterialID, time() + 3600, '/');
        $MaterialName = Db::table('material')
            ->where('MaterialID','=',$MaterialID)->value('MaterialName');
        $MaterialName = urlencode($MaterialName);
        setCookie('MaterialName',$MaterialName, time() + 3600, '/');
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
            ->where('soq.MaterialID','=',$MaterialID)
            ->join(['stock_out'=>'so'],'soq.StockOutID = so.StockOutID')
            ->field('so.Date,soq.Qty,so.Symbol')
            ->select()->toArray();

        $result = array_merge($in,$out);
        //降序排列，按照“Date”字段排列
        $Date_sort = array();
        foreach ($result as $arr2) {
            $Date_sort[] = $arr2['Date'];
        }
        array_multisort($Date_sort, SORT_DESC, $result);

        return jok('',$result);

    }


    /**
     * 获取入库记录
     *
     * @return \json
     */
    public function getallpurchase(){
        $data = Db::table('stock_in')
            ->alias('p')
            ->join(['material'=>'m'],'p.MaterialID=m.MaterialID')
            ->order('p.PurchaseID','desc')
            ->field('p.PurchaseID,p.SupplierName,p.MaterialID,m.MaterialName,p.Date,p.Quantity,p.Amount')
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
        //todo: 自动生成可选供应商
        $params = json_decode(file_get_contents("php://input"), true);
        $PurchaseID = $params['PurchaseID'];
        $SupplierName = $params['SupplierName'];
        $MaterialID = $params['MaterialID'];
        $Quantity = $params['Quantity'];
        $Amount = $params['Amount'];
        $Date = $params['Date'];
        $material = new \app\model\Material();
        $purchase = new StockIn();
        $result1 = $material->addmaterialstock($MaterialID, $Quantity);
        $result2 = $purchase->addpurchase($PurchaseID, $SupplierName, $MaterialID, $Date, $Quantity, $Amount);
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
            ->order('a.AppraisalID','desc')
            ->field('a.AppraisalID,a.ClientName,a.ProductID,p.ProductName,a.Quantity,a.Left_Quantity,a.Date,a.EndDate,a.Remarks')
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
        $ClientName = $params['ClientName'];
        $Date = $params['Date'];
        $EndDate = $params['EndDate'];
        $Remarks = $params['Remarks'];
        $Quantity = $params['Quantity'];
        $appraisal = new Appraisal();
        if($params['Choose'] == true){
            $product = new Product();
            $temp = $product->getproductidbyout($ProductID);
            $ProductID = $temp;
        }
        $result = $appraisal->addappraisal($AppraisalID,$ProductID,$ClientName,$Date,$EndDate,$Quantity,$Remarks);
        if ($result) {
            return jok('添加成功！');
        }
        return jerr('添加失败！');
    }

    /**
     * 添加评审表
     *
     * @return \json
     */
    public function deleteappraisal(){
        $params = json_decode(file_get_contents("php://input"), true);
        $AppraisalID = $params['AppraisalID'];
        $appraisal = new Appraisal();
        $appraisal->where('AppraisalID','=',$AppraisalID)->delete();
        return jok('删除成功！');
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
            ->order('so.Date','desc')
            ->order('so.StockOutID','desc')
            ->field('so.StockOutID,so.AppraisalID,a.ProductID,a.Quantity,q.MaterialID,q.Qty,m.MaterialName,so.Date')
            ->select();
        return jok('',$data);
    }

    /**
     * 设置cookie
     *
     * @return \json
     */

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
     * 添加出库记录
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

        //先循环一轮检测是否有未填写
        foreach($params as $key=>$value){
//          return jok('',$value['MaterialID']);

            if(!array_key_exists('input', $value)){
                return jerr('请填写完整，未出库请置0！');
            }

        }

        $stockout->addstockout($StockOutID, $AppraisalID, $Date);
        foreach($params as $key=>$value){
//          return jok('',$value['MaterialID']);
            if($value['input'] != '0') {
                $material->use($value['MaterialID'], $value['input']);
                $stockqty->addstockoutquantity($StockOutID, $value['MaterialID'], $value['input']);
            }
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
        $ProductClientID = $params['ProductClientID'];
        $ProductName = $params['ProductName'];
        $Type = $params['Type'];
        $Price = $params['Price'];
        $ClientName01 = $params['ClientName01'];
        $ClientName02 = $params['ClientName02'];
        $product = new Product();
        $result = $product->addproduct($ProductID,$ProductClientID, $ProductName,$Type, $Price,$ClientName01,$ClientName02);
        if($result){
            return jok('添加成功');
        }
        return jerr('未知错误，添加失败');
    }

    /**
     * 删除产品
     *
     * @return \json
     */
    public function deleteproduct(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $product = new Product();
        $product->where('ProductID','=',$ProductID)->delete();
        return jok('删除成功');
    }

    /**
     * 修改产品信息
     *
     * @return \json
     */
    public function changeproduct(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $ProductName = $params['ProductName'];
        $ProductClientID = $params['ProductClientID'];
        $Type = $params['Type'];
        $Price = $params['Price'];
        $ClientName01 = $params['ClientName01'];
        $ClientName02 = $params['ClientName02'];
        $product = new Product();
        $result = $product->changeproduct($ProductID,$ProductClientID, $ProductName,$Type, $Price,$ClientName01,$ClientName02);
        if($result){
            return jok('添加成功');
        }
        return jerr('未知错误，添加失败');
    }


    /**
     * 获取产品信息
     *
     * @return \json
     */
    public function getproduct(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $product = new Product();
        $data = $product->where('ProductID','=',$ProductID)->select()->toArray();
        return jok('',$data[0]);
    }


    /**
     * 获取指定产品配料表
     *
     * @return \json
     */
    public function getproductingredient(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductID = $params['ProductID'];
        $product = new Product();
        $ProductName = $product->where('ProductID','=',$ProductID)->value('ProductName');
        setCookie('ProductID',$ProductID, time() + 3600, '/');
        $productcode = urlencode($ProductName);
        setCookie('ProductName',$productcode, time() + 3600, '/');
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

    /**
     * 修改配料表
     *
     * @return \json
     */
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

    /**
     * 添加新配料
     *
     * @return \json
     */
    public function addingredient(){
        $params = json_decode(file_get_contents("php://input"), true);
        $MaterialID = $params['MaterialID'];
        $BOM = $params['BOM'];
        $ProductID = cookie('ProductID');
        $ingredient = new Ingredient();
        $result = $ingredient->addingredient($ProductID,$MaterialID,$BOM);
        if($result){
            return jok();
        }
        else{
            return jerr();
        }
    }

    /**
     * 获取产品入库记录
     *
     * @return \json
     */
    public function getallproductin(){

        $data = Db::table('product_in')
            ->alias('pi')
            ->join(['product'=>'p'],'pi.ProductID=p.ProductID')
            ->order('pi.ProductInID','desc')
            ->field('pi.ProductInID,pi.ProductID,p.ProductName,pi.Quantity,pi.AppraisalID,pi.Date,p.Price')
            ->select();

        return jok('success',$data);

    }

    /**
     * 产品入库
     *
     * @return \json
     */
    public function addproductin(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ProductInID = $params['ProductInID'];
        $AppraisalID = $params['AppraisalID'];
        $Quantity = $params['Quantity'];
        $Date = $params['Date'];
        $appraisal = new Appraisal();
        //获取产品ID
        $ProductID = $appraisal->getproduct($AppraisalID);
        $ingredient = new Ingredient();
        $material = new Material();
        $productin = new ProductIn();
        $product = new Product();

        //获取该产品BOM表(Array)
        $BOM = $ingredient->getbom($ProductID);
        //根据BOM表确定减少在制仓材料数量
        foreach ($BOM as $key => $value) {
            $BOM[$key]['BOM'] = round($value['BOM']*$Quantity, 4);
            //更新材料数据库
            $material->finshproduct($value['MaterialID'], $BOM[$key]['BOM']);
        }

        //修改评审表中剩余需求量
        //改为售出后修改
//        $appraisal->finishproduct($AppraisalID,$Quantity);
        //修改产品库存
        $product->productin($ProductID, $Quantity);
        //生成新记录
        $productin->insert([
            'ProductInID' => $ProductInID,
            'ProductID' => $ProductID,
            'AppraisalID' => $AppraisalID,
            'Quantity' => $Quantity,
            'Date' => $Date,
        ]);
        return jok();
    }

    /**
     * 获取产品销售记录
     *
     * @return \json
     */
    public function getallsale(){
        $data = Db::table('sale')
            ->alias('s')
            ->join(['appraisal'=>'a'],'s.AppraisalID=a.AppraisalID')
            ->join(['product'=>'p'], 'a.ProductID=p.ProductID')
            ->order('s.SaleID','desc')
            ->field('s.SaleID,s.AppraisalID,a.ProductID,p.ProductName,p.Price,a.ClientName,s.Quantity,s.Date')
            ->select();

        return jok('success',$data);
    }

    /**
     * 添加销售记录
     *
     * @return \json
     */
    public function addsale(){
        $params = json_decode(file_get_contents("php://input"), true);
        $SaleID = $params['SaleID'];
        $AppraisalID = $params['AppraisalID'];
        $Quantity = $params['Quantity'];
        $Date = $params['Date'];

        $appraisal = new Appraisal();
        //获取产品ID
        $ProductID = $appraisal->getproduct($AppraisalID);

        //修改评审表中剩余需求量
        $appraisal->finishproduct($AppraisalID,$Quantity);

        //修改产品库存
        $product = new Product();
        $product->productout($ProductID, $Quantity);

        //生成记录
        $sale = new Sale();
        $sale->addnewsale($SaleID, $AppraisalID, $ProductID, $Quantity, $Date);
        return jok();
    }

    /**
     * 删除销售记录
     *
     * @return \json
     */
    public function deletesale(){
        $params = json_decode(file_get_contents("php://input"), true);
        $SaleID = $params['SaleID'];
        $AppraisalID = $params['AppraisalID'];
        $Quantity = $params['Quantity'];
        $ProductID = $params['ProductID'];


        $appraisal = new Appraisal();

        /*  修改评审表中剩余需求量  */
        $appraisal->backproduct($AppraisalID,$Quantity);

        /*  修改产品库存  */
        $product = new Product();
        $product->productin($ProductID, $Quantity);

        /*  删除记录  */
        $sale = new Sale();
        $sale->deletesale($SaleID);
        return jok();
    }

    /**
     * 获取全部供应商
     *
     * @return \json
     */
    public function getallsupplier(){
        $supplier = new Supplier();
        $data = $supplier->getallsupplier();
        return jok('',$data);
    }

    /**
     * 修改供应商信息
     *
     * @return \json
     */
    public function changesuppliername(){
        $params = json_decode(file_get_contents("php://input"), true);
        $SupplierID = $params['SupplierID'];
        $SupplierName = $params['SupplierName'];
        $supplier = new Supplier();
        $supplier->changename($SupplierID,$SupplierName);
        return jok();
    }

    /**
     * 添加新供应商
     *
     * @return \json
     */
    public function addsupplier(){
        $params = json_decode(file_get_contents("php://input"), true);
        $SupplierID = $params['SupplierID'];
        $SupplierName = $params['SupplierName'];
        $supplier = new Supplier();
        $supplier->addsupplier($SupplierID,$SupplierName);
        return jok();
    }

    /**
     * 获取全部客户
     *
     * @return \json
     */
    public function getallclient(){
        $client = new Client();
        $data = $client->getallclient();
        return jok('',$data);
    }

    /**
     * 修改客户信息
     *
     * @return \json
     */
    public function changeclientname(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ClientID = $params['ClientID'];
        $ClientName = $params['ClientName'];
        $client = new Client();
        $client->changename($ClientID,$ClientName);
        return jok();
    }

    /**
     * 添加新客户
     *
     * @return \json
     */
    public function addclient(){
        $params = json_decode(file_get_contents("php://input"), true);
        $ClientID = $params['ClientID'];
        $ClientName = $params['ClientName'];
        $client = new Client();
        $client->addclient($ClientID,$ClientName);
        return jok();
    }


}