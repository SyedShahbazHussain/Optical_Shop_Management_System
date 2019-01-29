using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using OpticalPointOfSale.Helper;
namespace OpticalPointOfSale.Pages
{
    public partial class AddEditOrder : System.Web.UI.Page
    {
        OpticalPointOfSaleEntities EF = new OpticalPointOfSaleEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            EmptyMessages();
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["orderid"] == null)
                    {
                        txtDate.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
                        var CustomerOrderExists = EF.CustomerOrders.FirstOrDefault();
                        long nextOrderNo = 0;
                        if (CustomerOrderExists != null)
                        {
                            nextOrderNo = (from objresult in EF.CustomerOrders select objresult.OrderId).Max();
                        }
                        txtSystemOrderNo.Text = (nextOrderNo + 1).ToString();
                    }
                    else
                    {
                        long OrderID = Convert.ToInt64(Request.QueryString["orderid"]);
                        LoadData(OrderID);
                        btnSave.Text = "Update";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void LoadData(long OrderID)
        {
            try
            {
                CustomerOrder _Order = (from objResult in EF.CustomerOrders where objResult.OrderId == OrderID select objResult).FirstOrDefault();
                if (_Order != null)
                {
                    txtSystemOrderNo.Text = _Order.OrderId.ToString();
                    txtBookSerial.Text = _Order.BookOrderNo;
                    txtAdvance.Text = _Order.Advance.ToString();
                    txtBalance.Text = _Order.Balance.ToString();
                    txtTotal.Text = _Order.Total.ToString();
                    txtContactInfo.Text = _Order.Customer.ContactInfo;
                    txtContactLenses.Text = _Order.ContactLense;
                    txtCustomerName.Text = _Order.Customer.Name;
                    txtDate.Text = _Order.OrderDate.ToString("MM/dd/yyyy");
                    if (_Order.DeliveryDate != null)
                        txtDeliveryDate.Text = ((DateTime)_Order.DeliveryDate).ToString("MM/dd/yyyy");
                    txtFrames.Text = _Order.Frame;
                    txtParticulars.Text = _Order.Particularls;

                    txtL_AXIS_CL.Text = _Order.LE_AXIS_CL;
                    txtL_AXIS_D.Text = _Order.LE_AXIS_D;
                    txtL_AXIS_R.Text = _Order.LE_AXIS_R;

                    txtL_CYL_CL.Text = _Order.LE_CYL_CL;
                    txtL_CYL_D.Text = _Order.LE_CYL_D;
                    txtL_CYL_R.Text = _Order.LE_CYL_R;

                    txtL_SPH_CL.Text = _Order.LE_SPH_CL;
                    txtL_SPH_D.Text = _Order.LE_SPH_D;
                    txtL_SPH_R.Text = _Order.LE_SPH_R;

                    txtL_VA_CL.Text = _Order.LE_VA_CL;
                    txtL_VA_D.Text = _Order.LE_VA_D;
                    txtL_VA_R.Text = _Order.LE_VA_R;

                    txtLense.Text = _Order.Lenses;

                    txtR_AXIS_CL.Text = _Order.RE_AXIS_CL;
                    txtR_AXIS_D.Text = _Order.RE_AXIS_D;
                    txtR_AXIS_R.Text = _Order.RE_AXIS_R;

                    txtR_CYL_CL.Text = _Order.RE_CYL_CL;
                    txtR_CYL_D.Text = _Order.RE_CYL_D;
                    txtR_CYL_R.Text = _Order.RE_CYL_R;

                    txtR_SPH_CL.Text = _Order.RE_SPH_CL;
                    txtR_SPH_D.Text = _Order.RE_SPH_D;
                    txtR_SPH_R.Text = _Order.RE_SPH_R;

                    txtR_VA_CL.Text = _Order.RE_VA_CL;
                    txtR_VA_D.Text = _Order.RE_VA_D;
                    txtR_VA_R.Text = _Order.RE_VA_R;
                }
                else
                {
                    lblError.Text = "No records found";
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            EmptyMessages();
            try
            {
                if (Request.QueryString["orderid"] == null)
                {
                    long CustomerID = GetCustomerID();
                    if (CustomerID >= 0)
                    {
                        CustomerOrder _Order = new CustomerOrder();
                        FillOrderObject(CustomerID, _Order);
                        EF.CustomerOrders.Add(_Order);
                        EF.SaveChanges();
                        lblMessage.Text = "Order saved";
                    }
                }
                else
                {
                    long OrderID = Convert.ToInt64(Request.QueryString["orderid"]);
                    CustomerOrder _Order = (from objResult in EF.CustomerOrders where objResult.OrderId == OrderID select objResult).FirstOrDefault();
                    FillOrderObject(0, _Order);
                    EF.SaveChanges();
                    lblMessage.Text = "Order: " + _Order.OrderId.ToString() + " Updated";
                }
                EmptyControls();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void FillOrderObject(long CustomerID, CustomerOrder _Order)
        {
            _Order.BookOrderNo = txtBookSerial.Text.Trim();
            if (string.IsNullOrEmpty(txtAdvance.Text.Trim()))
                _Order.Advance = 0;
            else
                _Order.Advance = Convert.ToInt32(txtAdvance.Text);
            if (string.IsNullOrEmpty(txtBalance.Text.Trim()))
                _Order.Balance = 0;
            else
                _Order.Balance = Convert.ToInt32(txtBalance.Text.Trim());
            _Order.Comments = "";

            _Order.ContactLense = txtContactLenses.Text.Trim();

            if (CustomerID > 0)
                _Order.CustomerID = CustomerID;
            if (CustomerID > 0)
                _Order.DateCreated = DateTime.Now;
            else
                _Order.DateUpdated = DateTime.Now;
            if (!string.IsNullOrEmpty(txtDeliveryDate.Text.Trim()))
                _Order.DeliveryDate = Convert.ToDateTime(txtDeliveryDate.Text.Trim());

            _Order.Frame = txtFrames.Text.Trim();

            _Order.LE_AXIS_CL = txtL_AXIS_CL.Text.Trim();
            _Order.LE_AXIS_D = txtL_AXIS_D.Text.Trim();
            _Order.LE_AXIS_R = txtL_AXIS_R.Text.Trim();

            _Order.LE_CYL_CL = txtL_CYL_CL.Text.Trim();
            _Order.LE_CYL_D = txtL_CYL_D.Text.Trim();
            _Order.LE_CYL_R = txtL_CYL_R.Text.Trim();

            _Order.LE_SPH_CL = txtL_SPH_CL.Text.Trim();
            _Order.LE_SPH_D = txtL_SPH_D.Text.Trim();
            _Order.LE_SPH_R = txtL_SPH_R.Text.Trim();

            _Order.LE_VA_CL = txtL_VA_CL.Text.Trim();
            _Order.LE_VA_D = txtL_VA_D.Text.Trim();
            _Order.LE_VA_R = txtL_VA_R.Text.Trim();

            _Order.Lenses = txtLense.Text.Trim();
            _Order.OrderDate = Convert.ToDateTime(txtDate.Text.Trim());
            _Order.Particularls = txtParticulars.Text.Trim();

            _Order.RE_AXIS_CL = txtR_AXIS_CL.Text.Trim();
            _Order.RE_AXIS_D = txtR_AXIS_D.Text.Trim();
            _Order.RE_AXIS_R = txtR_AXIS_R.Text.Trim();

            _Order.RE_CYL_CL = txtR_CYL_CL.Text.Trim();
            _Order.RE_CYL_D = txtR_CYL_D.Text.Trim();
            _Order.RE_CYL_R = txtR_CYL_R.Text.Trim();

            _Order.RE_SPH_CL = txtR_SPH_CL.Text.Trim();
            _Order.RE_SPH_D = txtR_SPH_D.Text.Trim();
            _Order.RE_SPH_R = txtR_SPH_R.Text.Trim();

            _Order.RE_VA_CL = txtR_VA_CL.Text.Trim();
            _Order.RE_VA_D = txtR_VA_D.Text.Trim();
            _Order.RE_VA_R = txtR_VA_R.Text.Trim();

            if (string.IsNullOrEmpty(txtTotal.Text.Trim()))
                _Order.Total = 0;
            else
                _Order.Total = Convert.ToInt32(txtTotal.Text.Trim());
        }

        private void EmptyControls()
        {
            txtAdvance.Text = txtBalance.Text = txtTotal.Text = "0";
            txtBookSerial.Text = txtContactInfo.Text = txtContactLenses.Text = txtCustomerName.Text = txtFrames.Text = "";
            txtDate.Text = DateTime.Now.Date.ToString("yyyy-MM-dd");
            txtDeliveryDate.Text = "";
            txtL_AXIS_CL.Text = txtL_AXIS_D.Text = txtL_AXIS_R.Text = txtL_CYL_CL.Text = txtL_CYL_D.Text = txtL_CYL_R.Text = txtL_SPH_CL.Text = txtL_SPH_D.Text = txtL_SPH_R.Text = txtL_VA_CL.Text = txtL_VA_D.Text = txtL_VA_R.Text = "";
            txtLense.Text = txtParticulars.Text = txtR_AXIS_CL.Text = txtR_AXIS_D.Text = txtR_AXIS_R.Text = txtR_CYL_CL.Text = txtR_CYL_D.Text = txtR_CYL_R.Text = txtR_SPH_CL.Text = txtR_SPH_D.Text = txtR_SPH_R.Text = txtR_VA_CL.Text = txtR_VA_D.Text = txtR_VA_R.Text = "";
            txtSystemOrderNo.Text = "";
        }

        private void EmptyMessages()
        {
            lblError.Text = "";
            lblMessage.Text = "";
        }

        /// <summary>
        /// Returns Customer ID for exisitng customer or creates new customer
        /// </summary>
        /// <returns></returns>
        private long GetCustomerID()
        {
            long vrCustomerID = 0;
            string vrContactInfo = txtContactInfo.Text.Trim();
            var ExistingUser = (from objResult in EF.Customers where objResult.ContactInfo == vrContactInfo select objResult).FirstOrDefault();
            if (ExistingUser == null)
            {
                Customer _Customer = new Customer();
                _Customer.ContactInfo = txtContactInfo.Text.Trim();
                _Customer.CreatedBy = 1;
                _Customer.DateCreated = DateTime.Now;
                _Customer.Email = "";
                _Customer.IsDeleted = false;
                _Customer.Name = txtCustomerName.Text.Trim();
                EF.Customers.Add(_Customer);
                EF.SaveChanges();
                vrCustomerID = _Customer.CustomerID;
            }
            else
                vrCustomerID = ExistingUser.CustomerID;
            return vrCustomerID;
        }
    }
}