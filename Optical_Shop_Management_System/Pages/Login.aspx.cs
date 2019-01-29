using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpticalPointOfSale.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        Helper.UserSession helper = new Helper.UserSession();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                var credentials = OpticalPointOfSale.Properties.Settings.Default.logincredentials.Split(',');
                if (txtUserName.Text.Trim() == credentials[0].ToString() && txtPassword.Text.Trim() == credentials[1].ToString())
                {
                    helper.Login();
                    Response.Redirect("AddEditOrder.aspx");
                }
                else
                    lblError.Text = "Invalid login credentials";
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}