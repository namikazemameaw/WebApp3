<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link href="~/Styles/Style.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">

    <section class="ftco-section">
        <div class="container">
            <div class="wrap-login100 p-l-55 p-r-55 p-t-6usernameTextBox5 p-b-54">
                <div class="row justify-content-center">

                    <div class=" text-center mb-5">
                        <h2 class="heading-section">This is the home page</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <%-- <div class="col-md-6 col-lg-4">--%>
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Have an account?</h3>


                        <form id="form1" runat="server" class="signin-form">


                            <div class="form-group  ">

                                <asp:TextBox ID="usernameTextBox" placeholder="Username" runat="server" class="form-control" />


                            </div>
                            <div class="form-group">

                                <asp:TextBox ID="passwordTextBox" placeholder="Password" TextMode="Password" runat="server" class="form-control" />

                            </div>
                            <div class="alert alert-danger" id ="popuperror" runat="server">
                                <strong>Danger!</strong> ใส่ username หรือ password.
                            </div>
                            <div class="form-group">
                                <p></p>
                                <asp:Button class="login100-form-btn btn btn-primary submit px-3" ID="submitButton" Text="Log in" runat="server" OnClick="submit" />
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-50">

                                    <label class="checkbox-wrap checkbox-primary">
                                        Remember Me
									 
                                        <input type="checkbox" checked />
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <div class="w-50 text-md-right">
                                    <a href="#" style="color: #fff">Forgot Password</a>
                                </div>
                            </div>
                            <div class="social d-flex text-center">
                                <asp:Button ID="Button1" class="btn btn-primary " Text="Home" runat="server" OnClick="home" />
                                <asp:Button ID="Button2" class="btn btn-primary" Text="Register" runat="server" OnClick="registration" />

                            </div>

                        </form>

                    </div>
                    <%-- </div>--%>
                </div>
            </div>
        </div>
        <%--    <a href="#">Home</a> | <a href="Registration.aspx">Registration</a> |  <a href="Admin.aspx">Admin</a>--%>



        <!-- 
        username : webuser
        password : webuser2014
        -->


    </section>


</body>
</html>
