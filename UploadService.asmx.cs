using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ProductsWeb
{
    /// <summary>
    /// Summary description for UploadService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class UploadService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        public UploadService()
        {
            //Uncomment the following line if using designed components
            //InitializeComponent();
        }

        [WebMethod(EnableSession = true)]
        public void UploadFiles()
        {
            //Create the Directory.
            string path = HttpContext.Current.Server.MapPath("~/UploadFiles/");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            //Fetch the File.
            HttpPostedFile postedFile = HttpContext.Current.Request.Files[0];
            string fileName = Path.GetFileNameWithoutExtension(postedFile.FileName) + "_" + Guid.NewGuid().ToString() + Path.GetExtension(postedFile.FileName);

            //Save the File.
            string filePath = path + fileName;
            postedFile.SaveAs(filePath);

            Session["fileName"] = fileName;

            //Send OK Response to Client.
            //HttpContext.Current.Response.StatusCode = (int)HttpStatusCode.OK;
            //HttpContext.Current.Response.Write(fileName);
            //HttpContext.Current.Response.Flush();
        }
    }

}
