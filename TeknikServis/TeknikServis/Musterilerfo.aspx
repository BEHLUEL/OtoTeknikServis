<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Musterilerfo.aspx.cs" Inherits="TeknikServis.Musteriler" %>

<html xmlns="http://www.w3.org/1999/xhtml">
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
<body style="background: rgb(30,50,60)">


    <div class="modal fade" id="guncelleModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Güncelleme Ekranı</h4>
                </div>
                <div class="modal-body">
                    <form action="#" method="POST" id="formguncelle" role="form">


                        <div class="row">
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input type="text" name="id" id="id" class="form-control" value="" required="required" title="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label for="guncelleAd">Ad</label>
                                <input type="text" name="guncelleAd" id="inputGuncelleAd" class="form-control" value="" required="required" title="">
                                <label for="guncelleTel" style="margin-top: 20px">Telefon</label>
                                <input type="text" name="guncelleTel" id="inputGuncelleTel" class="form-control" value="" required="required" title="">
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label for="guncelleSoyad">Soyad</label>
                                <input type="text" name="guncelleSoyad" id="inputGuncelleSoyad" class="form-control" value="" required="required" title="">
                                <label for="guncelleEmail" style="margin-top: 20px">E-mail</label>
                                <input type="text" name="guncelleEmail" id="inputGuncelleEmail" class="form-control" value="" required="required" title="">
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label for="guncelleTcKNo">Tc Kimlik No</label>
                                <input type="text" name="guncelleTc" id="inputGuncelleTc" class="form-control" value="" required="required" title="">
                                <label for="guncelleAdres" style="margin-top: 20px">Adres</label>
                                <textarea name="guncelleAdres" id="inputGuncelleAdres" class="form-control" rows="4" required="required"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">İptal</button>
                    <button type="button" id="guncellebtn" class="btn btn-primary">Değişiklikleri kaydet</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div id="master">

        </div>

       
        <div class="jumbotron" style="margin-top: 10px; opacity: 0.9;">
            <div class="container">


                <div class="row">
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    </div>
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">


                        <form action="#" method="POST" role="form" id="araForm">







                            <label for="tel">Telefon</label>
                            <input type="text" name="araTel" id="inputAraTel" class="form-control" value="" required="required" title="">
                            <button type="submit" class="btn btn-primary">Ara</button>

                        </form>



                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    </div>
                    <a href="/MusteriEkle.aspx">
                        <button type="button" id="btnMusteriEkle" class="btn btn-warning">Musteri ekle</button></a>
                </div>

                <div class="container-fluid" style="margin-top: 30px">
                    <table class="table table-hover">
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

    <script>
        $(document).ready(function () {
            $("#master").load("masterOffice.aspx");
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
                        output += '<td><a href="javascript:void(0);"class="editdataKullaniciId" rel="' + obj.data[index].MusteriId + '" ><b>Sil</b></a></td>';

                        output += '</tr>';





                    });
                    $(output).appendTo("#musteriler");

                }
                else {
                    alert(obj.mesaj);
                };



            });


            event.preventDefault();



            $(document).on('click', '.editdataKullaniciId', function (event) {
                var id1 = $(this).attr("rel");
                $.post("service.ashx?islem=musteriSil", { id: id1 }, function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        alertify.success("silindi");



                    } else {
                        alertify.error("silinemedi");
                    }
                });
                event.preventDefault();
            });

            $(document).on('click', '.editdataKullanici', function (event) {

                var id = $(this).attr("rel");




                $.post("service.ashx?islem=musteriBilgi", { id: id }, function (data) {

                    var obj = $.parseJSON(data);
                    if (obj.basarili) {

                        $.each(obj.data, function (index, val) {
                            $("#id").val(obj.data[index].MusteriId);
                            $("#inputGuncelleAd").val(obj.data[index].Ad);
                            $("#inputGuncelleSoyad").val(obj.data[index].Soyad);
                            $("#inputGuncelleTc").val(obj.data[index].TcKimlikNo);
                            $("#inputGuncelleTel").val(obj.data[index].Telefon);
                            $("#inputGuncelleEmail").val(obj.data[index].Email);
                            $("#inputGuncelleAdres").val(obj.data[index].Adres);


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
                            output += '<td><a href="javascript:void(0);"class="editdataKullaniciId" rel="' + obj.data[index].MusteriId + '" ><b>Sil</b></a></td>';

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
            $("#guncellebtn").click(function () {

                //$("#inputmalzemelist").disabled() = false;
                // document.getElementById("inputMalzemead").disabled = true;
                // document.getElementById("inputMiktar").disabled = true;

                $.post("service.ashx?islem=musteriGuncelle", $("#formguncelle").serialize(), function (data) {
                    var obj = $.parseJSON(data);
                    if (obj.basarili) {
                        $(location).attr('href', 'Musteriler.aspx');
                        alertify.success(obj.mesaj);




                    }
                    else {
                        alertify.error(obj.mesaj);
                    }



                });

                event.preventDefault();
            });

        });</script>
</body>
</html>
