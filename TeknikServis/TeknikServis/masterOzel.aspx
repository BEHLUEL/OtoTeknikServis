<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="masterOzel.aspx.cs" Inherits="TeknikServis.masterOzel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background:rgb(90,30,50)">
    <form id="form1" runat="server">
        <div>
            <div class="row" style="margin-top:20px;margin-bottom:20px;">
            
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="margin-left:40px">


                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" id="btnServisKayit">Servis Kayitlari</button>
                        <button type="button" class="btn btn-primary" id="btnArac">Arabalar</button>
                        <button type="button" class="btn btn-primary" id="btnMusteri">Musteriler</button>
                        <button type="button" class="btn btn-primary" id="btnParca">Parcalar</button>
                        <button type="button" class="btn btn-primary" id="btnAlimlar">Parca Alimlari</button>
                        <button type="button" class="btn btn-primary" id="btnTedarikci">Tedarikciler</button>
                        <button type="button" class="btn btn-primary" id="btnMarka">Marka/Model</button>
                        <button type="button" class="btn btn-primary" id="btnCalisanlar">Calisanlar</button>
                        <button type="button" class="btn btn-primary" id="btnKullanicilar">Kullanicilar</button>
                        <button type="button" class="btn btn-primary" id="btnStatu">Statu/Calisma Alanlari</button>
                        




                    </div>
                </div>
                
                <button type="button" class="btn btn-warning" style="margin-left:30px">Cikis Yap</button>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#btnServisKayit").click(function (data) {
                $(location).attr('href', 'ServisKayitlarifs.aspx');
            });
            $("#btnArac").click(function (data) {
                $(location).attr('href', 'Araclarfs.aspx');
            });
            $("#btnMusteri").click(function (data) {
                $(location).attr('href', 'Musterilerfs.aspx');
            });
            $("#btnParca").click(function (data) {
                $(location).attr('href', 'Parcalarfs.aspx');
            });
            $("#btnAlimlar").click(function (data) {
                $(location).attr('href', 'ParcaAlimlarifs.aspx');
            });
            $("#btnTedarikci").click(function (data) {
                $(location).attr('href', 'Tedarikcilerfs.aspx');
            });
            $("#btnMarka").click(function (data) {
                $(location).attr('href', 'MarkaModelfs.aspx');
            });
            $("#btnCalisanlar").click(function (data) {
                $(location).attr('href', 'Calisanlarfs.aspx');
            });
            $("#btnKullanicilar").click(function (data) {
                $(location).attr('href', 'Kullanicilarfs.aspx');
            });
            $("#btnStatu").click(function (data) {
                $(location).attr('href', 'StatuCalismaAlanlarifs.aspx');
            });
        });
    </script>
</body>
</html>
