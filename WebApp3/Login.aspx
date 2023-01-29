<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link href="~/Styles/Style.css" rel="stylesheet" type="text/css" />
   <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">



</head>
<body>
    <form id="form1" runat="server">
        <div class="w3-container">
  <h2>Tabs in a Grid</h2>

  <div class="w3-row">
    <a href="javascript:void(0)" onclick="openCity(event, 'London');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">London</div>
    </a>
    <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Paris</div>
    </a>
   <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Tokyo</div>
    </a>
  </div>

  <div id="London" class="w3-container city" style="display:none">
    <h2>London</h2>
    <p>London is the capital city of England.</p>
  </div>

  <div id="Paris" class="w3-container city" style="display:none">
    <h2>Paris</h2>
    <p>Paris is the capital of France.</p> 
  </div>

  <div id="Tokyo" class="w3-container city" style="display:none">
    <h2>Tokyo</h2>
    <p>Tokyo is the capital of Japan.</p>
  </div>
</div>

    </form>

  <script>
      function openCity(evt, cityName) {
          var i, x, tablinks;
          x = document.getElementsByClassName("city");
          for (i = 0; i < x.length; i++) {
              x[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablink");
          for (i = 0; i < x.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" w3-border-red", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.firstElementChild.className += " w3-border-red";
      }
</script>

</body>
</html>
