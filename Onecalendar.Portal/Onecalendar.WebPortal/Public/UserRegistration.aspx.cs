using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Public
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        UserManageBC _bc = new UserManageBC();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(this.userName.Text))
            {
                //ProcessAuthentication(userId
                CMNUserDataSet userDS = new CMNUserDataSet();
                CMNUserDataSet.T_CMN001_USERRow userRow = userDS.T_CMN001_USER.NewT_CMN001_USERRow();
                userRow.USERID = Utility.NewDataKey();
                userRow.LOGINID = this.userName.Text;
                userRow.USER_NAME = this.displayName.Text;
                userRow.EMAIL_ADDRESS = this.email.Text;
                userRow.STATUS = "A";

                Utility.UpdateCommonFields(userRow);
                userDS.T_CMN001_USER.AddT_CMN001_USERRow(userRow);
                _bc.SaveUser(userDS);
                //this.msgTxt.Text = "Successful!";

                Response.Redirect("~/Public/Login/Login.aspx");
            }
        }
    }
}