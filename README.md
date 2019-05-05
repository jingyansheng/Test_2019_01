# 中科软信息系统本部开发人员技术水平测试工程

时间: 2019.4.28

这是一个基于spring-boot的工程，基础结构和代码已经写好，在这个工程上直接开发要求的功能就行了。
做完以后，文档直接写在这个文件里，工程clean后打成zip包发送给相关人员。


### 实现功能

- 用户登陆、注销、注册；问题反馈的增加、修改、查看

- bootstrap样式导航 当前用户和管理员标签

- 导出excel功能准备用POI 时间问题没写

### 开发环境

- JDK 1.8
- MySQL 8.0
- 构建工具Maven 

### 开发使用技术

- SpringBoot框架 	

- 采用freemarker模板引擎 Bootstrap前端框架,TinyMCE

- 数据库操作使用MyBatis

### 项目结构说明

- 资源：templates/

- 源码：com.sinosoft.exam

- 初始化数据sql脚本: db/init.sql