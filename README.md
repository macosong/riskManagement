# riskManagement2.0

![Travis](https://img.shields.io/badge/language-Java-yellow.svg) ![](https://img.shields.io/badge/SpringBoot-v2.2.4-brightgreen)  ![](https://img.shields.io/badge/maven--repo-nexus--aliyun-orange)



税收风险管理系统基于Spring Boot + MyBatis + MySQL技术栈开发。项目使用Jenkins构建并发布部署到云主机172.19.241.75上，项目演示地址：http://172.19.241.75:8090/login



### 目录说明

1. `src`为项目源代码，包括后端、前端以及配置文件等。
2. `start.sh`为云主机服务器启动脚本，Jenkins会将其同war包一起发送到远程并自动执行。
3. `taxAnalysis.sql`为数据库建表sql脚本。数据库搭建在172.19.241.75上，mysql版本：5.7.28。



### 技术栈

* SpringBoot
* MyBatis
* MySQL
* Vue.js
* PageHelper
