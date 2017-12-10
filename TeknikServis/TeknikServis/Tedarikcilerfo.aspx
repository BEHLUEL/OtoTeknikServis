<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tedarikcilerfo.aspx.cs" Inherits="TeknikServis.Tedarikcilerfo" %>

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

<div class="container-fluid">
    

   <div class="jumbotron">
       <div class="container">
          <h2>Tedarikçiler</h2>
       
    
    		<table class="table table-hover" style="margin-top:20px">
    			<thead>
    				<tr>
    					<th>Sira</th>
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
    </body>
    <script>
        $(document).ready(function () {
            $("#master").load("masterOffice.aspx");
    			   $.post("service.ashx?islem=getTedarikci", function (data) {
    			   	var obj = $.parseJSON(data);
          
    			   	var output = ''
    			   	var sayac = 0;
           if(obj.basarili){
               $.each(obj.data, function (index, val) {
                   sayac++;
                
                output += "<tr>";
                output += "<td>" +sayac + "</td>";
                output += "<td>" + obj.data[index].TedarikciAdi + "</td>";
                output += "<td>" + obj.data[index].Tel + "</td>";
                output += "<td>" + obj.data[index].Fax + "</td>";
                output += "<td>" + obj.data[index].Adres+"</td>";    
                output += "<td>" + obj.data[index].Email + "</td>";
               
                output +='</tr>';

               
                
                    

              });
                $(output).appendTo("#tedarikciler");

           }
           else{
            alertify.error(obj.mesaj);
           }
    			   });
    		});
    	</script>
