using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using static WebApp3.AppCode.RequestModel;
using System.Collections.Specialized;
using System.Configuration;
using System.Security.Policy;

namespace WebApp3.AppCode
{
    public class API
    {

        public string apiLogin(RequestModel.LoginRequestModel loginRequestModel)
        {
            NameValueCollection myKeys = ConfigurationManager.AppSettings;
            String URL = myKeys["loginURL"];
            string json = JsonConvert.SerializeObject(loginRequestModel);

            return test(json, URL);

        }
        public string apiRegistation(RequestModel.RegistationRequestModel registationRequestModel)
        {
            NameValueCollection myKeys = ConfigurationManager.AppSettings;
            String URL = myKeys["registationURL"];
            string json = JsonConvert.SerializeObject(registationRequestModel);

            return test(json, URL);

        }
        public string apiadminapprove(RequestModel.AdminApproveRequstModel adminApproveRequstModel)
        {
            NameValueCollection myKeys = ConfigurationManager.AppSettings;
            String URL = myKeys["adminApproveURL"];
            string json = JsonConvert.SerializeObject(adminApproveRequstModel);

            return test(json, URL);

        }
        public string apidisapprove(RequestModel.AdminApproveRequstModel adminApproveRequstModel)
        {
            NameValueCollection myKeys = ConfigurationManager.AppSettings;
            String URL = myKeys["adminApproveURL"];
            string json = JsonConvert.SerializeObject(adminApproveRequstModel);

            return test(json, URL);

        }






        public string test(string json, string URL)
        {
            HttpClient httpClient = new HttpClient();

            var buffer = System.Text.Encoding.UTF8.GetBytes(json);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            var response = httpClient.PostAsync(URL, byteContent);
            var respons2 = response.Result;
            string responsestr = response.Result.Content.ReadAsStringAsync().Result;

            return responsestr;
        }
    }
}