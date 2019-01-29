using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OpticalPointOfSale.Helper
{
    public class UserSession : System.Web.UI.Page
    {
        public void Login()
        {
            Session["login"] = true;
        }

        public void Logout()
        {
            Session["login"] = false;
        }

        public void isLogedIn()
        {
            if (Session["login"] == null || Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("~/Pages/Login.aspx");
        }
    }
}