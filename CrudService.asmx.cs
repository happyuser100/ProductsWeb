using ProductsWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace ProductsWeb
{
    /// <summary>
    /// Summary description for CrudService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CrudService : System.Web.Services.WebService
    {
        public CrudService()
        {
            //Uncomment the following line if using designed components
            //InitializeComponent();
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod]
        public Product[] BindDatatable()
        {
            return ProductsDAL.GetAllProductsTable();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        public string SaveProduct(OnlyProduct objProduct)
        {
            objProduct.ImageLink = (Session["fileName"] == null) ? "" : Session["fileName"].ToString();
            ProductsDAL.SaveProduct(objProduct);
            return "";
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        public string UpdateProductWithId(Product objProduct)
        {
            objProduct.ImageLink = (Session["fileName"] == null) ? "":  Session["fileName"].ToString();
            ProductsDAL.UpdateProductWithId(objProduct);
            return "";
        }

        [WebMethod]
        [ScriptMethod]
        public void DeleteProduct(int productId)
        {
            ProductsDAL.DeleteProduct(productId);
        }

        [WebMethod]
        [ScriptMethod]
        public Product GetProductByID(int productId)
        {
            return ProductsDAL.GetProductByID(productId);
        }

        [WebMethod]
        [ScriptMethod]
        public Product[] GetProductByNameOrCode(string str)
        {
            return ProductsDAL.GetProductByNameOrCode(str);
        }

    }
}
