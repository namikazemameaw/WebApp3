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
using WebApp3.AppCode;
using static WebApp3.AppCode.RequestModel;

namespace WebApp3
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["counter"] == null)
            {
                Response.Redirect("Default.aspx");

            }
            
            else if (Session["counter"] == "AdminPage")
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

                    List<ResponseModel.AdminApproveResponseModel> UserList = JsonConvert.DeserializeObject<List<ResponseModel.AdminApproveResponseModel>>(html);

                    PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(ResponseModel.AdminApproveResponseModel));
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
            API api = new API();
            RequestModel.AdminApproveRequstModel adminApproveRequstModel = new RequestModel.AdminApproveRequstModel();  

            string username = (sender as LinkButton).CommandArgument;

            adminApproveRequstModel.approve = 1;
            adminApproveRequstModel.username = username;

            var account = JsonConvert.DeserializeObject<ResponseModel.StatusResponseModel>(api.apiadminapprove(adminApproveRequstModel));

            if (account.status == "true")
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
            API api = new API();
            RequestModel.AdminApproveRequstModel adminApproveRequstModel = new RequestModel.AdminApproveRequstModel();

            string username = (sender as LinkButton).CommandArgument;

            adminApproveRequstModel.disapprove = 2;
            adminApproveRequstModel.username = username;

            var account = JsonConvert.DeserializeObject<ResponseModel.StatusResponseModel>(api.apiadminapprove(adminApproveRequstModel));

            if (account.status == "true")
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