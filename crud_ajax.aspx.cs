using ProductsWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace ProductsWeb
{
    public partial class crud_ajax : System.Web.UI.Page
    {
        private const string ASCENDING = " ASC";
        private const string DESCENDING = " DESC";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
                BindData();
        }

        private void BindData()
        {
            DataTable dt = ProductsDAL.GetAllProducts();
            gvProducts.DataSource = dt;
            gvProducts.DataBind();
            ViewState["Paging"] = dt;
        }

        public SortDirection CurrentSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                {
                    ViewState["sortDirection"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["sortDirection"];
            }
            set
            {
                ViewState["sortDirection"] = value;
            }
        }

        protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducts.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void gvProducts_Sorting(object sender, GridViewSortEventArgs e)
        {
            string ColumnTosort = e.SortExpression;

            if (CurrentSortDirection == SortDirection.Ascending)
            {
                CurrentSortDirection = SortDirection.Descending;
                SortGridView(ColumnTosort, DESCENDING);
            }
            else
            {
                CurrentSortDirection = SortDirection.Ascending;
                SortGridView(ColumnTosort, ASCENDING);
            }            
        }

        private void SortGridView(string sortExpression, string direction)
        {
            dynamic dt = ViewState["Paging"];
            DataTable dtsort = dt;
            DataView dv = new DataView(dtsort);
            dv.Sort = sortExpression + direction;

            gvProducts.DataSource = dv;
            gvProducts.DataBind();
        }

        [WebMethod]
        public static string GetResult(int variable)
        {
            return "Data " + variable;
        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtID.Text = gvProducts.SelectedRow.Cells[1].Text;
            txtCode.Text = gvProducts.SelectedRow.Cells[2].Text;
            txtName.Text = gvProducts.SelectedRow.Cells[3].Text;
            txtDescription.Text = gvProducts.SelectedRow.Cells[4].Text;
            txtSellDate.Text = gvProducts.SelectedRow.Cells[5].Text;
            txtUploadFileName.Text = (gvProducts.SelectedRow.Cells[6].Text == "&nbsp;") ? "" : gvProducts.SelectedRow.Cells[6].Text;
        }

        protected void lnkPickDate_Click(object sender, EventArgs e)
        {
            datePicker.Visible = true;
        }

        protected void datePicker_SelectionChanged(object sender, EventArgs e)
        {
            txtSellDate.Text = datePicker.SelectedDate.ToShortDateString(); // just use this method to get dd/MM/yyyy
            datePicker.Visible = false;
        }
    }
}