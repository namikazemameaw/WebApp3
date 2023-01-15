<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApp3.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>



<style>
    .ftco-section {
  padding: 7em 0; }
    .container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto; }
  @media (min-width: 576px) {
    .container {
      max-width: 540px; } }
  @media (min-width: 768px) {
    .container {
      max-width: 720px; } }
  @media (min-width: 992px) {
    .container {
      max-width: 960px; } }
  @media (min-width: 1200px) {
    .container {
      max-width: 1140px; } }
  .justify-content-center {
  -webkit-box-pack: center !important;
  -ms-flex-pack: center !important;
  justify-content: center !important; }
      .row {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -15px;
  margin-left: -15px; }
      .heading-section{
	font-size: 28px;
	color: $white;}
      .col-md-6 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 50%;
    flex: 0 0 50%;
    max-width: 50%; }
      .col-lg-4 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 33.33333%;
    flex: 0 0 33.33333%;
    max-width: 33.33333%; }
      .login-wrap {
  position: relative;
  color: rgba(255, 255, 255, 0.9); }
  .login-wrap h3 {
    font-weight: 300;
    color: #fff; }
  .login-wrap .social {
    width: 100%; }
    .login-wrap .social a {
      width: 100%;
      display: block;
      border: 1px solid rgba(255, 255, 255, 0.4);
      color: #000;
      background: #fff; }
      .login-wrap .social a:hover {
        background: #000;
        color: #fff;
        border-color: #000; }

    .p-0 {
  padding: 0 !important; }
    .form-group {
  position: relative; }
    .form-control{
	background: transparent;
	border: none;
	height: 50px;
	/*color: rgba(255,255,255,1) !important;*/
	border: 1px solid transparent;
	background: rgba(255,255,255,.08);
	border-radius: 40px;
	padding-left: 20px;
	padding-right: 20px;
	@include transition(.3s);
	&::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	  color: rgba(255,255,255,.8) !important;
	}
	&::-moz-placeholder { /* Firefox 19+ */
	  color: rgba(255,255,255,.8) !important;
	}
	&:-ms-input-placeholder { /* IE 10+ */
	  color: rgba(255,255,255,.8) !important;
	}
	&:-moz-placeholder { /* Firefox 18- */
	  color: rgba(255,255,255,.8) !important;
	}
	&:hover, &:focus{
		background: transparent;
		outline: none;
		box-shadow: none;
		border-color: rgba(255,255,255,.4);
	}
	&:focus{
		border-color: rgba(255,255,255,.4);
	}
}
     .d-md-flex {
    display: -webkit-box !important;
    display: -ms-flexbox !important;
    display: flex !important; }
   /*  .w-50 {
  width: 50% !important; }*/
     .checkbox-wrap {
  display: block;
  position: relative;
  padding-left: 100px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 13px;
  font-weight: 500;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none; }
     .checkbox-primary {
  color: #fbceb5; }
     .checkmark {
  position: absolute;
  top: 0;
  left: 0; }
     .d-md-flex {
    display: -webkit-box !important;
    display: -ms-flexbox !important;
    display: flex !important; }
     .wrap-login100 {
         margin: auto;
    width: 1250px;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
}
      .wrap-login101 {
         margin: auto;

    background: #fff;
    border-radius: 10px;
    overflow: hidden;
}
.p-r-55 {
    padding-right: 55px;
}
.p-l-55 {
    padding-left: 55px;
}
.p-t-65 {
    padding-top: 65px;
}
.p-b-54 {
    padding-bottom: 54px;
}
.login100-form-btn {
    font-family: Poppins-Medium;
    font-size: 16px;
    color: #fff;
    line-height: 1.2;
    text-transform: uppercase;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 20px;
    width: 100%;
    height: 50px;
}
button {
    outline: none!important;
    border: none;
    background: 0 0;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 1px 1px;
  cursor: pointer;
}
.button3 {background-color: #f44336;} /* Red */
    .text {border:0px;
    }
    </style>

</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);" >
    <form id="form1" runat="server">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
             <div class="row justify-content-center">
                
                <div class=" text-center mb-5">
                     
					<h2 class="heading-section">This is the admin page</h2>
                   
                        <div class="form-group  ">

             <asp:TextBox class="form-control" ID ="myInput" type="text" placeholder="Search.."  runat="server" />

            </div>
                      <div>
                          Welcome : 
                          <asp:TextBox ID ="firstname" type="text"  runat="server"  class="text" />
                          <asp:TextBox  ID ="lastname" type="text"  runat="server"  class="text"/>
                      </div> 
				</div>
                </div>
               <div class="row justify-content-center " >
             <asp:PlaceHolder ID="phTest" runat="server" />
                   <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <asp:GridView ID ="Gridview" runat="server" AutoGenerateColumns="false"  class="table  " >
                <Columns  >
                    <asp:BoundField  DataField="No" HeaderText="No" SortExpression="No" />
                    <asp:BoundField DataField="Firstname" HeaderText="Firstname"  SortExpression="Firstname"/>
                        <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname"/>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"/>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"/>
                    <asp:TemplateField>
                        <ItemTemplate> 
                             <asp:LinkButton ID="Approve" Text="Approve" runat="server"  OnClick="approve" CommandArgument='<%#Eval("username")%>'   class="button "/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate> 
                             <asp:LinkButton ID="DisApprove" Text="DisApprove" runat="server"  OnClick="disapprove" CommandArgument='<%#Eval("username")%>' class="button button3"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                                   </div>
                   </div>
              <p></p>
             <p></p>
               <div class="social d-flex text-center">
            <asp:Button  ID="Button1" class="btn btn-primary " Text="Home" runat="server" OnClick="home" />
             <asp:Button ID="Button2" class="btn btn-primary" Text="Logout" runat="server" OnClick="logout" />
           <%-- <asp:Button ID="Button2" class="btn btn-primary" Text="Register" runat="server" OnClick="registration" />--%>

                      </div>
        </div>
    </form>

     <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

        <script>
            $(document).ready(function(){
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#Gridview tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
});
        </script>
</body>
</html>
