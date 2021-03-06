﻿using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Public
{
    public partial class UserRegistration : InternetPageBase
    {
        UserManageBC _bc = new UserManageBC();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            if (IsValid && !String.IsNullOrEmpty(this.userName.Text) && pass1.Text.Equals(pass2.Text))
            {
                bool exists = checkExistsUser();

                if (!exists)
                {
                    //ProcessAuthentication(userId
                    CMNUserDataSet userDS = new CMNUserDataSet();
                    CMNUserDataSet.T_CMN001_USERRow userRow = userDS.T_CMN001_USER.NewT_CMN001_USERRow();
                    userRow.USERID = Utility.NewDataKey();
                    userRow.LOGINID = this.userName.Text;
                    userRow.USER_NAME = this.displayName.Text;
                    userRow.EMAIL_ADDRESS = this.email.Text;
                    userRow.STATUS = Constants.UserStatus.ACTIVE;
                    userRow.USER_ROLE_ARR = Constants.UserRoles.PROCESS_ROLE;
                    userRow.COMPANY_ID = "-1";// default company

                    Utility.UpdateCommonFields(userRow);
                    userDS.T_CMN001_USER.AddT_CMN001_USERRow(userRow);

                    byte[] saltBytes = CryptionUtil.GeneratorSalt(this.userName.Text);
                    byte[] encryptedMsg = CryptionUtil.EncryptAESSecruedMsg(pass1.Text, userName.Text, saltBytes);

                    userRow.PASSWORD_HASH = encryptedMsg;
                    userRow.PASSWORD_HASH_SALT = saltBytes;

                    _bc.SaveUser(userDS);
                    //this.msgTxt.Text = "Successful!";

                    Response.Redirect("~/Public/Login/Login.aspx");
                }
                else
                {
                    ShowMessage("The User Name is already registered, Please using another one and retry.", MessageSeverity.Error);
                }
                
            }
        }

        protected void userName_TextChanged(object sender, EventArgs e)
        {
            bool isExists = checkExistsUser();
        }

        private bool checkExistsUser()
        {
            CMNUserDataSet ds = _bc.getUserByLoginID(this.userName.Text);
            return ds.T_CMN001_USER.Rows.Count > 0;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Public/Login/Login.aspx");
        }
    }
}