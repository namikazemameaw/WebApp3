using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using WebApp3.AppCode;
using static WebApp3.AppCode.RequestModel;
using static WebApp3.AppCode.ResponseModel;

namespace WebApp3
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["counter"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {


                }
            }
        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        
        protected void registerEventMethod(object sender, EventArgs e)
        {
            registerUser();
            Response.Redirect("Default.aspx");
        }
        private void registerUser()
        {
            API api = new API();
            RequestModel.RegistationRequestModel registationRequestModel = new RequestModel.RegistationRequestModel();

            registationRequestModel.firstname = firstnameTextBox.Text;
            registationRequestModel.middlename = middlenameTextBox.Text;
            registationRequestModel.lastname = lastnameTextBox.Text;
            registationRequestModel.email = emailTextBox.Text;
            registationRequestModel.email = emailTextBox.Text;
            registationRequestModel.phonenumber = phonenumberTextBox.Text;
            registationRequestModel.username = usernameTextBox.Text;
            registationRequestModel.password = passwordTextBox.Text;

            var account = JsonConvert.DeserializeObject<ResponseModel.StatusResponseModel>(api.apiRegistation(registationRequestModel));

            if (account.status == "true")
            {
                string message = "Success";
                MessageBox.Show(message);

                Response.Redirect("Registration.aspx");

            }

            else if (account.status == "duplicate")
            {
                string message = "Duplicate Username";
                MessageBox.Show(message);

                Response.Redirect("Registration.aspx");
            }
            else
            {
                string message = "Invalid Data";
                MessageBox.Show(message);

                Response.Redirect("Registration.aspx");

            }

            //string connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
            //conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            //conn.Open();
            //queryStr = "";

            //queryStr = "INSERT INTO webappdemo.userregistration (firstname, middlename, lastname, email, phonenumber, username, password)" +
            //    "VALUES('" + firstnameTextBox.Text + "','" + middlenameTextBox.Text + "','" + lastnameTextBox.Text + "','" +
            //    emailTextBox.Text + "','" + phonenumberTextBox.Text + "','" + usernameTextBox.Text + "','" + passwordTextBox.Text + "')";

            //cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);

            //cmd.ExecuteReader();

            //conn.Close();
        } 
    }
}