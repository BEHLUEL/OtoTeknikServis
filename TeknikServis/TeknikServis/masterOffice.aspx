<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="masterOffice.aspx.cs" Inherits="TeknikServis.masterOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="row" style="margin-top:10px;margin-bottom:20px;">
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
        
    </div>
    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" >
        
    
        <div class="btn-group">
            <a href="Araclarfo.aspx"><button type="button" class="btn btn-success">Arabalar</button></a>
            <a href="Musterilerfo.aspx"><button type="button" class="btn btn-success">Musteriler</button></a>            
            <a href="ServisKayitlarifo.aspx"> <button type="button" class="btn btn-success">Servis Kayitlari</button></a>            
            <a href="Calisanlarfo.aspx"><button type="button" class="btn btn-success">Calisanlar</button></a>
            <a href="Tedarikcilerfo.aspx"> <button type="button" class="btn btn-success">Tedarikciler</button></a>
        </div>
</div>
            <button type="button" id="cikisbtn" class="btn btn-danger">Cikis Yap</button>
</div>
    </div>
    </form>
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
