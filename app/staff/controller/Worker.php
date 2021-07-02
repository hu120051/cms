<?php
namespace app\staff\controller;

use app\model\Application;
use app\model\Car;
use app\model\Emergency;
use app\model\Location;
use app\model\User;
use app\staff\BaseController;

class Worker extends BaseController
{
    public function login(){
        if (!input("username"))
        {
            return jerr('请确认帐号是否正确填写', 400);
        }
        if (!input("password"))
        {
            return jerr('请确认密码是否正确填写', 400);
        }
        $username = input("username");
        $password = input("password");
        $user = new User;
        $result = $user->login($username,$password);

        if($result)
        {
            setCookie('username', $username, time() + 3600, '/');
            return jok('登录成功',$result);

        }
        else
        {
            return jerr('用户名或密码错误',400);
        }
    }

    public function getmyapplication(){
        $username = cookie('username');
        $application = new Application();
        $data = $application->getmyapplication($username);
        return jok('',$data);
    }

    public function addapplication(){
        $params=json_decode(file_get_contents("php://input"),true);
        $username = cookie('username');
        $user = new User();
        $userid = $user->getmyuid($username);
        $carid = $params['carid'];
        $start_date = $params['start_date'];
        $end_date = $params['end_date'];
        $remark = $params['remark'];
        $application = new Application();
        $application->addapplication($userid,$carid,$start_date,$end_date,$remark);
        return jok('添加成功');
    }

    public function addloction(){
        $params=json_decode(file_get_contents("php://input"),true);
        $userid = $params['userid'];
        $carid = $params['carid'];
        $lng = $params['lng'];
        $lat = $params['lat'];
        $location = new Location();
        $location->addlocation($userid,$carid,$lng,$lat);
    }

    public function stop(){
        $params=json_decode(file_get_contents("php://input"),true);
        $carid = $params['carid'];
        $car = new Car();
        $car->stop($carid);
    }

    public function addemergency(){
        $params=json_decode(file_get_contents("php://input"),true);
        $userid = $params['userid'];
        $carid = $params['carid'];
        $remark = $params['remark'];
        $lng = $params['lng'];
        $lat = $params['lat'];
        $em = new Emergency();
        $em->addemergency($userid,$carid,$remark,$lng,$lat);
        return jok('ok');
    }
}