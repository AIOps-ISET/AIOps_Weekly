# Submit Weekly

`Submit Weekly`实现自动编号（附件与内容），自动通过`pandoc`将markdown转化为word，然后生成压缩包，自动地将周报发送给相关的老师的邮箱，提交后，下载上传至QQ群中即可。

首先通过`submit_weekly.sh`通过`sed`结合正则，选择出`[]()`的内容，通过shell script对其编号。然后创建`template_copy.md`修改其内容。同时，github action将会安装`zip`和`pandoc`。通过`pandoc`自动地将md转化为docx，然后通过`zip`直接压缩。然后commit压缩文件。

注意，由于附件的转换目前代码没有任何的实现，仅支持上传word文件。

遗憾地是，shell脚本采用了比较丑陋的方式，即通过日期进入这一周的周报由于采取utc，而国内位于utc 8+，故截止时间为星期一8点手动执行github action。

同时，`Submit Weekly`会发送生成的周报至老师的邮箱，故维持了五个Secret变量：

+ `MAIL_USERNAME`：实验室的邮箱名。
+ `MAIL_PASSWORD`：生成的邮件应用密码。
+ `BIG_BOSS_EMAIL_ADDRESS`
+ `LITTLE_BOSS_EMAIL_ADDRESS`
+ `SELF_MAIL_ADDRESS`：自己的邮箱，用于检查邮件是否正常发送，且备份。

注意，如果你要修改发送的邮件的内容，请修改`Template/email.md`文件。

近期，实验室采用了企业微信作为工作的群。企业微信提供了群机器人可以自动上传文件，故增加了一个`py`脚本实现上传文件的自动化，并在仓库中增加了一个Secret变量：

+ `WEIXIN_ROBOT`：微信群机器人的key。

其基本的逻辑很简单，请参考腾讯的[教程](https://developer.work.weixin.qq.com/document/path/91770)
