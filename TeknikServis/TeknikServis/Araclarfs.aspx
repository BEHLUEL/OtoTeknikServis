<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Araclarfs.aspx.cs" Inherits="TeknikServis.Araclarfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Arabalar</title>
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
        
    
    
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
            
        </div>
        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            <div class="jumbotron">
        <div class="container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Plaka</th>
                        <th>Marka</th>
                        <th>Model</th>
                        <th>Model Yili</th>                     
                        <th>Arac Sahibi</th>
                        <th>Sasi No</th>
                        

                    </tr>
                </thead>
                <tbody id="arabalar">
                    
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
            $.post("service.ashx?islem=getAraba", function (data) {
                var obj = $.parseJSON(data);

                var output = ''
                if (obj.basarili) {
                    $.each(obj.data, function (index, val) {


                        output += "<tr>";
                        output += '<td><a href="javascript:void(0);" class="editdataKullanici" data-toggle="" rel="' + obj.data[index].ArabaId + '"><b>' + obj.data[index].Plaka + '</b></a></td>';
                        output += "<td>" + obj.data[index].MarkaAdi + "</td>";
                        output += "<td>" + obj.data[index].ModelAdi + "</td>";
                        output += "<td>" + obj.data[index].ModelYili + "</td>";
                        output += "<td>" + obj.data[index].Ad + " " + obj.data[index].Soyad + "</td>";
                        output += "<td>" + obj.data[index].SasiNo + "</td>";
                        output += '</tr>';





                    });
                    $(output).appendTo("#arabalar");

                }
                else {
                    alertify.error(obj.mesaj);
                }
            });
            event.preventDefault();
        });
    </script>
</body>
</html>
