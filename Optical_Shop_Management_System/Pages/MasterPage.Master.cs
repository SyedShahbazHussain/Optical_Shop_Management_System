using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
namespace OpticalPointOfSale.Pages
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        Helper.UserSession helper = new Helper.UserSession();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                helper.isLogedIn();
                AppSettings _setting = new AppSettings();
                lblShopName.Text = _setting.ShopName;
            }
            catch (Exception)
            {
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            helper.Logout();
            Response.Redirect("login.aspx");
        }

        protected void lnkCreateOrder_Click(object sender, EventArgs e)
        {

        }
    }
}