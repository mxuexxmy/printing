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

#### 打包方式 1（已过期）

```
mvn clean package -Dmaven.test.skip=true
```

#### 打包方式 2
```
 mvn clean install package '-Dmaven.test.skip=true'
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

```
AccountUpdateDTO(id=10, money=110.0, categoriesName=[CategoriesNameDTO(categoriesId=1, categoriesName=A4纸), CategoriesNameDTO(categoriesId=1, categoriesName=A4纸), CategoriesNameDTO(categoriesId=2, categoriesName=卫生纸)], spendTypes=[SpendType(spendType=0, spendTypeName=支出), SpendType(spendType=1, spendTypeName=收入)], description=测试, updateTime=Tue Mar 16 11:10:29 CST 2021)
```



```java
public class PrintfInfoDTO implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 单双面
     */
    private Integer singleDoubleSided;

    /**
     * 打印页数
     */
    private Integer pagesNumber;

    /**
     * 打印份数
     */
    private Integer printfNumber;

    /**
     * 打印一张的价格
     */
    private BigDecimal amount;

    /**
     * 打印文件名
     */
    private String fileName;

}
```

### 添加输入框

JavaScript + Mootools 

资料：

https://stackoverflow.com/questions/9455066/add-input-fields-to-div-container-javascript

http://jsfiddle.net/5sWA2/



```

    /**
     * 今日打印单数
     */
    private Integer dayPrintfNumber;

    /**
     * 今日打印收入
     */
    private BigDecimal dayPrintfIncome;

    /**
     * 今日收入
     */
    private BigDecimal dayIncome;

    /**
     * 今日支出
     */
    private BigDecimal dayPayOut;
```



### 排版

```html
  <div class="row box-info">
    <div class="col-sm-8">
        <div class="form-group">
            <label class="col-sm-3 control-label xrequired">张数</label>

            <div class="col-sm-8">
                <input type="text" class="form-control" name="paperNumber"
                        placeholder="请输入打印张数">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label xrequired">份数</label>

            <div class="col-sm-8">
                <input type="text" class="form-control" name="paperNumber"
                        placeholder="请输入打印份数">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label xrequired">价格</label>

            <div class="col-sm-8">
                <input type="text" class="form-control" name="paperNumber"
                        placeholder="请输入打印一张的价格">
            </div>
        </div>
    </div>
    <div class="col-sm-2">
        <a type="button" class="btn btn-info" href='javascript:void(0);'
            onclick='addInput(" + addId + ")' id='addlink_" + addId + "'>
            <i class="fa fa-plus "></i> 添加记录
        </a>
    </div>
</div>
```



```html
 <div class="form-group">
                                <div class="col-sm-10">

                                    <div class="box-body no-padding">
                                        <div class="row">
                                            <div class="col-md-9 col-sm-8">
                                                <div class="pad">

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label xrequired">张数</label>

                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" name="paperNumber"
                                                                   placeholder="请输入打印张数">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label xrequired">份数</label>

                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" name="paperNumber"
                                                                   placeholder="请输入打印份数">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label xrequired">价格</label>

                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" name="paperNumber"
                                                                   placeholder="请输入打印一张的价格">
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-md-3 col-sm-4">
                                                <div class="pad box-pane-right bg-green ">
                                                    <div class="description-block margin-bottom">
                                                        <div class="sparkbar pad" data-color="#fff"></div>
                                                        <a type="button" class="btn btn-info" href='javascript:void(0);'
                                                           onclick='addInput(" + addId + ")' id='addlink_" + addId + "'>
                                                            <i class="fa fa-plus "></i> 添加记录
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </div>

                                </div>
                            </div>
```



完成的

```html
<div class="form-group">
    <div class="col-sm-1">
    </div>
    <div class="col-sm-9">
        <div class="box box-solid box-primary">
            <div class="box-body">
                <div class="box-tools pull-right">
                    <a type="button" class="btn btn-info" href='javascript:void(0);'
                       onclick='addInput(" + addId + ")' id='addlink_" + addId + "'>
                        <i class="fa fa-plus "></i>
                    </a>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label xrequired">张数</label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="paperNumber"
                               placeholder="请输入打印张数">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label xrequired">份数</label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control xrequired" name="paperNumber"
                               placeholder="请输入打印份数">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label xrequired">价格</label>

                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="paperNumber"
                               placeholder="请输入打印一张的价格">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
```



#### mybatis-plus配置找不到Mapper接口路径的坑

https://blog.csdn.net/u013234928/article/details/94060733



### 分页重写

* 查询时间的解决方案 

```java
   /**
     * 日期，虚假字段
     */
    @TableField(exist = false)
    private String flagPermDate;
```



* Service 层次

```java
    /**
     * 分页查询
     *
     * @param start
     * @param length
     * @param draw
     * @param tbPrintOrder
     * @return
     */
@Override
public PageInfo<TbPrintOrder> page(int start, int length, int draw, TbPrintOrder tbPrintOrder) {

    Page<TbPrintOrder> printOrderPage = new Page<>(start, length);

    QueryWrapper<TbPrintOrder> queryWrapper = new QueryWrapper<>();
    queryWrapper.like(StrUtil.isNotBlank(tbPrintOrder.getUserName()), "user_name", tbPrintOrder.getUserName())
        .like(StrUtil.isNotBlank(tbPrintOrder.getOrderStatus()), "order_status", tbPrintOrder.getOrderStatus())
        .like(Objects.nonNull(tbPrintOrder.getUpdateTime()), "update_time", tbPrintOrder.getFlagPermDate());

    Page<TbPrintOrder> tbPrintOrderPage = orderMapper.queryPrintfOrderInfo(printOrderPage, queryWrapper);

    PageInfo<TbPrintOrder> pageInfo = new PageInfo<>();
    pageInfo.setDraw(draw);
    pageInfo.setRecordsTotal(tbPrintOrderPage.getTotal());
    pageInfo.setRecordsFiltered(tbPrintOrderPage.getTotal());
    pageInfo.setData(tbPrintOrderPage.getRecords());

    return pageInfo;
}
```

* mapper 层次

```java
 Page<TbPrintOrder> queryPrintfOrderInfo(Page<TbPrintOrder> printOrderPage ,@Param(Constants.WRAPPER) QueryWrapper<TbPrintOrder> queryWrapper);
```

* xml  层次

```java
 <select id="queryPrintfOrderInfo" resultType="xyz.mxue.printing.entity.TbPrintOrder">
        select *
        from tb_print_order ${ew.customSqlSegment}
</select>
```

* 临时用

```html
 Page<TbOrderDay> tbOrderDayPage = new Page<>(start, length);

        QueryWrapper<TbOrderDay> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(tbOrderDay.getFlagPermDate()), "date_format(stats_day,'%Y-%m-%d')", tbOrderDay.getFlagPermDate());

        Page<TbOrderDay> tbPrintOrderPage1 = dayMapper.selectPage(tbOrderDayPage, queryWrapper);

        PageInfo<TbOrderDay> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(tbPrintOrderPage1.getTotal());
        pageInfo.setRecordsFiltered(tbPrintOrderPage1.getTotal());
        pageInfo.setData(tbPrintOrderPage1.getRecords());

        return pageInfo;

```

### 打印统计

#### 统计

* 份数 

```sql
SELECT SUM(b.printf_number) FROM tb_print_order a LEFT JOIN tb_printf_info b ON a.id = b.order_id 
```

* 打印统计的纸张

* 金额  已写好

### 异步处理

```javascript
 // 删除打印记录
    function deleteOrder(url, msg) {
        if (!msg) msg = null;
        $("#modal-message").html(msg);
        $("#modal-danger").modal("show");
        // 绑定删除事件
        $("#btnModalOk").bind("click", function () {
            $("#modal-danger").modal("hide");
            // AJAX 异步删除操作
            setTimeout(function () {
                $.ajax({
                    "url": url,
                    "type": "get",
                    "dataType": "JSON",
                    "success": function (data) {
                        // 请求成功后，无论是成功或是失败都需要弹出模态框进行提示，所以这里需要先解绑原来的 click 事件
                        $("#btnModalOk").unbind("click");

                        // 请求成功
                        if (data.status === 200) {
                            // 刷新页面
                            $("#btnModalOk").bind("click", function () {
                                window.location.reload();
                            });
                        }

                        // 请求失败
                        else {
                            // 确定按钮的事件改为隐藏模态框
                            $("#btnModalOk").bind("click", function () {
                                $("#modal-danger").modal("hide");
                            });
                        }

                        // 因为无论如何都需要提示信息，所以这里的模态框是必须调用的
                        $("#modal-message").html(data.message);
                        $("#modal-danger").modal("show");
                    }
                });
            }, 500)
        });
    }
```



#### 记住密码

```javascript
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
        location.href="http://mxue.xyz:9080/";
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
```

#### 登录的 ajax 和 layer 

```javascript
/**
     * 登录
     */
    function login() {
        var userPhone = $("#userPhone").val();
        var password = $("#password").val();

        var data = {"userPhone": userPhone, "password": password}

        var ii = layer.load();

        setTimeout(function () {

            layer.close(ii);

            $.ajax({
                type: "post",
                data: "json",
                url: "/login",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                success: function (result) {
                    if (result.status == 200) {
                        layer.msg(result.message, {icon: 1, time : 2000}, function () {
                            window.location.href = "/";
                        });
                    };
                    if (result.status == 500) {
                        layer.msg(result.message);
                    }
                },
                error: function () {
                    layer.msg("登录失败！");
                }

            }, 10000);
        });
    };
```

```
singleDoubleSided
pagesNumber
printfNumber
amount
fileName


userPhone
userQq
userWxchat
address
note
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

