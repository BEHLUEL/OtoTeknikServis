<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalisanEklefs.aspx.cs" Inherits="TeknikServis.CalisanEklefs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Çalışan Ekle</title>
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
<body style="background:rgb(60,30,30)">


    <div id="master"></div>
    <div class="container-fluid">
    

   <div class="jumbotron">
       <div class="container">
       <h2 style="margin-bottom:60px">Calisan Ekle</h2>
       <form action="#" method="POST" role="form" id="formcalisan">
           
          
       <div class="row">
       <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
           
       </div>
           <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
               <label for="">Ad</label>
               <input type="text" name="ad" id="inputAd" class="form-control" value="" required="required"title="">

           </div>
           
           <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
               <label for="">Soyad</label>
               <input type="text" name="soyad" id="inputSoyad" class="form-control" value="" required="required" title="">
           </div>
           <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <label for="">Kimlik No</label>
               <input type="text" name="kimlikno" id="inputKimlikno" class="form-control" value="" required="required" title="">
           </div>
           <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <label for="">Telefon</label>
               <input type="text" name="tel" id="inputTel" class="form-control" value="" required="required" title="">
           </div>
       </div>
       <div style="margin-top:40px" class="row">
           <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
               
           </div>
           <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
               <label for="">E-mail</label>
               <input type="text" name="email" id="inputEmail" class="form-control" value="" title="">
           </div>

            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
           <label for="">Adres</label>
           <textarea name="adres" id="inputAdres" class="form-control" rows="4" required="required"></textarea>
       </div>
       <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <label for="">Statu</label>
           <select name="statu" id="inputStatu" class="form-control" required="required">
               
           </select>
       </div>
       <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <label for="">Calisma Alani</label>
           <select name="calismaalani" id="inputCalismaalani" class="form-control" required="required">
               
           </select>

       </div>
       </div>
       <div class="row">
           <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
               
           </div>
           <div style="margin-top:20px" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
     <button type="submit" id="btnEkle" class="btn btn-primary">Ekle</button>
               
           </div>

       </div>
       </form>
    </div>
   </div>
    	</div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");
            
           $.post("service.ashx?islem=getStatu", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);

                var output = '';
                    output+="<option value=>--Seciniz--</option>";
               
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {

                        output += "<option value=" + obj.data[index].StatuId + ">" + obj.data[index].Statu + "</option>";

                    });
                    $(output).appendTo("#inputStatu");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });
          
             $.post("service.ashx?islem=getCalismaAlani", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);

                var output = '';
                    output+="<option value=>--Seciniz--</option>";
               
                 if (obj.basarili) {

                    $.each(obj.data, function (index, val) {

                        output += "<option value=" + obj.data[index].CalismaAlaniId + ">" + obj.data[index].CalismaAlani + "</option>";

                    });
                    $(output).appendTo("#inputCalismaalani");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });

             

            
             $("#btnEkle").click(function () {
                     
                
                 
                 $.post("service.ashx?islem=calisanEkle", $("#formcalisan").serialize(), function (data) {
                     var obj = $.parseJSON(data);
                     if (obj.basarili) {
                         alertify.success(obj.mesaj);
                         



                     }
                     else {
                         alertify.error(obj.mesaj);
                     }
                 });
             });
             
            
        });
    </script>
</body>
</html>
