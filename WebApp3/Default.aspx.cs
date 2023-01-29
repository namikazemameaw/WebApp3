using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Windows.Forms;
using System.Configuration;
using System.Collections.Specialized;
using WebApp3.AppCode;
using System.Security.Principal;

namespace WebApp3
{ 
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["counter"] = "LoginPage";
            this.popuperror.Visible = false;
        }
        protected void submit(object sender, EventArgs e)
        {
            if ((usernameTextBox.Text == "") || (passwordTextBox.Text == ""))
            {
                this.popuperror.Visible = true;

            }
            else
            {

                API api = new API();
                RequestModel.LoginRequestModel loginRequestModel = new RequestModel.LoginRequestModel();

                loginRequestModel.username = usernameTextBox.Text;
                loginRequestModel.password = passwordTextBox.Text;

                var account = JsonConvert.DeserializeObject<ResponseModel.LoginResponseModel>(api.apiLogin(loginRequestModel));



                if (account.status == "83856767698383")
                {
                    if (account.approve == "2")
                    {
                        Session["firstname"] = account.firstname;
                        Session["lastname"] = account.lastname;
                        Session["CheckStatus"] = "true";
                        Session["counter"] = "AdminPage";
                        Response.Redirect("Admin.aspx");
                    }
                    else if (account.approve == "1")
                    {
                        Session["firstname"] = account.firstname;
                        Session["lastname"] = account.lastname;
                        Session["CheckStatus"] = "true";
                        Session["counter"] = "PosonPage";
                        Response.Redirect("Login.aspx");
                    }

                }
                else if (account.status == "73788665767368")
                {
                    string message = "Invalid User ID or Password";
                    MessageBox.Show(message);
                }
                else if (account.status == "6982827982")
                {
                    string message = "ERROR !!";
                    MessageBox.Show(message);
                }
            }


            //LoginRequstModel requst = new LoginRequstModel();
            //requst.username = usernameTextBox.Text;
            //requst.password = passwordTextBox.Text;

            //HttpClient httpClient = new HttpClient();
            //string json = JsonConvert.SerializeObject(requst);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            //var byteContent = new ByteArrayContent(buffer);
            //byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            //var response = httpClient.PostAsync("https://localhost:44350/api/Login", byteContent);
            //var respons2 = response.Result;
            //string responsestr = response.Result.Content.ReadAsStringAsync().Result;
            //var account = JsonConvert.DeserializeObject<LoginResponseModel>(responsestr);



            //if (account.status == "83856767698383")
            //{
            //    Session["firstname"] = account.firstname;
            //    Session["lastname"] = account.lastname;
            //    Session["CheckStatus"] = "true";
            //    Session["counter"] = "2";
            //    Response.Redirect("Admin.aspx");




            //}
            //else if (account.status == "73788665767368")
            //{
            //    string message = "Invalid User ID or Password";
            //    MessageBox.Show(message);
            //}
            //else if (account.status == "6982827982")
            //{
            //    string message = "ERROR !!";
            //    MessageBox.Show(message);
            //}


        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void registration(object sender, EventArgs e)
        {
            Session["counter"] = "1";
            Response.Redirect("Registration.aspx");
        }
        

    }
}