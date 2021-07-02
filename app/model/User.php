<?php
namespace app\model;

use think\Model;

class User extends Model
{
    protected $pk = 'uid';


    public function login($user_account, $user_password)
    {
        $user = $this->where([
            "username" => $user_account,
        ])->find();
        if ($user) {
            //判断密码是否正确
            $password = MD5($user_password);
            $md5 = $user['password'];
//            return $md5;
            if ($password != $md5) {
                return false;
            }
            $this->where([
                "username" => $user_account,
            ])->update([
                'status' => 'online'
            ]);
            $this->where("username" , $user_account)->inc('count')->update();
            return $user->toArray();
        } else {
            return false;
        }
    }
    public function changepswd($username, $oldpswd, $newpswd)
    {
        $user = $this->where([
            "username" => $username,
        ])->find();
        if ($user) {
            //判断密码是否正确
            $password = MD5($oldpswd);
            $md5 = $user['password'];
    //            return $md5;
            if ($password != $md5) {
                return false;
            }
            $new = MD5($newpswd);
            $this->where([
                "username" => $username
            ])->update([
                "password" => $new,
            ]);
            return $user;
        } else {
            return false;
        }
    }

    public function logout($username)
    {
        $this->where([
            "username" => $username,
        ])->update([
            'status' => 'offline'
        ]);
    }

    public function getmyvalue($username)
    {
        $user = $this->where([
            "username" => $username,
        ])->find()->toArray();
        return $user;
    }

    public function adduser($name,$username,$password,$group){
        $data = [
            'name' => $name,
            'username' => $username,
            'password' => $password,
            'group' => $group,
            'count' => 0,
        ];
        $this->insert($data);
        return true;
    }

    public function deleteuserbypk($uid){
        $this->where('uid',$uid)->delete();
        return true;
    }

    public function updateuser($uid,$name,$group){
        $this->where([
            "uid" => $uid,
        ])->update([
            'name' => $name,
            'group' => $group
        ]);
    }

    public function getalluser(){
        return $this->order('uid','asc')->select();
    }

    /**
     * @param $pk
     *
     * @return array
     */
    public function getmyvaluebypk($pk){
        return $this->find($pk);
    }

    public function getmyuid($username)
    {
        $user = $this->where([
            "username" => $username,
        ])->value('uid');
        return $user;
    }
}