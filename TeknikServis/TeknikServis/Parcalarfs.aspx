<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parcalarfs.aspx.cs" Inherits="TeknikServis.Parcalarfs" %>

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


<div class="modal fade" id="parcaguncelle">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Parca Guncelle</h4>
            </div>
            <div class="modal-body">
            
            <form action="#" method="POST" role="form" id="guncelleform">
                
        

            <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <label for="id"></label>
                   <input type="text" name="id" id="inputId" class="form-control" value="" required="required" title="">                           
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <label for="parca">Parca</label>
                    <input type="text" name="parca" id="inputParca" class="form-control" value="" required="required"title="">
                
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <label for="degisim">Degisim Ucreti</label>
                    <input type="text" name="degisimUcret" id="inputDegisimUcret" class="form-control" value="" required="required" title="">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <label for="onarim">Onarim Ucreti</label>
                    <input type="text" name="onarim" id="inputOnarim" class="form-control" value="" required="required" title="">
                </div>
            </div>
            </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                <button type="button" class="btn btn-primary" id="btnguncelle">Guncelle</button>
            </div>
        </div>
    </div>
</div>
    <div id="master"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                
            </div>
            
                    
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="jumbotron">
                <div class="container">
                <div class="row">
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <h2 style="margin-bottom:50px">Parçalar</h2>
                    </div>
                    <%--<button type="button" id="btnEkle" style="margin-top:17px" class="btn btn-success">Ekle</button>--%>
                </div>
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Sira</th>
                            <th>Parca</th>
                            
                            <th>Adet</th>
                            <th>Degisim Ucreti</th>
                            <th>Onarim Ucreti</th>
                            
                        </tr>
                    </thead>
                    <tbody id="parca">
                        
                    </tbody>
                </table>
            </div>
                </div>
            </div>
            
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");
            $.post("service.ashx?islem=getParca", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #parcaguncelle" class="dataParca" data-toggle="modal" rel="' + obj.data[index].ParcaId + '"><b>' + sayac + '</b></a></td>';
                        


                        output += '<td>' + obj.data[index].ParcaAdi +'('+obj.data[index].ParcaId+')</td>';
                        output += "<td>" + obj.data[index].Adet + "</td>";                        
                        output += "<td>" + obj.data[index].ParcaFiyat + "</td>";
                        output += "<td>" + obj.data[index].TamirUcreti + "</td>";

                        

                        output += '</tr>';





                    });
                    $(output).appendTo("#parca");

                }
                else {
                    alert(obj.mesaj);
                };

            });
            
            $(document).on('click', '.dataParca', function (event) {

                var id = $(this).attr("rel");




                $.post("service.ashx?islem=getParcaBilgi", { id: id }, function (data) {

                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            $("#inputId").val(obj.data[index].ParcaId);
                            $("#inputParca").val(obj.data[index].ParcaAdi);
                            $("#inputDegisimUcret").val(obj.data[index].ParcaFiyat);
                            $("#inputOnarim").val(obj.data[index].TamirUcreti);



                        });
                        // $(modal1).Show();
                    }
                    else {
                        alertify.error(obj.mesaj);
                    };



                });

                $("#btnguncelle").click(function(data) {
                $.post("service.ashx?islem=parcaGuncelle", $("#guncelleform").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if(obj.basarili){
                        alertify.success(obj.mesaj);
                    }
                    else
                        alertify.error(obj.mesaj);
                });
             event.preventDefault();

             });


                event.preventDefault();
                /* Act on the event */
            });


        });
    </script>
</body>

</html>
