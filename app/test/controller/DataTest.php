<?php


namespace app\test\controller;


use think\facade\Db;

class DataTest
{
    public function index(){
        $user = Db::name('user')->order('uid','asc')->select();
        dump($user->toArray());
        $car = Db::name('car')->where('price','>','10')->select();
        dump($car);
//        return json($user->toArray());
    }
}