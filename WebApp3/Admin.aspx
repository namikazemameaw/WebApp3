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
    <link href="~/Styles/Style.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
    <form id="form1" runat="server">
        <div class="w3-row">

            <a href="javascript:void(0)" onclick="openCity(event, 'Admin');">
                <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Admin</div>
            </a>
            <a href="javascript:void(0)" onclick="openCity(event, 'Paris');">
                <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Paris</div>
            </a>
            <a href="javascript:void(0)" onclick="openCity(event, 'Tokyo');">
                <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Tokyo</div>
            </a>
        </div>
        <div id="Admin" class="w3-container city" >


            <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style="width: auto;">
                <div class="row justify-content-center">

                    <div class=" text-center mb-5">

                        <h2 class="heading-section">This is the admin page</h2>

                        <div class="form-group  ">

                            <asp:TextBox class="form-control" ID="myInput" type="text" placeholder="Search.." runat="server" />

                        </div>
                        <div>
                            Welcome : 
                          <asp:TextBox ID="firstname" type="text" runat="server" class="text" />
                            <asp:TextBox ID="lastname" type="text" runat="server" class="text" />
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center ">
                    <asp:PlaceHolder ID="phTest" runat="server" />
                    <div class=" p-l-55 p-r-55 p-t-65 p-b-54">
                        <asp:GridView ID="Gridview" runat="server" AutoGenerateColumns="false" class="table  ">
                            <Columns>
                                <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" />
                                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Approve" Text="Approve" runat="server" OnClick="approve" CommandArgument='<%#Eval("username")%>' class="button " />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DisApprove" Text="DisApprove" runat="server" OnClick="disapprove" CommandArgument='<%#Eval("username")%>' class="button button3" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <p></p>
                <p></p>
                <div class="social d-flex text-center">
                    <asp:Button ID="Button1" class="btn btn-primary " Text="Home" runat="server" OnClick="home" />
                    <asp:Button ID="Button2" class="btn btn-primary" Text="Logout" runat="server" OnClick="logout" />
                    <%-- <asp:Button ID="Button2" class="btn btn-primary" Text="Register" runat="server" OnClick="registration" />--%>
                </div>
            </div>
        </div>
        <div id="Paris" class="w3-container city" style="display:none">
    <h2>Paris</h2>
    <p>Paris is the capital of France.</p> 
  </div>

  <div id="Tokyo" class="w3-container city" style="display:none">
    <h2>Tokyo</h2>
    <p>Tokyo is the capital of Japan.</p>
  </div>

    </form>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
        <script>
            function openCity(evt, cityName) {
                console.log(evt);
                console.log(cityName);
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
    <script>
        $(document).ready(function () {
            document.getElementById("London").style.display = "block";

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
