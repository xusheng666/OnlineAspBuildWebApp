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
    public partial class LoginSignup : System.Web.UI.Page
    {
        UserManageBC _bc = new UserManageBC();
               
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.userId.Text) )
            {
                //ProcessAuthentication(userId
                CMNUserDataSet userDS = new CMNUserDataSet();
                CMNUserDataSet.T_CMN001_USERRow userRow = userDS.T_CMN001_USER.NewT_CMN001_USERRow();
                userRow.USERID = Utility.NewDataKey();
                userRow.LOGINID = this.userId.Text;
                userRow.USER_NAME = "test";
                userRow.EMAIL_ADDRESS = "test@test.com";
                userRow.STATUS = "A";

                Utility.UpdateCommonFields(userRow);
                userDS.T_CMN001_USER.AddT_CMN001_USERRow(userRow);
                _bc.SaveUser(userDS);
                result.Text = "Successful!";
            }
        }

        private void ProcessAuthentication(String aUserId, string aEntityId, string aEntityIdType, string aRolesArrayText, String aUserFullName, String aContactNo, String aEmail)
        {
            //ApplicationContext.Current.UserName = aUserId;
            //ApplicationContext.Current.UserId = aUserId;
            //ApplicationContext.Current.TransactionId = Guid.NewGuid().ToString();


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

            Response.Redirect("~/ListCourses.aspx", false);
        }
    }
}