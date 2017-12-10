<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="masterTeknik.aspx.cs" Inherits="TeknikServis.masterTeknik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<div class="container-fluid">
    

    <form id="form1" runat="server">
    <div>
        <div class="row" style="margin-top:10px;margin-bottom:20px;">
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
        
    </div>
    
            
       
    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" >
        
    
        <div class="btn-group">
            <a href="ServisKayitlarift.aspx"><button type="button" class="btn btn-warning">Servis Kayitlari</button></a>
            <a href="yeniServisKaydift.aspx"> <button type="button" class="btn btn-warning">Yeni Servis Kaydı</button></a>            
            <a href="Musterilerft.aspx"><button type="button" class="btn btn-warning">Arabalar</button></a>            
            

        </div>
         
</div>
            <button type="button" id="cikisbtn" class="btn btn-danger">Cikis Yap</button>
</div>
    </div>
    </form>
    </div>
    <script>
        $(document).ready(function () {
            $("#cikisbtn").click(function () {
                //$.post("service.ashx?islem=cikis", function (data) {

                //});
                alertify.success("sdfsfghfghxfg");
            });

        });
    </script>
</body>
</html>
