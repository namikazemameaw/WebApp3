<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApp3.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
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

    <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
    
    <%--<a href="Default.aspx">Home</a> | <a href="#">Registration</a> |  <a href="Admin.aspx">Admin</a>--%>
    <form id="form1" runat="server">

     <%-- <asp:Button  ID="Button1" Text="HOME" runat="server" OnClick="home" />
            <asp:Button ID="Button2" Text="REGISTRATION" runat="server" OnClick="registration" />--%>

         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                <div class="row justify-content-center">
                
                <div class=" text-center mb-5">
					<h2 class="heading-section">This is the registration page</h2>
				</div>
                </div>
 <p></p>

      First name : <asp:TextBox ID="firstnameTextBox" Text="" placeholder="Enter first name"    runat="server" class="form-control"/>
           
           
            
            Middle name :<asp:TextBox ID="middlenameTextBox" Text="" placeholder="Enter middle name"    runat="server" class="form-control" runat="server" />
              
            Last name : <asp:TextBox ID="lastnameTextBox" Text="" placeholder="Enter last name"    runat="server" class="form-control" />
              
            Email :<asp:TextBox ID="emailTextBox" Text="" placeholder="Enter Email"    runat="server" class="form-control" />
             
            Phone Number :<asp:TextBox ID="phonenumberTextBox" Text="" placeholder="Enter Phone Number"    runat="server" class="form-control" />
            Enter Username :<asp:TextBox ID="usernameTextBox" Text="" placeholder="Enter Username"    runat="server" class="form-control" />
            Enter Password : <asp:TextBox ID="passwordTextBox" Text="" placeholder="Enter Password"    runat="server" class="form-control" />
              <p></p>
            <p></p>
            <asp:Button  class="login100-form-btn btn btn-primary submit px-3" ID="registerButton" Text="REGISTER" runat="server" OnClick="registerEventMethod" />
             <p></p>
             <p></p>
              <div class="social d-flex text-center">
              <asp:Button  ID="Button1" class="btn btn-primary " Text="Home" runat="server" OnClick="home" />
          
                  </div>
        </div>


        
    </form>

     
</body>
</html>
