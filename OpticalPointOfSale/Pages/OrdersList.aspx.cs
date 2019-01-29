using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
namespace OpticalPointOfSale.Pages
{
    public partial class OrdersList : System.Web.UI.Page
    {
        OpticalPointOfSaleEntities EF = new OpticalPointOfSaleEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmptyMessages();
            try
            {
                if (!IsPostBack)
                {
                    LoadDropDown();
                    LoadGrid("","",null,null);
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void LoadDropDown()
        {
            cmbSearchType.Items.Add(new ListItem("Show All", "0"));
            cmbSearchType.Items.Add(new ListItem("Customer Name", "1"));
            cmbSearchType.Items.Add(new ListItem("Customer Contact", "2"));
            /*cmbSearchType.Items.Add(new ListItem("Order Date", "3"));
            cmbSearchType.Items.Add(new ListItem("Delivery Date", "4"));*/
            cmbSearchType.SelectedIndex = 2;
        }

        private void LoadGrid(string Name,string ContactInfo,string OrderDate,string DeliveryDate)
        {
            try
            {
                EmptyMessages();
                List<SearchOrders_Result> lstOrders = EF.SearchOrders(Name, ContactInfo, OrderDate, DeliveryDate).ToList();
                gvOrders.DataSource = lstOrders;
                gvOrders.DataBind();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void EmptyMessages()
        {
            lblError.Text = "";
            lblMessage.Text = "";
        }

        protected void cmbSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if(cmbSearchType.SelectedItem.Text == "Show All")
                {
                    LoadGrid("", "", null, null);
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                BindGrid();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void BindGrid()
        {
            string CustomerName = string.Empty;
            string ContactInfor = string.Empty;
            string OrderDate = string.Empty;
            string DeliveryDate = string.Empty;
            if (cmbSearchType.SelectedItem.Text == "Customer Name")
                CustomerName = txtSearchText.Text.Trim();
            else if (cmbSearchType.SelectedItem.Text == "Customer Contact")
                ContactInfor = txtSearchText.Text.Trim();
            /*else if (cmbSearchType.SelectedItem.Text == "Order Date")
                OrderDate = txtSearchText.Text.Trim();
            else if (cmbSearchType.SelectedItem.Text == "Delivery Ddate")
                DeliveryDate = txtSearchText.Text.Trim();*/
            LoadGrid(CustomerName, ContactInfor, OrderDate, DeliveryDate);
        }

        protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrders.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}