<!-- add start -->
var addId = 0;

function addInput(id) {

    var addList = document.getElementById('addList');
    var docStyle = addList.style.display;
    if (docStyle == 'none') addList.style.display = '';

    var text = document.createElement('div');
    text.id = 'additem_' + addId;
    text.innerHTML = "<div class=\"form-group\">\n" +
        "    <div class=\"col-sm-1\">\n" +
        "    </div>\n" +
        "    <div class=\"col-sm-9\">\n" +
        "        <div class=\"box box-solid box-primary\">\n" +
        "            <div class=\"box-body\">\n" +
        "                <div class=\"box-tools pull-right\">\n" +
        "                    <a type=\"button\" class=\"btn btn-info\" href='javascript:void(0);'\n" +
        "                       onclick='addInput(\" + addId + \")' id='addlink_\" + addId + \"'>\n" +
        "                        <i class=\"fa fa-plus \"></i>\n" +
        "                    </a>\n" +
        "                </div>\n" +
        "\n" +
        "                <div class=\"form-group\">\n" +
        "                    <label class=\"col-sm-2 control-label \">单双面</label>\n" +
        "                    <div class=\"col-sm-7\">\n" +
        "                        <select id='singleDoubleSided"+ addId +"' name='printfInfos["+ addId +"].singleDoubleSided' class=\"form-control\">\n" +
        "                            <option value=\"1\">单面</option>\n" +
        "                            <option value=\"2\">双面</option>\n" +
        "                        </select>\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "\n" +
        "                <div class=\"form-group\">\n" +
        "                    <label class=\"col-sm-2 control-label xrequired\">页数</label>\n" +
        "\n" +
        "                    <div class=\"col-sm-7\">\n" +
        "                        <input id='pagesNumber"+ addId +"' name='printfInfos["+ addId +"].pagesNumber' type=\"text\" class=\"form-control\" \n" +
        "                             required=\"required\"  placeholder=\"请输入打印页数\">\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "\n" +
        "                <div class=\"form-group\">\n" +
        "                    <label class=\"col-sm-2 control-label xrequired\">份数</label>\n" +
        "\n" +
        "                    <div class=\"col-sm-7\">\n" +
        "                        <input type=\"text\" class=\"form-control xrequired\" id='printfNumber"+ addId +"' name='printfInfos["+ addId +"].printfNumber' \n" +
        "                              required=\"required\" placeholder=\"请输入打印份数\">\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "\n" +
        "                <div class=\"form-group\">\n" +
        "                    <label class=\"col-sm-2 control-label xrequired\">价格</label>\n" +
        "                    <div class=\"col-sm-7\">\n" +
        "                        <input type=\"text\" class=\"form-control\" id='amount"+ addId +"' name='printfInfos["+ addId +"].amount' \n" +
        "                           required=\"required\"    placeholder=\"请输入打印一张的价格\">\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "\n" +
        "                <div class=\"form-group\">\n" +
        "                    <label class=\"col-sm-2 control-label \">文件名</label>\n" +
        "                    <div class=\"col-sm-7\">\n" +
        "                        <input type=\"text\" class=\"form-control\" id='fileName"+ addId +"' name='printfInfos["+ addId +"].fileName' \n" +
        "                               placeholder=\"请输入文件名\">\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "\n" +
        "            </div>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "</div>";

    addList.appendChild(text);

    addId++;
}

addInput(0);
<!-- add end -->
