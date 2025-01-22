using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using ProductsWeb.Models;
using System.Globalization;

namespace ProductsWeb
{
    public class ProductsDAL
    {
        public static DataTable GetAllProducts()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);

            DataTable dt = new DataTable();
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("GetAllProducts", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }

            return dt;
        }


        public static Product[] GetAllProductsTable()
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("GetAllProducts", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "products");

            List<Product> details = new List<Product>();
            DataTable dt = ds.Tables[0];
            foreach (DataRow dtrow in dt.Rows)
            {
                Product product = new Product();
                product.ProductId = Int32.Parse(dtrow["ProductId"].ToString());
                product.Code = dtrow["Code"].ToString();
                product.Name = dtrow["Name"].ToString();
                product.Description = dtrow["Description"].ToString();

                DateTime dtOut = DateTime.MinValue;
                DateTime.TryParse(dtrow["SellDate"].ToString(), out dtOut);
                product.SellDate = dtOut;

                product.ImageLink = dtrow["ImageLink"] == null ? dtrow["ImageLink"].ToString() : "";
                details.Add(product);
            }
             return details.ToArray();
        }

        public static Product GetProductByID(int productId)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetProductByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", productId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Product b = new Product();
                    b.ProductId = Int32.Parse(dr["ProductId"].ToString());
                    b.Code = dr["Code"].ToString();
                    b.Name = dr["Name"].ToString();
                    b.Description = dr["Description"].ToString();

                    DateTime dtOut = DateTime.MinValue;
                    DateTime.TryParse(dr["SellDate"].ToString(), out dtOut);
                    b.SellDate = dtOut;

                    //DateTime sellDate = DateTime.ParseExact(dr["SellDate"].ToString(), "MM-dd-yyyy", CultureInfo.InvariantCulture);
                    //b.SellDate = sellDate;

                    b.ImageLink = dr["ImageLink"] == null ? dr["ImageLink"].ToString() : "";
                    return b;
                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }


        public static Product[] GetProductByNameOrCode(string str)
        {
            List<Product> products = new List<Product>();
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetProductByNameOrCode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@str", str);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Product b = new Product();
                        b.ProductId = Int32.Parse(dr["ProductId"].ToString());
                        b.Code = dr["Code"].ToString();
                        b.Name = dr["Name"].ToString();
                        b.Description = dr["Description"].ToString();

                        DateTime dtOut = DateTime.MinValue;
                        DateTime.TryParse(dr["SellDate"].ToString(), out dtOut);
                        b.SellDate = dtOut;

                        //DateTime dt = DateTime.ParseExact(dr["SellDate"].ToString(), "dd-MM-yyyy", CultureInfo.InvariantCulture);
                        //b.SellDate = dt;                                               

                        b.ImageLink = dr["ImageLink"] == null ? dr["ImageLink"].ToString() : "";
                        products.Add(b);
                    }

                    //ListtoDataTableConverter converter = new ListtoDataTableConverter();
                    //DataTable dt = converter.ToDataTable(products);
                    //return dt;

                    return products.ToArray();
                }
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public static string SaveProduct(OnlyProduct objProduct)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("CreateProductWithImage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Code", objProduct.Code);
                cmd.Parameters.AddWithValue("@Name", objProduct.Name);
                cmd.Parameters.AddWithValue("@Description", objProduct.Description);
                cmd.Parameters.AddWithValue("@SellDate", objProduct.SellDate);                
                cmd.Parameters.AddWithValue("@ImageLink", objProduct.ImageLink);
                cmd.ExecuteNonQuery();
                return null; // success 
            }
            catch (Exception ex)
            {
                return ex.Message;  // return error message
            }
            finally
            {
                con.Close();
            }
        }

        public static string DeleteProduct(int productId)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.ExecuteNonQuery();
                return null; // success 
            }
            catch (Exception ex)
            {
                return ex.Message;  // return error message
            }
            finally
            {
                con.Close();
            }
        }
        public static string UpdateProductWithId(Product objProduct)
        {
            SqlConnection con = new SqlConnection(Database.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateProductWithImage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", objProduct.ProductId);
                cmd.Parameters.AddWithValue("@Code", objProduct.Code);
                cmd.Parameters.AddWithValue("@Name", objProduct.Name);
                cmd.Parameters.AddWithValue("@Description", objProduct.Description);
                cmd.Parameters.AddWithValue("@SellDate", objProduct.SellDate);
                cmd.Parameters.AddWithValue("@ImageLink", objProduct.ImageLink);
                cmd.ExecuteNonQuery();
                return null; // success 
            }
            catch (Exception ex)
            {
                return ex.Message;  // return error message
            }
            finally
            {
                con.Close();
            }
        }
    }
}