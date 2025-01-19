using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Configuration;

namespace ProductsWeb
{
    public class Database
    {
        static public String ConnectionString
        {
            get
            {    // get connection string with name  database from  web.config.
                return WebConfigurationManager.ConnectionStrings["database"].ConnectionString;
            }
        }
    }
}