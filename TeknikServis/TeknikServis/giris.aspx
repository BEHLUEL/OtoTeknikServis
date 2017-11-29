<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="TeknikServis.giris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    
</head>

<body background="resimler\tool_shed-wallpaper-1366x768.jpg" style="opacity:0.9">
    <div class="container-fluid">
    
        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-top: 20px; bacground-color:rgb(100,200,200);" >
            
                <div class="jumbotron">
                    <div class="container">
                        
                        <form action="" method="POST" role="form">
                            
                            <label for="kullaniciadi" style="margin-top: 10px;color: rgb(22,115,143);">Kullanıcı Adı</label>
                            <input type="text" name="kullaniciadi" id="txtkullaniciadi" class="form-control" value="" required="required" pattern="" title="">
                            <label for="sifre" style="margin-top: 20px;color: rgb(22,115,143);">Şifre</label>
                            <input type="password" name="sifre" id="txtsifre" class="form-control" required="required" title="">
                            <button type="submit" class="btn btn-success" style="margin-top:20px">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
