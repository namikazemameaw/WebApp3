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

namespace WebApp3
{
    public partial class Default : System.Web.UI.Page
    {
        public class LoginRequstModel
        { 
            public string username { get; set; }
            public string password { get; set; }
        }
        public class LoginResponseModel
        { 
            public string status { get; set; }
            public string firstname { get; set; }
            public string lastname { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["counter"] = "1";
            //Logger.writeLog("Woah, there was  an error");
           
        }

        protected void submit(object sender, EventArgs e)
        {
            LoginRequstModel requst = new LoginRequstModel();
            requst.username = usernameTextBox.Text;
            requst.password = passwordTextBox.Text;

            HttpClient httpClient = new HttpClient();
            string json = JsonConvert.SerializeObject(requst);
            var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = httpClient.PostAsync("https://localhost:44350/api/Login", byteContent);
            var respons2 = response.Result;
            string responsestr = response.Result.Content.ReadAsStringAsync().Result;

            var account = JsonConvert.DeserializeObject<LoginResponseModel>(responsestr);

            NameValueCollection myKeys = ConfigurationManager.AppSettings;


            if (account.status == myKeys["DDD"])
            {
                Session["firstname"] = account.firstname;
                Session["lastname"] = account.lastname;
                Session["CheckStatus"] = "true";
                Session["counter"] = "2";
                Response.Redirect("Admin.aspx");
                
                

            }
            else if (account.status == myKeys["EEE"])
            {
                string message = "Invalid User ID or Password";
                MessageBox.Show(message);
            }
            else if (account.status == myKeys["FFF"])
            {
                string message = "ERROR !!";
                MessageBox.Show(message);
            }


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
        public static void Logger(string message)
        {
            string logPart = ConfigurationManager.AppSettings["logPath"];
            using (StreamWriter writer = new StreamWriter(logPart, true))
            { 
                writer.WriteLine($"{DateTime.Now} : {message}");
            }
        }

    }
}