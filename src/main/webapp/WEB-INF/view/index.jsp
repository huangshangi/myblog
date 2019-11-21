<%--
  Created by IntelliJ IDEA.
  User: huangshangi
  Date: 2019/11/3
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="../src/layui-v2.5.5/layui/css/layui.css">
</head>
<input class="layui-layout-body">
<form action="/upload" method="post" enctype="multipart/form-data">

    <input type="file" name="file"> shanghcuang</input>
    <button type="submit">提价</button>

</form>


<script src="../src/layui-v2.5.5/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>