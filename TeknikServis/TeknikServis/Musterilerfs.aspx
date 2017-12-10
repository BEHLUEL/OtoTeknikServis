<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Musterilerfs.aspx.cs" Inherits="TeknikServis.Musterilerfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Müşteriler</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
        
    
        <div class="row">
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="jumbotron">
                    <div class="container">
                    <h2 style="margin-bottom:50px">Müşteriler</h2>
                    <div class="row">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            
                        </div>
                        
                            
                            <form action="#" method="POST" role="form" id="araForm">
                                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                            <label for="tel">Telefon</label>
                                <input type="text" name="araTel" id="inputTel" class="form-control" value="" required="required"title="">
                                </div>
                            
                                <button type="submit"style="margin-left:20px;margin-top:24px" class="btn btn-primary" id="btnAra">Ara</button>
                            </form>
                                
                            
                            
                    </div>
                        <table class="table table-hover" style="margin-top:20px">
                        <thead>
                            <tr>
                                <th>Sıra</th>
                                <th>Ad</th>
                                <th>Soyad</th>
                                <th>Tc Kimlik No</th>
                                <th>Telefon</th>
                                <th>Email</th>
                                <th>Adres</th>


                            </tr>
                        </thead>
                        <tbody id="musteriler">
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
            $.post("service.ashx?islem=getMusteri", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #guncelleModal" class="editdataKullanici" data-toggle="modal" rel="' + obj.data[index].MusteriId + '"><b>' + sayac + '</b></a></td>';


                        output += '<td>' + obj.data[index].Ad + '</td>';
                        output += "<td>" + obj.data[index].Soyad + "</td>";
                        output += "<td>" + obj.data[index].TcKimlikNo + "</td>";
                        output += "<td>" + obj.data[index].Telefon + "</td>";
                        output += "<td>" + obj.data[index].Email + "</td>";
                        output += "<td>" + obj.data[index].Adres + "</td>";
                        

                        output += '</tr>';





                    });
                    $(output).appendTo("#musteriler");

                }
                else {
                    alert(obj.mesaj);
                };



            });
             $("#araForm").submit(function (event) {

                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=musteriAra", $("#araForm").serialize(), function (data) {
                    $("tbody").empty();
                    var output = '';
                    var sayac = 0;
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        $("#musteriler").reset;
                        $.each(obj.data, function (index, val) {
                            sayac++;

                            output += "<tr>";
                            output += '<td><a href="javascript:void(0); #guncelleModal" class="editdataKullanici" data-toggle="modal" rel="' + obj.data[index].MusteriId + '"><b>' + sayac + '</b></a></td>';


                            output += '<td>' + obj.data[index].Ad + '</td>';
                            output += "<td>" + obj.data[index].Soyad + "</td>";
                            output += "<td>" + obj.data[index].TcKimlikNo + "</td>";
                            output += "<td>" + obj.data[index].Telefon + "</td>";
                            output += "<td>" + obj.data[index].Email + "</td>";
                            output += "<td>" + obj.data[index].Adres + "</td>";
                            

                            output += '</tr>';





                        });
                        $(output).appendTo("#musteriler");

                        alertify.success(obj.mesaj);




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
