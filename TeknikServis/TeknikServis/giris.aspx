<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="giris.aspx.cs" Inherits="TeknikServis.giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

    <link href="Content/alertifyjs/alertify.min.css" rel="stylesheet" />
    <link href="Content/alertifyjs/themes/default.min.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="Scripts/alertify.min.js"></script>
    <script src="Scripts/moment.min.js"></script>
    <script src="Scripts/moment-with-locales.min.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.js"></script>
    
</head>

<body background="resimler\tool_shed-wallpaper-1366x768.jpg">
    <div class="container-fluid">
    
        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">

            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-top: 20px" >
            
                <div class="jumbotron">
                    <div class="container">
                        
                        <form id="girisForm" runat="server">
                            
                            <label for="kullaniciadi" style="margin-top: 10px;color: rgb(22,115,143);">Kullanıcı Adı</label>
                            <br />
                           <input type="text" name="kullaniciadi" id="input" class="form-control" value="" required="required" title="">
                            <br />
                            
                            <label for="sifre" style="margin-top: 20px;color: rgb(22,115,143);">Şifre</label>
                            <input type="password" name="sifre" id="txtsifre" class="form-control"  title="">
                            <button type="submit" class="btn btn-success" id="girisbtn" style="margin-top:20px; align:right;">Giris</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#girisForm").submit(function () {

                $.post("service.ashx?islem=giris", $("#girisForm").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        alertify.success("kayıt yapıldı.");
                        $(location).attr('href', 'WebForm2.aspx');
                    }
                    else {
                        alert(obj.mesaj);
                    };



                });

                event.preventDefault();

            });
        });
    </script>
</body>
</html>
