<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Araclarfo.aspx.cs" Inherits="TeknikServis.Araclar" %>

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
           <div id="master">

           </div>


    <div class="row" style="margin-top:30px">
    	<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
    	</div>
    	<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
    		
    		<a href="https://www.google.com"><button type="button" class="btn btn-warning">Yeni Arac</button></a>
    	</div>
    </div>
    <div class="row">
    	<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
    		
    	</div>
    	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="rgb(90,90,90); margin-top:20px;">
    		<table class="table table-hover">
    			<thead>
    				<tr style="color:white">
    					<th>Plaka</th>
    					<th>Marka</th>
    					<th>Model</th>
    					<th>Model Yili</th>   					
    					<th>Arac Sahibi</th>
    					<th>Sasi No</th>
    					<th>Plaka</th>

    				</tr>
    			</thead>
    			<tbody id="arabalar" style="background:rgb(190,190,190)">
    				
    			</tbody>
    		</table>
    	</div>
    </div>
    	
    </body>
    <script>
        $(document).ready(function () {
            $("#master").load("masterOffice.aspx");
    			   $.post("service.ashx?islem=getAraba", function (data) {
    			   	var obj = $.parseJSON(data);
          
          var output=''
           if(obj.basarili){
               $.each(obj.data, function (index, val) {
    
                
                output += "<tr>";
                output += '<td><a href="javascript:void(0);" class="editdataKullanici" data-toggle="" rel="' + obj.data[index].ArabaId+ '"><b>' + obj.data[index].Plaka + '</b></a></td>';
                output += "<td>" + obj.data[index].MarkaAdi + "</td>";
                output += "<td>" + obj.data[index].ModelAdi + "</td>";
                output += "<td>" + obj.data[index].ModelYili + "</td>";
                output += "<td>" + obj.data[index].Ad + " "+ obj.data[index].Soyad +"</td>";    
                output += "<td>" + obj.data[index].SasiNo+ "</td>";            
                output+='</tr>';

               
                
                    

              });
                $(output).appendTo("#arabalar");

           }
           else{
            alertify.error(obj.mesaj);
           }
    			   });
    		});
    	</script>
