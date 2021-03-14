# 荣荣打印

### 功能

* 打印提交
* 定时任务【汇总】
* 日汇总
  * 日汇总列表
* 周汇总
  * 周汇总列表
* 月汇总
  * 月汇总列表
* 年汇总
  * 年汇总列表
* 打印记录列表
* 打印一次的钱
* 成本
  * 每次进货
  * 每月进货
  * 每年进货
  * 利润

### 表

```
nohup java -jar printing-0.0.1-SNAPSHOT.jar >msg.log 2>&1 &

nohup java -jar printing-0.0.1-SNAPSHOT.jar --server.port=9010 &

/www/wwwroot/printing/printing-0.0.1-SNAPSHOT.jar

ps -ef | grep "java"

kill -9 端口号
```

### Linux 查看java进程的命令

```
Linux下查看和停止所有java进程
在Linux下查看所有java进程命令：ps -ef | grep java
停止所有java进程命令：pkill -9 java
停止特定java进程命令：kill -9 java进程序号
```

### maven打包

> 1. 清除之前的包
> 2. 打包
> 3. 打包去掉测试

```
mvn clean package -Dmaven.test.skip=true
```

### 打入本地jar

```
mvn -install
```

### 荣荣打印数据库连接

*  阿里云数据库连接

  ```properties
  spring.datasource.driver-class-name=com.mysql.jdbc.Driver
  spring.datasource.url=jdbc:mysql://120.79.233.52:3306/printing
  spring.datasource.username=root
  spring.datasource.password=P7nPtemE2NP58yzf
  ```

* 本地数据库

  ```properties
  spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
  spring.datasource.url=jdbc:mysql://localhost:3306/printing?useSSL=false&serverTimezone=GMT%2B8
  spring.datasource.username=root
  spring.datasource.password=123456
  ```

### 荣荣打印数据库驱动

* 本地

  ```properties
  <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <scope>runtime</scope>
  </dependency>
  ```

* 阿里云

  ```properties
  <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>5.1.46</version>
  </dependency>
  ```

  

### 2020-12-8  20:00 的功能

- 记住密码 --实现
- 必填提示 --服务端实现
- 订单详情加创建时间 --完成
- 定时任务 --完成
- 确认删除的模态框提示 --完成

### 网页前端实现记住我

```js
 $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
        if($.cookie("rememberUser")) {
            $("#rememberUser").attr("checked", true);
            $("#userPhone").val($.cookie("userPhone"));
            $("#password").val($.cookie("password"));
        };
    });

    $("#btn-submit").on("click", function() {
        var userPhone = $("#userPhone").val();
        var password = $("#password").val();
        var flag = $("#rememberUser").prop("checked");
        if(flag) {
            $.cookie("rememberUser", "true", {
                expires: 7
            });
            $.cookie("userPhone", userPhone, {
                expires: 7
            });
            $.cookie("password", password, {
                expires: 7
            });
            location.href="http://127.0.0.1:9080/";
        } else {
            $.cookie("rememberUser", "false", {
                expires: -1
            });
            $.cookie("userPhone", '', {
                expires: -1
            });
            $.cookie("password", '', {
                expires: -1
            });
        }
    });

```

### 定时任务

```
package xyz.mxue.printing.commons.scheduled;

import cn.hutool.core.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import xyz.mxue.printing.service.TbOrderDayService;
import xyz.mxue.printing.service.TbOrderMonthService;
import xyz.mxue.printing.service.TbOrderYearService;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author mxuexxmy
 * @date 12/8/2020$ 11:35 PM$
 */
@Component
public class ScheduledTasks {

    @Resource
    private TbOrderDayService dayService;

    @Resource
    private TbOrderMonthService monthService;

    @Resource
    private TbOrderYearService yearService;

    @Scheduled(cron = "0 0,10 0,0 ? * ? ")
    public void reportCurrentTime() {
        Date date = new Date();
        Date yesterday = DateUtil.yesterday();
        System.out.println( yesterday + "日记录定时更新：" + dayService.dayRecord(yesterday));
        System.out.println(DateUtil.today() + "日记录定时更新：" + dayService.dayRecord(date));
        System.out.println(DateUtil.beginOfMonth(date) + "月记录定时更新：" + monthService.monthRecord(date));
        System.out.println(DateUtil.beginOfYear(date) + "年记录定时更新：" + yearService.yearRecord(date));
    }
    
 }
```

### 2020-12-9

* 修复过滤器与拦截器的bug， 其实就是配置
* 添加了关于页面

### 2020-12-10

*  个人信息页面

### 关于荣荣打印

* 荣荣打印
  * 记录打印
  * 定时统计
  * 记录成本
  * 计算亏损
* 在线校园打印
  * 实现用户端和管理端分离
    * 管理端
      * 文件管理
      * 在线下载文件打印
      * 用户管理
      * 订单管理
      * 记录打印
      * 记录成本
      * 计算亏损
      * 上传打印文件模板
      * 信息通知
    * 用户端
      * 我的文件
      * 选择打印模板进行打印
      * 收货地址管理
      * 在线上传文件
      * 在线支付
      * 在线计算打印价格
      * 我的订单
* 校园智能打印

