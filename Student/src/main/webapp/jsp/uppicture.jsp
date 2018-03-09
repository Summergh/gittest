<!DOCTYPE html>
<%@ page pageEncoding="utf-8" isELIgnored="false" isErrorPage="false" %>
<html>
<head lang="en">
    <meta charset="gb2312">
    <title>jQuery头像裁剪插件cropbox - 站长素材</title>
    <link rel="stylesheet" href="/static/css/styles.css" type="text/css" />
    <style>
        .container
        {
            position: absolute;
            top: 5%; left: 36%; right: 0; bottom: 0;
        }
        .action
        {
            width: 400px;
            height: 30px;
            margin: 10px 0;
        }
        .cropped>img
        {
            margin-right: 10px;
        }
    </style>
    <script src="/static/js/jquery-1.11.1.min.js"></script>
    <script src="/static/js/cropbox.js"></script>
    <script type="text/javascript">
        $(window).load(function() {
            var options =
                {
                    thumbBox: '.thumbBox',
                    spinner: '.spinner',
                    imgSrc: '/static/img/a.png'
                }
            var cropper = $('.imageBox').cropbox(options);
            $('#file').on('change', function(){
                var reader = new FileReader();
                reader.onload = function(e) {
                    options.imgSrc = e.target.result;
                    cropper = $('.imageBox').cropbox(options);
                }
                reader.readAsDataURL(this.files[0]);
                this.files = [];
            })
            $('#btnCrop').on('click', function(){
                var img = cropper.getDataURL();
                $('.cropped').append('<img src="'+img+'">');
            })
            $('#btnZoomIn').on('click', function(){
                cropper.zoomIn();
            })
            $('#btnZoomOut').on('click', function(){
                cropper.zoomOut();
            })
        });
    </script>

</head>
<body>

<div class="container">
    <div class="imageBox">
        <div class="thumbBox"></div>
        <div class="spinner" style="display: none">Loading...</div>
    </div>
    <div class="action">
        <input type="file" id="file" style="float:left; width: 250px">
        <input type="button" id="btnCrop" value="提交" style="float: right">
        <input type="button" id="btnZoomIn" value="+" style="float: right">
        <input type="button" id="btnZoomOut" value="-" style="float: right">
    </div>
    <div class="cropped">

    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#btnCrop').on('click', function(){
            var img = cropper.getBlob();
            var formdata = new FormData();
            formdata.append("imagefile", img);
            $.ajax({
                url:"/admin/updateHeadPicture.action",
                data: formdata,
                type:"post",
                //默认值: true。默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
                // 都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
                processData: false,
                contentType: false,
                success: function(oResult) {
                    if(oResult.success==1){
                        window.location.href="/image";
                    }else{
                        alert(oResult.message);
                    }
                }
            })
        })
        })
    })
</script>


</body>
</html>