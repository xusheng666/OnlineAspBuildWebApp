using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Public.Login
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {// this is by logout from system redirect
                if (Session["SessionUserInfoStore"] != null)
                {
                    SessionUserInfoStore mySessionUserInfoStore = Session["SessionUserInfoStore"] as SessionUserInfoStore;
                    String mEntityId = mySessionUserInfoStore.UserEntityId;
                    String mSingpassID = mySessionUserInfoStore.UserSingPassId;
                    // TODO: adding logout log
                }
                FormsAuthentication.SignOut();
                Session.Abandon();
                Response.Redirect("~/Default2.aspx", false);

            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public string GetIPAddress()
        {
            string myIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(myIpAddress))
            {
                myIpAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(myIpAddress))
            {
                myIpAddress = HttpContext.Current.Request.UserHostAddress;
            }
            if (string.IsNullOrEmpty(myIpAddress))
            {
                myIpAddress = "0.0.0.0";
            }
            return myIpAddress;
        }
    }
}