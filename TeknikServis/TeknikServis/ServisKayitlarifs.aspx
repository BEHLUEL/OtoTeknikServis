<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServisKayitlarifs.aspx.cs" Inherits="TeknikServis.ServisKayitlarifs" %>

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
<body style="background:rgb(60,30,30)"><div id="master"></div>
    <form id="form1" runat="server">
    <div class="container-fluid">
    <div class="jumbotron">
        <div class="container">
            
        
        <form action="" method="POST" role="form" id="kayitlarForm">
            <div class="row">
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    
                </div>
            
        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Plaka</th>
                        <th>İlgilenen</th>
                        <th>Standart Bakım</th>
                        <th>Araç KM</th>
                        <th>Fiyat</th>
                        <th>Tarih</th>
                        
                    </tr>
                </thead>
                <tbody id="kayitlar">
                    
                </tbody>
            </table>
        </div>
            
            </div>
            </form>
</div>
    </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#master").load("masterOzel.aspx");

            $.post("service.ashx?islem=servisKayitGoster", function (data) {
                var obj = $.parseJSON(data);
                var output = ''
                if (obj.basarili) {
                    $.each(obj.data, function (index, val) {


                        output += "<tr>";
                        output += '<td><a href="javascript:void(0);" class="editdataKullanici" data-toggle="" rel="' + obj.data[index].KayitId + '"><b>' + obj.data[index].KayitId + '</b></a></td>';
                        output += "<td>" + obj.data[index].Plaka + "</td>";
                        output += "<td>" + obj.data[index].StandartBakim + "</td>";
                        output += "<td>" + obj.data[index].AracKm + "</td>";
                        output += "<td>" + obj.data[index].Fiyat + "</td>";
                        output += "<td>" + obj.data[index].Tarih + "</td>";
                        output += '</tr>';





                    });
                    $(output).appendTo("#kayitlar");

                }
                else {
                    alertify.error(obj.mesaj);
                };



            });

            event.preventDefault();
        });
    </script>
</body>
</html>
