using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Onecalendar.WebPortal;
using System.Threading;
using System.Globalization;

namespace Onecalendar.WebPortal
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-AU");
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            // look if any security information exists for this request
            if (HttpContext.Current.User == null)
            {
                return;
            }

            // see if this user is authenticated, any authenticated cookie (ticket) exists for this user
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                return;
            }

            // see if the authentication is done using FormsAuthentication
            if (!(HttpContext.Current.User.Identity is FormsIdentity))
            {
                return;
            }

            // Get the roles stored for this request from the ticket
            // get the identity of the user
            FormsIdentity FID = (FormsIdentity)HttpContext.Current.User.Identity;

            // get the forms authetication ticket of the user
            FormsAuthenticationTicket Ticket = FID.Ticket;

            // get the roles stored as UserData into the ticket
            //Get the stored user-data, in this case, Page Client ID and UserName
            string userData = Ticket.UserData;
            string[] roles = userData.Split('|');

            // create generic principal and assign it to the current request
            HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(FID, roles);
        }

        // remove the disclosure server information for security started
        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("X-AspNet-Version");
            Response.Headers.Remove("Server");
        }
        // remove the disclosure server information for security ended
    }
}
