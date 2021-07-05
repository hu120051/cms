<?php
namespace app\admin\controller;


use app\admin\BaseController;
use think\facade\Session;
use think\facade\View;


//前端通过axios_post传一个json对象到后端，后端用input函数接收，并不是接收前端input标签中的信息！


class User extends BaseController
{
    public function login()
    {

        //       if($uid == null || $uid == "" || $uid == "null"){
//            return $uid;
//            return View::fetch('login');
        //       }

        if (!input("password"))
        {
            return jerr('请填写口令', 400);
        }
// 另一种接收方式
//        $params=json_decode(file_get_contents("php://input"),true);
//        $username=$params['user_account'];
//        return jerr($username);
        $password = input("password");
        $user = new \app\model\Password;
        $temp = $user->login($password);

        if($temp){
            setCookie('access', 'pass', time() + 3600, '/');
            return jok("验证通过");
        }
        else{
            return jerr("口令错误",400);
        }
    }

    public function changepswd()
    {
        $oldpswd = input("oldPassword");
        $newpswd = input("newPassword");
        $user = new \app\model\User();
        $temp = $user->changepswd(cookie('username'),$oldpswd,$newpswd);
        if($temp)
        {
            setCookie('username',null, time() + 3600, '/');
            return jok('修改成功',$temp);
        }
        else
        {
            return jerr('修改失败！',400);
        }
    }

    public function logout()
    {
        setCookie('access',null, time() + 3600, '/');
        return jok('退出成功');
    }

    public function getmyvalue(){
        $user = new \app\model\User();
        $data = $user->getmyvalue(cookie('username'));
        return jok('',$data);
    }

    public function getalluser(){
        $user = new \app\model\User();
        $data = $user->getalluser();
        return jok('',$data);

    }


    public function getdata(){
        $pk = input("pk");
        $user = new \app\model\User();
        $data = $user->getmyvaluebypk($pk);
        return jok('',$data);
    }


    /**
     * 添加用户
     *
     * @return \json
     */
    public function adduser(){
        $params=json_decode(file_get_contents("php://input"),true);
        $name = $params['name'];
        $username = $params['username'];
        $password = md5($params['uncodepassword']);
        $group = $params['group'];
        $user = new \app\model\User();
        $result = $user->adduser($name,$username,$password,$group);
        if($result){
            return jok('添加成功！');
        }
        return  jerr('添加失败！');
    }

    /**
     * 删除用户
     *
     * @return \json
     */
    public function deleteuser(){
        $params=json_decode(file_get_contents("php://input"),true);
        $pk = input('pk');
        $user = new \app\model\User();
        $test = $user->getmyvaluebypk($pk);
        if($test['group']=='superadmin'){
            return jerr('超级管理员无法删除！',400);
        }
        $reslut = $data = $user->deleteuserbypk($pk);
        if($reslut){
            return jok('删除成功!');
        }
        return jerr('未知错误，删除失败！','400');
    }

    /**
     * 更新用户信息
     *
     * @return \json
     */
    public function updateuser(){
        $params=json_decode(file_get_contents("php://input"),true);
        $uid = $params['uid'];
        $name = $params['name'];
        $group = $params['group'];
        $user = new \app\model\User();
        $user->updateuser($uid,$name,$group);
        return jok('修改成功！');
    }
}