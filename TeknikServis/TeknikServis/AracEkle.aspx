<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AracEkle.aspx.cs" Inherits="TeknikServis.AracEkle" %>

<!DOCTYPE html>

    <head>
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
    <body style="background:rgb(30,50,60)">
        <div id="master"></div>

    <h1 style="color:white">ARAÇ EKLE</h1>

    <div class="container-fluid" style="margin-top:20px">
    <div class="jumbotron">
        <div class="container">
        <form action="#" method="POST" role="form" id="aracform">
            
        
            
        
            
            <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    
                <label for="marka">Marka</label>
                <select name="marka" id="inputMarka" class="form-control" required="required">
                    <option value="">--Seçiniz--</option>
                </select>
            
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                     <label for="model">Model</label>
                    
                <select name="model" id="inputModel" class="form-control" required="required">
                    <option value="">--Seciniz--</option>

                </select>
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <label for="yil">Model Yılı</label>
                <input type="text" name="yil" id="inputYil" class="form-control" value="" required="required" title="">
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <label for="plaka">Plaka</label>
                    <input type="text" name="plaka" id="inputPlaka" class="form-control" value="" required="required" title="">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <label for="sasi">Şasi No</label>
                <input type="text" name="sasi" id="inputSasi" class="form-control" value="" required="required" title="">
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <label for="tel">Telefon numarası</label>
                <input type="text" name="tel" id="inputTel" class="form-control" value=""  required="required" placeholder="Araç sahibinin telefon numarası" title="">
                </div>
            </div>
            
            <button type="submit"id="kayitGonder" class="btn btn-primary">Submit</button>
        </form>
        </div>
    </div>
    <%--<form action="" method="POST" role="form" id="aracform">
          
        <div class="row">
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="margin-top:30px">
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <label for="marka">Marka</label>
                <select name="marka" id="inputMarka" class="form-control" required="required">
                    <option value="">--Seciniz--</option>
                    
                </select>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <label for="marka">Model</label>
                    
                <select name="model" id="inputModel" class="form-control" required="required">
                    <option value="">--Seciniz--</option>

                </select>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <label for="yil">Model Yılı</label>
                <input type="text" name="yil" id="inputYil" class="form-control" value="" required="required" title="">
            </div>
                
            </div>

        </div>
        <div class="row" style="margin-top:20px">
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                
            </div>
            
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    
                </div>
                
                
           
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <label for="sasi">Şasi No</label>
                <input type="tel" name="sasi" id="inputSasi" class="form-control" value="" required="required" title="">
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <label for="tel">Telefon numarası</label>
                <input type="tel" name="tel" id="inputTel" class="form-control" value=""  required="required" placeholder="Araç sahibinin telefon numarası" title="">
           
                </div>
        </div>
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                
            </div>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;margin-bottom:20px">Kaydet</button>
        </div>
        
        </form>--%>
    </div>
    
        <script>
        $(document).ready(function(){

            $("#master").load("masterOffice.aspx");
            $.post("service.ashx?islem=getMarka", function (data) {
                var obj = $.parseJSON(data);
          
          var output='';
           if(obj.basarili){
               $.each(obj.data, function (index, val) {
                
                output += "<option value"+obj.data[index].MarkaId+">"+obj.data[index].MarkaAdi+"</option>";

              });
                $(output).appendTo("#inputMarka");

           }
           else{
            alertify.error(obj.mesaj);
           }
            });


            $.post("service.ashx?islem=getModel", function (data) {//model isimlerini drop downın içine yerleştirir.
                var obj = $.parseJSON(data);
          
          var output='';
           if(obj.basarili){

               $.each(obj.data, function (index, val) {
                
                output += "<option value"+obj.data[index].ModelId+">"+obj.data[index].ModelAdi+"</option>";

              });
                $(output).appendTo("#inputModel");

           }
           else{
            alertify.error(obj.mesaj);
           }
            });
            //$("#aracform").submit(function (event) {

            //    $.post("service.ashx?islem=aracEkle", $("#aracform").serialize(), function (data) {
            //        var obj = $.parseJSON(data);
            //        if (obj.basarili) {
            //            alertify.success("kayıt yapıldı.");
            //            $(location).attr('href', 'WebForm2.aspx');
            //        }
            //        else {
            //            alert(obj.mesaj);
            //        };



            //    });

            //    event.preventDefault();

            //});
//$.post("service.ashx?islem=aracEkle", $("#aracform").serialize(), function (data) {
//                    var obj = $.parseJSON(data);
//                    if (obj.basarili) {
//                        alertify.error(obj.data);




//                    }
//                    else {
//                        alertify.error(obj.mesaj);
//                    }



//                });
            $("#kayitGonder").click(function () {
                
                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=aracEkle", $("#aracform").serialize(), function (data) {
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

