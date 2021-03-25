function logout(url) {
    var ii = layer.load();
    setTimeout(function () {
        layer.close(ii);
        $.ajax({
            type: "get",
            data: "json",
            url: url,
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.status == 200) {
                    layer.msg(result.message, {icon: 6, time: 2000}, function () {
                        window.location.href = "/";
                    });
                }
                if (result.status == 500) {
                    layer.msg(result.message, {icon: 5});
                }
            },
            error: function () {

            }
        });
    });
}

// 重置输入框
function formReset() {
    document.getElementById("myForm").reset();
}

// 统计更新
function statisticsRecord(url, goUrl) {
    var ii = layer.load();
    setTimeout(function () {
        layer.close(ii);
        $.ajax({
            type: "get",
            data: "json",
            url: url,
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.status == 200) {
                    if (goUrl == null) {
                        layer.msg(result.message, {icon: 6, time: 2000});
                    } else {
                        layer.msg(result.message, {icon: 6, time: 2000},
                            function () {
                                window.location.href = goUrl;
                            }
                        );
                    }
                }
                if (result.status == 500) {
                    layer.msg(result.message, {icon: 5});
                }
            },
            error: function () {

            }
        });
    }, 3000);
};

// 保存和修改 账单信息
function saveAccount(url, goUrl) {
    var id = $("#id").val();
    var money = $("#money").val();
    var categoriesId = $("#categoriesId").val();
    var spendType = $("#spendType").val();
    var description = $("#description").val();

    var data = {
        "id": id,
        "money": money,
        "categoriesId": categoriesId,
        "spendType": spendType,
        "description": description
    };

    ajaxSubmit(url, goUrl, data);
}

// 保存和修改 分类信息
function saveCategories(url, goUrl) {
    var id = $("#id").val();
    var name = $("#name").val();
    var description = $("#description").val();

    var data = {"id": id, "name": name, "description": description};

    var ii = layer.load();

    setTimeout(function () {
        layer.close(ii);
        $.ajax({
            type: "post",
            data: "json",
            url: url,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.status == 200) {
                    layer.msg(result.message, {icon: 6, time: 2000}, function () {
                        window.location.href = goUrl;
                    });
                }
                if (result.status == 500) {
                    layer.msg(result.message, {icon: 5});
                }
            },
            error: function () {

            }
        });
    });

}

// 公共提交 Ajax
function ajaxSubmit(url, goUrl, data) {

    var ii = layer.load();

    setTimeout(function () {
        layer.close(ii);
        $.ajax({
            type: "post",
            data: "json",
            url: url,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.status == 200) {
                    layer.msg(result.message, {icon: 6, time: 2000}, function () {
                        window.location.href = goUrl;
                    });
                }
                if (result.status == 500) {
                    layer.msg(result.message, {icon: 5});
                }
            },
            error: function () {

            }
        });
    });
}

function savePrintfOrderInfo(url, goUrl) {
    var userName = $("#userName").val();
    var printfInfos = getPrintfInfos();
    var userPhone = $("#userPhone").val();
    var userQq = $("#userQq").val();
    var userWxchat = $("#userWxchat").val();
    var note = $("#note").val();
    var address = $("#address").val();

    var data = {
        "userName": userName,
        "printfInfos": printfInfos,
        "userPhone": userPhone,
        "userQq": userQq,
        "userWxchat": userWxchat,
        "note": note,
        "address": address
    }

    var ii = layer.load();

    setTimeout(function () {
        layer.close(ii);
        $.ajax({
            type: "post",
            data: "json",
            url: url,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.status == 200) {
                    layer.alert(result.message, {icon: 6}, function () {
                        window.location.href = goUrl;
                    })
                }
                if (result.status == 500) {
                    layer.msg(result.message, {time: 2000, icon: 5});
                }
            },
            error: function () {

            }
        });
    });
}

function getPrintfInfos() {
    let printfInfos = [];
    for (let i = 0; i < addId; i++) {
        let printfInfo = new Map();
        let singleDoubleSided = "#singleDoubleSided" + i;
        let pagesNumber = "#pagesNumber" + i;
        let printfNumber = "#printfNumber" + i;
        let amount = "#amount" + i;
        let fileName = "#fileName" + i;
        printfInfo['singleDoubleSided'] = $(singleDoubleSided).val();
        printfInfo['pagesNumber'] = $(pagesNumber).val();
        printfInfo['printfNumber'] = $(printfNumber).val();
        printfInfo['amount'] = $(amount).val();
        printfInfo['fileName'] = $(fileName).val();
        printfInfos.push(printfInfo);
    }
    return printfInfos;
}

// 删除信息
function deleteInfo(url, msg) {
    layer.confirm(msg, {icon: 3, title: '提示'}, function (index) {
        let ii = layer.load();
        setTimeout(function () {
            layer.close(ii);

            $.ajax({
                "type": "get",
                "dataType": "JSON",
                "url": url,
                success: function (result) {
                    if (result.status == 200) {
                        layer.msg(result.message, {icon: 6}, function () {
                            window.location.reload();
                        })
                    }
                },
                error: function () {

                }
            });
        }, 10000);
        layer.close(index);
    });
}