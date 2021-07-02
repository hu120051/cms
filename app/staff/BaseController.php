<?php


namespace app\staff;


abstract class BaseController
{
    /**
     *后台简单的身份判断
     *
     * @return void
     */
    public function access()
    {
        if (!cookie('username')) {
            return '123';
        }
    }
}