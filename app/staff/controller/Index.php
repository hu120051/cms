<?php
namespace app\staff\controller;

use app\staff\BaseController;
use think\facade\View;



class Index extends BaseController
{
    /**
     *
     * @return string
     */
    public function index()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('staff');
    }

    public function apply()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('apply');
    }

    public function addapplication()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('addapplication');
    }

    public function myinfo()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('myinfo');
    }

    public function work()
    {

        $error = $this->access();
        if($error)
        {
            return View::fetch('login');
        }
        return View::fetch('work');
    }
}