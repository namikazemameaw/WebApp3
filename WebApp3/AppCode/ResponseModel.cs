using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp3.AppCode
{
    public class ResponseModel
    {
        public class LoginResponseModel
        {
            public string status { get; set; }
            public string firstname { get; set; }
            public string lastname { get; set; }
            public string approve { get; set; }
        }
        public class StatusResponseModel
        {
            public string status { get; set; }
        }
        public class AdminApproveResponseModel
        {
            public int No { get; set; }
            public string firstname { get; set; }
            public string lastname { get; set; }
            public string email { get; set; }
            public string username { get; set; }
            public string password { get; set; }

        }

    }

}