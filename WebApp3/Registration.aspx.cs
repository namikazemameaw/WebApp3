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

namespace WebApp3
{
    public partial class Registration : System.Web.UI.Page
    {

        public class RequstModel
        {
            public string firstname { get; set; }
            public string middlename { get; set; }
            public string lastname { get; set; }
            public string email { get; set; }
            public string phonenumber { get; set; }
            public string username { get; set; }
            public string password { get; set; }
        }
        public class ResponseModel
        {
            public bool status { get; set; }
        }
        //MySql.Data.MySqlClient.MySqlConnection conn;
        //MySql.Data.MySqlClient.MySqlCommand cmd;
        //string queryStr;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["counter"] == null)
            {
                Response.Redirect("Default.aspx");

            }
            else
            {


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
            RequstModel requst = new RequstModel();
            requst.firstname = firstnameTextBox.Text;
            requst.middlename = middlenameTextBox.Text;
            requst.lastname = lastnameTextBox.Text;
            requst.email = emailTextBox.Text;
            requst.email = emailTextBox.Text;
            requst.phonenumber = phonenumberTextBox.Text;
            requst.username = usernameTextBox.Text;
            requst.password = passwordTextBox.Text;

            HttpClient httpClient = new HttpClient();
            string json = JsonConvert.SerializeObject(requst);
            var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = httpClient.PostAsync("https://localhost:44350/api/WebApp3", byteContent);
            var respons2 = response.Result;
            string responsestr = response.Result.Content.ReadAsStringAsync().Result;

            var account = JsonConvert.DeserializeObject<ResponseModel>(responsestr);

            if (account.status == true)
            {
                string message = "Success";
                MessageBox.Show(message);
                Session["counter"] = "1";
                Response.Redirect("Registration.aspx");

            }
            
            else 
            {
                string message = "Duplicate Username";
                MessageBox.Show(message);
                Session["counter"] = "1";
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