# <p align="center">车辆管理系统</p>

<p align="center">
    <img src="https://svg.hamm.cn/badge.svg?key=Base&value=ThinkPHP6"/>
    <img src="https://svg.hamm.cn/badge.svg?key=Data&value=MySQL5.7"/>
    <img src="https://svg.hamm.cn/badge.svg?key=Runtime&value=PHP7.3"/>
    <img src="https://svg.hamm.cn/badge.svg?key=License&value=Apache-2.0"/>
</p>

## 相关介绍

- 重庆大学本科毕业设计项目-车队管理系统
- 目标做一个基于web，pc作为管理端，移动设备作为用户端，普通用户为车队员工，移动端登录系统后实时通过gps上传车辆定位，管理层可实时监控各个活动车辆信息
- 基于ThinkPHP6/ElementUI(PC端)/VANT(手机端)/VUE
- 有问题可联系qq：1290045698
- 部署时请向数据库配置文件my.ini中[mysqld]中添加  sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES  配置，否则可能出现错误


### <a href="https://car.aoaoao.me/" target="_blank">在线体验</a>[账号/密码:admin]


## 安装依赖库

~~~
composer install
~~~

## 其他说明

~~~
创建数据库cm(utf8-mb4)，导入数据库cm.sql
Clone或下载本仓库zip包，配置站点和ThinkPHP伪静态
复制.example.env到.env 修改自己的数据库配置
~~~

## 基于thinkphp6.0

请保证php版本7.3+<br>
[tp6完全开发手册](https://www.kancloud.cn/manual/thinkphp6_0/content)