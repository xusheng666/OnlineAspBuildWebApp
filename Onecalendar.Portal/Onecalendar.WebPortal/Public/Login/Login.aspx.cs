using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using OneCalendar.BusinessComponent;
using Onecalendar.BusinessEntity;

namespace Onecalendar.WebPortal.Secure.Login
{
    public partial class LoginSignup : InternetPageBase
    {
        UserManageBC _bc = new UserManageBC();
               
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.userId.Text))
            {
                CMNUserDataSet userDS = _bc.getUserByLoginID(this.userId.Text);
                if (userDS.T_CMN001_USER!=null && userDS.T_CMN001_USER.Count > 0)
                {
                    string password = CryptionUtil.DecryptAESSecruedMsg(userDS.T_CMN001_USER[0].PASSWORD_HASH, this.userId.Text, userDS.T_CMN001_USER[0].PASSWORD_HASH_SALT);
                    if (password.Equals(this.password.Text))
                    {
                        ProcessAuthentication(this.userId.Text, userDS.T_CMN001_USER[0].COMPANY_ID, "C", userDS.T_CMN001_USER[0].USER_ROLE_ARR, this.userId.Text, "", "");
                    }
                }
            }
        }

        private void ProcessAuthentication(String aUserId, string aEntityId, string aEntityIdType, string aRolesArrayText, String aUserFullName, String aContactNo, String aEmail)
        {
            //Providing the FormsAuthenticationTicket "Ticket" to the authenticated user which contains version, username, entry datetime and expire date time, userdata and cookie path
            FormsAuthentication.Initialize();
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(1, aUserId, DateTime.Now,
                                                                             DateTime.Now.AddMinutes(Session.Timeout), false, aRolesArrayText,
                                                                             FormsAuthentication.FormsCookiePath);
            //encrypt the ticket and assign it into the string variable "hash"
            string hash = FormsAuthentication.Encrypt(Ticket);

            //Response.Cookies.Clear();
            HttpCookie Cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
            //checking whether the cookie is constant, If constant then expires the cookie based on the expiration time of user specified in ticket
            //if (!Ticket.IsPersistent) return;
            Cookie.Expires = Ticket.Expiration;
            Response.Cookies.Add(Cookie);
            Session["SessionUserInfoStore"] = new SessionUserInfoStore(aUserId, aUserId, "Comp", aEntityId, aEntityIdType, aUserFullName, aContactNo, aEmail);

            Response.Redirect("~/Secure/Course/Courses.aspx", false);
        }
    }
}