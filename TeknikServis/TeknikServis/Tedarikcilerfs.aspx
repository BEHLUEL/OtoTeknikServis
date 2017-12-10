<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tedarikcilerfs.aspx.cs" Inherits="TeknikServis.Tedarikcilerfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tedarikçiler</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

<div class="modal fade" id="guncelleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Guncelleme Ekrani</h4>
            </div>
            <div class="modal-body">
            <form action="#" method="POST" id="guncelleform" role="form">
               
            
            <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <input type="text" name="guncelleid" id="guncelleid" class="form-control" value="" required="required" title="">
                    
                </div>
            </div>
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                        <label for="">Tedarikci</label>
                        <input type="text" name="guncelleTedarikci" id="inputGuncelleTedarikci" class="form-control" value="" required="required"title="">
                    </div>
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <label for="">E-mail</label>
                        <input type="text" name="guncelleEmail" id="inputGuncelleEmail" class="form-control" value="" required="required" title="">
                    </div>
                </div>
                <div class="row" style="margin-top:20px">
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <label for="">Telefon</label>
                        <input type="text" name="guncelletel" id="inputGuncelletel" class="form-control" value="" required="required" title="">                   
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        
                    </div>
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <label for="">Fax</label>
                        <input type="text" name="guncellefax" id="inputGuncellefax" class="form-control" value="" required="required" title="">
                    </div>
                </div>
                <div class="row" style="margin-top:20px;margin-bottom:20px">
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                        <label for="">Adres</label>
                        <textarea name="guncelleadres" id="inputGuncelleadres" class="form-control" rows="3" required="required"></textarea>
                    </div>
                   
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Iptal</button>
                <button type="button" class="btn btn-primary" id="btnkaydet">Kaydet</button>
            </div>
        </div>
    </div>
</div>
   <div id="master"></div>
   <div class="row">
       <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
           
       </div>
       <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
           <div class="jumbotron">
        <div class="container">
            <h2 style="margin-bottom:50px">Tedarikciler</h2>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Sira</th>
                        <th>Tedarikci No</th>
                        <th>Tedarikci</th>
                        <th>Telefon</th>
                        <th>Fax</th>
                        <th>Adres</th>
                        <th>E-mail</th>

                    </tr>
                </thead>
                <tbody id="tedarikciler">
                    
                </tbody>
            </table>

        </div>
    </div>
       </div>
   </div>
    
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");

             $.post("service.ashx?islem=getTedarikci", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #guncelleModal" class="editdataKullanici" data-toggle="modal" rel="' + obj.data[index].TedarikciId + '"><b>' + sayac + '</b></a></td>';


                        output += '<td>' + obj.data[index].TedarikciId + '</td>';
                        output += "<td>" + obj.data[index].TedarikciAdi + "</td>";
                        output += "<td>" + obj.data[index].Tel + "</td>";
                        output += "<td>" + obj.data[index].Fax + "</td>";
                        output += "<td>" + obj.data[index].Adres + "</td>";
                        output += "<td>" + obj.data[index].Email + "</td>";

                        output += '<td><a href="javascript:void(0);"class="editdataKullaniciId" rel="' + obj.data[index].TedarikciId + '" ><b>Sil</b></a></td>';

                        output += '</tr>';





                    });
                    $(output).appendTo("#tedarikciler");

                }
                else {
                    alert(obj.mesaj);
                };



            });
            $(document).on('click', '.editdataKullanici', function (event) {

                var id = $(this).attr("rel");




                $.post("service.ashx?islem=tedarikciBilgi", { id: id }, function (data) {

                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            $("#guncelleid").val(obj.data[index].TedarikciId);
                            $("#inputGuncelleTedarikci").val(obj.data[index].TedarikciAdi);
                            $("#inputGuncelleEmail").val(obj.data[index].Email);
                            $("#inputGuncelletel").val(obj.data[index].Tel);
                            $("#inputGuncellefax").val(obj.data[index].Fax);
                            $("#inputGuncelleadres").val(obj.data[index].Adres);
                            //$("#inputGuncelleAdres").val(obj.data[index].Adres);


                        });
                        // $(modal1).Show();
                    }
                    else {
                        alertify.error(obj.mesaj);
                    };



                });

                event.preventDefault();
                /* Act on the event */
            });
            
            $(document).on('click', '.editdataKullaniciId', function (event) {
                var id1 = $(this).attr("rel");
                $.post("service.ashx?islem=tedarikciSil", { id: id1 }, function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        alertify.success("silindi");



                    } else {
                        alertify.error("silinemedi");
                    }
                });
                event.preventDefault();
            });

            $("#btnkaydet").click(function () {
                outputparca='';
                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=tedarikciGuncelle", $("#guncelleform").serialize(), function (data) {
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
