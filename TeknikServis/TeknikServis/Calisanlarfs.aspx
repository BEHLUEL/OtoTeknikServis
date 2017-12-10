<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calisanlarfs.aspx.cs" Inherits="TeknikServis.Calisanlarfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Çalışanlar</title>
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

<div class="modal fade" id="calisanmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
            <form action="#" method="POST" role="form" id="guncelleform">
                <input type="text" name="id" id="inputId" class="form-control" value="" required="required" title="">
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <label for="" >Ad</label>
                        <input type="text" name="guncellead" id="inputAd" class="form-control" value="" required="required" title="">
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <label for="">Soyad</label>
                        <input type="text" name="guncellesoyad" id="inputSoyad" class="form-control" value="" required="required" title="">
                    </div>
                </div>
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label for="">Tc Kimlik No</label>
                        <input type="text" name="guncelletc" id="inputGuncelletc" class="form-control" value="" required="required" title="">
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label for="">Telefon</label>
                        <input type="text" name="guncelletel" id="inputguncelletel" class="form-control" value="" required="required" title="">
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <label for="">E-mail</label>
                        <input type="text" name="guncelleemail" id="inputEmail" class="form-control" value="" required="required" title="">
                    </div>
                   
                </div>
                 <div class="row" style="margin-top:20px">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <label for="">Adres</label>
                            <textarea name="guncelleadres" id="inputGuncelleadres" class="form-control" rows="4" required="required"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Iptal</button>
                <button type="button" class="btn btn-primary" id="btnguncelle">Kaydet</button>
            </div>
        </div>
    </div>
</div>
    <div id="master"></div>
    <div class="container-fluid">
    

   <div class="jumbotron">
       <div class="container">
       <div class="row">
           <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
          <h2>Çalışanlar</h2>
               
           </div>
           <a class="btn btn-success" href="CalisanEkle.aspx" style="margin-top:20px" role="button">Yeni Calisan</a>
           
       </div>
    
    		<table class="table table-hover" style="margin-top:20px">
    			<thead>
    				<tr>
    					<th>Sira</th>
    					<th>Ad</th>
    					<th>Soyad</th>
    					<th>Calisma Alani</th>   					
    					<th>Statu</th>
    					<th>TC Kimlik No</th>
    					<th>Telefon</th>
                        <th>E-mail</th>
                        <th>Adres</th>

    				</tr>
    			</thead>
    			<tbody id="calisanlar" style="background:rgb(190,190,190)">
    				
    			</tbody>
    		</table>
    	
    
    </div>
   </div>
    	</div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");
            $.post("service.ashx?islem=getCalisan", function (data) {
                    var obj = $.parseJSON(data);
          
                    var output = ''
                    var sayac = 0;
           if(obj.basarili){
               $.each(obj.data, function (index, val) {
                   sayac++;
                
                output += "<tr>";
                output += '<td><a href="javascript:void(0); #calisanmodal" class="datacalisan" data-toggle="modal" rel="' + obj.data[index].CalisanId + '"><b>' + sayac + '</b></a></td>';
                output += "<td>" + obj.data[index].Ad + "</td>";
                output += "<td>" + obj.data[index].Soyad + "</td>";
                output += "<td>" + obj.data[index].CalismaAlani + "</td>";
                output += "<td>" + obj.data[index].Statu+"</td>";    
                output += "<td>" + obj.data[index].TCKimlikNo + "</td>";
                output += "<td>" + obj.data[index].Tel + "</td>";
                output += "<td>" + obj.data[index].Email + "</td>";
                output += "<td>" + obj.data[index].Adres + "</td>";
                output += '<td><a href="javascript:void(0);"class="datacalisan1" rel="'+obj.data[index].CalisanId+'" ><b>Sil</b></a></td>';
                output +='</tr>';

               
                
                    

              });
                $(output).appendTo("#calisanlar");

           }
           else{
            alertify.error(obj.mesaj);
           }
           });
                        $(document).on('click', '.datacalisan1', function (event) {
                        
                        var id = $(this).attr("rel");




                        $.post("service.ashx?islem=calisanSil", { id: id }, function (data) {

                            var obj = $.parseJSON(data);
                            if (obj.basarili) {
                                alertify.success("Çalışan Silindi");
                                
                                // $(modal1).Show();
                            }
                            else {
                                alertify.error(obj.mesaj);
                            };



                        });
                    });
            
             $(document).on('click', '.datacalisan', function (event) {
                        
                        var id = $(this).attr("rel");




                        $.post("service.ashx?islem=getCalisanId", { id: id }, function (data) {

                            var obj = $.parseJSON(data);
                            if (obj.basarili) {

                                $.each(obj.data, function (index, val) {
                                    $("#inputId").val(obj.data[index].CalisanId);
                                    $("#inputAd").val(obj.data[index].Ad);
                                    $("#inputSoyad").val(obj.data[index].Soyad);
                                    $("#inputGuncelletc").val(obj.data[index].TCKimlikNo);
                                    $("#inputguncelletel").val(obj.data[index].Tel);
                                    $("#inputEmail").val(obj.data[index].Email);
                                    $("#inputGuncelleadres").val(obj.data[index].Adres);
                                    



                                });
                                // $(modal1).Show();
                            }
                            else {
                                alertify.error(obj.mesaj);
                            };



                        });
                    });

            $("#btnguncelle").click(function () {
                outputparca='';
                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=calisanGuncelle", $("#guncelleform").serialize(), function (data) {
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
