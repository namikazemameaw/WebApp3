using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp3.AppCode
{
    public class RequestModel
    {
        public class LoginRequestModel
        {
            public string username { get; set; }
            public string password { get; set; }
        }
        public class RegistationRequestModel
        {
            public string firstname { get; set; }
            public string middlename { get; set; }
            public string lastname { get; set; }
            public string email { get; set; }
            public string phonenumber { get; set; }
            public string username { get; set; }
            public string password { get; set; }
        }
        public class AdminApproveRequstModel
        {
            public int approve { get; set; }
            public string username { get; set; }
            public int disapprove { get; set; }
        }

    }
}