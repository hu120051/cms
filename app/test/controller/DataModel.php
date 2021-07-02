<?php


namespace app\test\controller;


use app\model\User;
use think\facade\Db;


class DataModel
{
    public function index()
    {
//        $user = User::select();
//        dump($user);
//        return json($user);
        return json(User::find('2'));

    }

    public function insert()
    {
//        $user = new User();
//        $user->replace()->save([
//            'name'          =>  '杨肇谦',
//            'username'      =>  'yangzhaoqian',
//            'password'      =>  'a63ee944347161d3f3b55a3e0320e3aa',
//            'group'         =>  'staff'
//        ]);
//    }
        $user = new User();
        $user->save([
            'name'          =>  '杨肇谦',
            'username'      =>  'yangzhaoqian',
            'password'      =>  'a63ee944347161d3f3b55a3e0320e3aa',
            'group'         =>  'staff'
        ]);
//    }
//        $user = User::create([
//            'name'          =>  '刘义良',
//            'username'      =>  'liuyiliang',
//            'password'      =>  '3ae09f1e3ceb295a239c352461a6ca6f',
//            'group'         =>  'admin'
//        ]);

        dump( $user->order('uid','desc')->find()->toArray());
    }

    public function delect()
    {
        $user = User::find(12);
        $user->delete();
    }

    public function update()
    {
        $user = User::find(9);
        $user->username = 'fxm';
        $user->save();
    }
}