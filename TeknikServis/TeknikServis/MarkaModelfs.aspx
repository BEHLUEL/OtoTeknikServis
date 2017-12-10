<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarkaModelfs.aspx.cs" Inherits="TeknikServis.MarkaModelfs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marka ve Modeller</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                
            </div>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <div class="jumbotron">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            
                                            <th>Sira</th>
                                            <th>Model</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="modeller">
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <form action="#" id="ekleform" method="POST" role="form">
                                
                                <label for="">Model Ekle</label>
                                <input type="text" name="model" id="inputModel" class="form-control" value="" required="required"title="">
                                
                            
                                <button type="submit" style="margin-top:20px" class="btn btn-success">Ekle</button>
                            </form>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {

            $("#master").load("masterOzel.aspx");

            $.post("service.ashx?islem=getModel", function (data) {
                var obj = $.parseJSON(data);
                var sayac = 0;
                var output = ''
                if (obj.basarili) {

                    $.each(obj.data, function (index, val) {
                        sayac++;

                        output += "<tr>";
                        output += '<td><a href="javascript:void(0); #parcalar" class="dataParcaAlim" data-toggle="modal" rel="' + obj.data[index].ModelId + '"><b>' + sayac + '</b></a></td>';


                        output += '<td>' + obj.data[index].ModelAdi + '</td>';
                        


                        output += '</tr>';





                    });
                    $(output).appendTo("#modeller");

                }
                else {
                    alert(obj.mesaj);
                };

            });
            $("#ekleform").submit(function (event) {

                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=modelEkle", $("#ekleform").serialize(), function (data) {
                    
                    
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
        });
    </script>
</body>
</html>
