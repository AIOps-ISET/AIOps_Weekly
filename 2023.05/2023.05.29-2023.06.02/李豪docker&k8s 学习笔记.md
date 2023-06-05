# docker&k8s 学习笔记

docker常用命令：

启动docker：systemctl start docker

停止docker：systemctl stop docker

查看docker状态：systemctl status docker

拉取镜像：docker pull nginx

后台启动容器，端口映射： docker run -d -p 90:80 nginx

停止容器： docker stop 'name'

查看所有容器：docker ps

查看容器信息：docker inspect 'id'

docker compose容器编排



查看集群部署详细信息：kubectl get all -owide

 k8s启动server:kubectl create deployment nginx --image=nginx

该资源的选择器用作指定端口上新服务的选择器： kubectl expose deployment nginx --port=80 --type=NodePort

映射到宿主机：kubectl port-forward --address 0.0.0.0 service/nginx 8080:80

![image-20230527145658624](C:\Users\LENOVO\AppData\Roaming\Typora\typora-user-images\image-20230527145658624.png)

docker 起Nginx



![image-20230527202515422](C:\Users\LENOVO\AppData\Roaming\Typora\typora-user-images\image-20230527202515422.png)