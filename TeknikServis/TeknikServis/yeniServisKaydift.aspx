<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yeniServisKaydift.aspx.cs" Inherits="TeknikServis.yeniServisKaydift" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yeni bir Servis Kaydı</title>
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
<body style="background: rgb(30,50,60)">
    <form id="form1" runat="server">
    <div id="master"></div>
    <div class="container-fluid">
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
            
        </div>
        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            <div class="jumbotron">
                <div class="container">
               <h2>Yeni Servis Kaydı</h2>
               <form action="#" id="servisForm" method="POST" role="form">
                                  
                   
               <div class="row" style="margin-top:50px">
              
                   <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                       <label for="plaka">Plaka</label>
                       <input type="text" name="plaka" id="inputPlaka" class="form-control" value="" required="required" title="">
                   </div>
                   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                       <label for="bakim">Yıllık Bakım</label>
                       <select name="yillikBakim" id="input" class="form-control" required="required">
                           
                           <option value="1">Evet</option>
                           <option value="0">Hayır</option>

                       </select>
                   </div>
                   <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                       <label for="km">Km</label>
                       <input type="text" name="km" id="inputKm" class="form-control" value="" required="required"  title="">
                   </div>
                   <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                   <textarea name="parcaIslemler" id="inputParcaIslemler" class="form-control" rows="4" required="required"></textarea>
                       
                   </div>
               </div>
               </form>
               <div class="jumbotron" style="background:rgb(30,50,60);color:rgb(250,230,220);margin-top:20px">
                   <div class="container">
                   <button type="button" id="parcaGosterbtn" class="btn btn-success" style="margin-bottom:20px">Modele uygun parçaları Göster</button>
                       <div class="row">
                   <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <label for="parca">Parça</label>
                        <select name="Parca" id="inputParca" class="form-control" required="required">
                           
                       </select>
                   </div>
                   <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                   <label for="tamirat">İşlem</label>
                       <select name="tamirat" id="inputTamirat" class="form-control" required="required">
                       <option value="0">Onarım</option>
                       <option value="1">Değişim</option>
                   </select>
                   
                   </div>
                   <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                       <label for="adet">Adet</label>
                   <input type="text" name="adet" id="inputAdet" class="form-control" value="" required="required" pattern="" title="">

                   </div>
                   
               </div>
               
               <button type="button" id="btnEkle" style="margin-top:15px" class="btn btn-success">Ekle</button>
                   </div>
               </div>
                   
               </div>
               

                
               <button type="submit" id="btnkaydet" class="btn btn-success" style="margin-left:10px">Kaydet</button>
               
                </div>
            </div>
        </div>
    </div>
        
    </div>
    </form>
    <script>
        $(document).ready(function () {
             $("#btnkaydet").click(function(data) {
                $.post("service.ashx?islem=yeniServisKayit", $("#servisForm").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if(obj.basarili){
                        alertify.success(obj.mesaj);
                    }
                    else
                        alertify.error(obj.mesaj);
                });
             event.preventDefault();

             });


            $("#master").load("masterTeknik.aspx");
            $("#parcaGosterbtn").click(function(data) {
           var plaka= $("#inputPlaka").val();

                $.post("service.ashx?islem=uygunParcalar", {plaka:plaka}, function (data) {
                 var obj = $.parseJSON(data);
          
          var output='';
           if(obj.basarili){

               $.each(obj.data, function (index, val) {
                output += "<option value"+obj.data[index].ParcaId+" "+obj.data[index].ParcaAdi+">"+obj.data[index].ParcaAdi+"</option>";
              });
                $(output).appendTo("#inputParca");

           }
           else{
            alertify.error(obj.mesaj);
           }
            
            });
            });
            $("#btnEkle").click(function(data) {
                var output='';
           var parca= $("#inputParca").val();
           var miktar=$("#inputAdet").val();
           var tamirat=$("#inputTamirat").val();

           if(inputParca!="" || inputAdet!="")
           {
           output+=''+parca+'*'+miktar+'-'+tamirat+'\r';
           
           $("#inputParcaİslemler").html(output);
           

           // document.getElementById("inputmalzemelist").disabled = true;
          $("#inputMiktar").val("");
          
          $("#inputMalzemead").val("");
          }
          event.preventDefault();
            
            });

        });
    </script>
</body>
</html>
