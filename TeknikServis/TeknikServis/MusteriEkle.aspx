<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MusteriEkle.aspx.cs" Inherits="TeknikServis.MusteriEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><title></title>
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
    <body style="background:rgb(30,50,60)">
<div class="row" style="margin-top:10px;margin-bottom:20px;">
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
        
    </div>
    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
        
    
        <div class="btn-group">
            <button type="button" class="btn btn-success">Arabalar</button>
            <button type="button" class="btn btn-success">Musteriler</button>
            
            <button type="button" class="btn btn-success">Servis Kayitlari</button>
            
            <button type="button" class="btn btn-success">Calisanlar</button>
            <button type="button" class="btn btn-success">Tedarikciler</button>
        </div>
</div>
            <button type="button" id="cikisbtn" class="btn btn-danger">Cikis Yap</button>
</div>

<div class="container-fluid">
    <div class="row">
    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
        
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
        <div class="jumbotron">
            <div class="container">
            <form action="#" method="POST" id="musteriForm" role="form">
                
                
            
                
                <div class="row">
                <h2 style="margin-bottom:20px">Müşteri Ekle</h2>

                    
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="ad">Ad</label>
                        <input type="text" name="ad" id="inputAd" class="form-control" value="" required="required" title="">
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="soyad">Soyad</label>
                        <input type="text" name="soyad" id="inputSoyad" class="form-control" value="" required="required" pattern="" title="">
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="tckno">Tc Kimlik No</label>
                        <input type="text" name="tckimlikno" id="inputTckimlikno" class="form-control" value="" required="required" pattern="" title="">
                    </div>
                </div>
                <div class="row" style="margin-top:20px">
                    
                    
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="telefon">Telefon</label>
                        <input type="text" name="telefon" id="inputTelefon" class="form-control" value="" required="required" pattern="" title="">
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="inputEmail" class="form-control" value="" required="required" title="">
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <label for="adres">Adres</label>
                        <textarea name="adres" id="inputAdres" class="form-control" rows="3" required="required"></textarea>
                    </div>

                </div>
                <button type="submit" id="kayitGonder" class="btn btn-primary">Ekle</button>
            </form>
            </div>
        </div>
    </div>
</div>
</div>
    <script>
$(document).ready(function(){
    $("#cikisbtn").click(function () {
                $.post("service.ashx?islem=cikis", function (data) {

                });
    });
                 $("#musteriForm").submit(function (event) {
                
                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=musteriEkle", $("#musteriForm").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        alertify.error(obj.mesaj);




                    }
                    else {
                        alertify.error(obj.mesaj);
                    }



                });

                event.preventDefault();
            });
    });
    </script>
</body>
</html>
