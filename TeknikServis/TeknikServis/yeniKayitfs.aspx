<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yeniKayitfs.aspx.cs" Inherits="TeknikServis.yeniKayitfs" %>

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
<body style="background:rgb(60,30,30)">

<div class="modal fade" id="modal-id">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Yeni Bir Parca</h4>
            </div>
            <div class="modal-body">
                <form action="#" method="POST" role="form" id="yeniparcaform">
        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <label for="parca">Parca</label>
                <input type="text" name="parcaadi" id="inputParcaadi" class="form-control" value="" required="required"title="">
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <label for="model">Uygun Model</label>
                <select name="modeller" id="inputModeller" class="form-control">
                    <%-- sql sorgusuyla veriler gelecek --%>
                </select>
            </div>
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                <label for="">Uyumlu Modeller</label>
                <textarea name="modellertxt" id="inputModellertxt" class="form-control" rows="4" ></textarea>
            </div>
        </div>
    
        
    
        <button type="button" id="eklebtn"class="btn btn-primary">Ekle</button>
        
    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">İptal</button>
                <button type="button" class="btn btn-primary" id="btnkaydet">Kaydet</button>
            </div>
        </div>
    </div>
</div>
    <div id="master"></div>
   <div class="container-fluid">

       <div class="jumbotron">
           <div class="container">
           <form action="#" method="POST" role="form" id="alisform">
               
           
               
           
               
           <div class="row">
               <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                   <label for="tedarikci">Tedarikci</label>
                   <select name="tedarikci" id="inputTedarikci" class="form-control" required="required">
                       
                   </select>
               </div>
               <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                   <label for="fiyat">Fiyat</label>
                   <input type="text" name="fiyat" id="inputFiyat" class="form-control" value="" required="required" title="">
               </div>


           </div>
           <div class="panel panel-primary" style="margin-top:20px">
               <div class="panel-heading">
                   <div class="row" style="margin-top:20px">
               <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                   <label for="Parca">Parca</label>
                   <select name="parca" id="inputParca" class="form-control" required="required">
                       
                   </select>
               </div>
               <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                   <label for="adet">Adet</label>
                   <input type="text" name="adet" id="inputAdet" class="form-control" value="" required="required" title="">
               </div>
               <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                   <textarea name="parcalar" id="inputParcalar" style="margin-top:25px" class="form-control" rows="4" required="required"></textarea>
               </div>
               
  
           </div>
           <button type="button" style="margin-bottom:20px" id="stokparcaekle" class="btn btn-success">Ekle</button>

               <a class="btn btn-danger" style="margin-bottom:20px;margin-left:20px" data-toggle="modal" href='#modal-id'>Stokta bulunmayan bir parca</a>
               </div>
               
           </div>
           
           

           <button type="submit" class="btn btn-primary">Kaydet</button>
           </form>
           </div>
       </div>
   </div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");

            $("#alisform").submit(function (event) {

                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=parcaAlimEkle", $("#alisform").serialize(), function (data) {
                    
                    
                    
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        

                        alertify.success(obj.mesaj);
                    }
                    else {
                        alertify.error(obj.mesaj);
                    }



                });

                event.preventDefault();
            });

            $.post("service.ashx?islem=getTedarikci", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);

                var output = '';
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {

                        output += "<option value" + obj.data[index].TedarikciId + ">" + obj.data[index].TedarikciAdi + "</option>";

                    });
                    $(output).appendTo("#inputTedarikci");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });
            parcagetir();
            function parcagetir () {
                 
          
            $.post("service.ashx?islem=getParca1", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);

                var output = '';
                if (obj.basarili) {
                     output+="<option>--Seciniz--</option>";
                    $.each(obj.data, function (index, val) {

                        output += "<option value" + obj.data[index].ParcaId + ">" + obj.data[index].ParcaAdi +"-" +obj.data[index].ParcaId +"</option>";

                    });
                    $(output).appendTo("#inputParca");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });
  }
            $.post("service.ashx?islem=getModel", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);

                var output = '';
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {

                        output += "<option value" + obj.data[index].ModelId + ">" + obj.data[index].ModelAdi + "</option>";

                    });
                    $(output).appendTo("#inputModeller");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });

            $("#stokparcaekle").click(function () {

                var parca = $("#inputParca").val();
                var adet = $("#inputAdet").val();




                outputparca += '' + parca + '*' + adet + '\r';



                $("#inputParcalar").html(outputparca);

            });

            var outputparca = '';
            $("#eklebtn").click(function () {

                var parca = $("#inputParcaadi").val();
                var modeller = $("#inputModeller").val();




                outputparca += '' + parca + '*' + modeller + '\r';



                $("#inputModellertxt").html(outputparca);

            });
            $("#btnkaydet").click(function () {
                outputparca='';
                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=parcaEkle", $("#yeniparcaform").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        alertify.success(obj.mesaj);
                        parcagetir();



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