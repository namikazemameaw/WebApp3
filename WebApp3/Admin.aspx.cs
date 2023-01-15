using MySqlX.XDevAPI.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebApp3.Default;
using System.IO;
using System.Net;
using System.Data;
using System.Text;
using System.Web.DynamicData;
using System.Web.UI.HtmlControls;
using static System.Net.Mime.MediaTypeNames;
using System.Windows.Forms;
using MySqlX.XDevAPI.Relational;
using System.ComponentModel;
using System.Text.RegularExpressions;
using Button = System.Windows.Forms.Button;
using System.Reflection;
using System.Drawing;

namespace WebApp3
{
    public partial class Admin : System.Web.UI.Page
    {


        public class AdminApproveResponseModel
        {
            public int No { get; set; }
            public string firstname { get; set; }
            public string lastname { get; set; }
            public string email { get; set; }
            public string username { get; set; }
            public string password { get; set; }


        }
        public class AdminApproveRequstModel
        {
            public int approve { get; set; }
            public string username { get; set; }

            public int disapprove { get; set; }
        }

        public class ResponseModel
        {
            public bool status { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["counter"] == null)
            {
                Response.Redirect("Default.aspx");

            }
            else if (Session["counter"] == "1")
            {
                string message = "Please Login !!";
                MessageBox.Show(message);
                Response.Redirect("Default.aspx");
                Session["counter"] = "1";

            }
            else if (Session["counter"] == "2")
            {
                firstname.Text = Session["firstname"].ToString();
                lastname.Text = Session["lastname"].ToString();



                string html = string.Empty;
                string url = @"https://localhost:44350/api/AdminApprove";

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.AutomaticDecompression = DecompressionMethods.GZip;

                using (HttpWebResponse AdminApproveResponseModel = (HttpWebResponse)request.GetResponse())
                using (Stream stream = AdminApproveResponseModel.GetResponseStream())
                using (StreamReader reader = new StreamReader(stream))
                {
                    html = reader.ReadToEnd();

                    List<AdminApproveResponseModel> UserList = JsonConvert.DeserializeObject<List<AdminApproveResponseModel>>(html);

                    PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(AdminApproveResponseModel));
                    DataTable table = new DataTable();

                    for (int i = 0; i < props.Count; i++)
                    {

                        PropertyDescriptor prop = props[i];
                        table.Columns.Add(prop.Name, prop.PropertyType);

                    }
                    object[] values = new object[props.Count];
                    int j = 0;
                    foreach (var item in UserList)
                    {

                        for (int i = 0; i < values.Length; i++)
                        {

                            if (i == 0)
                            {
                                values[i] = j + 1;
                                j++;

                            }

                            else
                            {
                                values[i] = props[i].GetValue(item);
                            }

                        }
                        table.Rows.Add(values);


                    }


                    Gridview.DataSource = table;
                    Gridview.DataBind();
                }
            }

        }
        protected void approve(object sender, EventArgs e)
        {
            string username = (sender as LinkButton).CommandArgument;
            AdminApproveRequstModel requst = new AdminApproveRequstModel();
            requst.approve = 1;
            //requst.disapprove = 0;
            requst.username = username;

            HttpClient httpClient = new HttpClient();
            string json = JsonConvert.SerializeObject(requst);
            var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = httpClient.PostAsync("https://localhost:44350/api/AdminApprove", byteContent);
            var respons2 = response.Result;
            string responsestr = response.Result.Content.ReadAsStringAsync().Result;

            var account = JsonConvert.DeserializeObject<ResponseModel>(responsestr);

            if (account.status == true)
            {
                string message = "Success";
                MessageBox.Show(message);

                Response.Redirect("Admin.aspx");

            }

            else
            {

            }
        }
        protected void disapprove(object sender, EventArgs e)
        {
            string username = (sender as LinkButton).CommandArgument;
            AdminApproveRequstModel requst = new AdminApproveRequstModel();
            //requst.approve = 0;
            requst.disapprove = 2;
            requst.username = username;

            HttpClient httpClient = new HttpClient();
            string json = JsonConvert.SerializeObject(requst);
            var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = httpClient.PostAsync("https://localhost:44350/api/AdminApprove", byteContent);
            var respons2 = response.Result;
            string responsestr = response.Result.Content.ReadAsStringAsync().Result;

            var account = JsonConvert.DeserializeObject<ResponseModel>(responsestr);

            if (account.status == true)
            {
                string message = "Success";
                MessageBox.Show(message);

                Response.Redirect("Admin.aspx");

            }

            else
            {

            }


        }
        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void logout(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session["counter"] = null;

        }



    }
}