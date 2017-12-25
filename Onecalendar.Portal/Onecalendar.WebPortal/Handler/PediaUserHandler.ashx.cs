using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Onecalendar.WebPortal.Handler
{
    /// <summary>
    /// Summary description for PediaUserHandler
    /// </summary>
    public class PediaUserHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;

            CMNUserDataSet courseDS = new CMNUserDataSet();
            CMNUserDataSet.T_CMN001_USERRow userRow = courseDS.T_CMN001_USER.NewT_CMN001_USERRow();
            IList<UserDTO> userList = new List<UserDTO>();

            if (context.Request.QueryString.Count >= 1)
            {
                UserManageBC _userBC = new UserManageBC();
                
                String userID = context.Request.QueryString["UserID"];
                String Email = context.Request.QueryString["Email"];

                if(!string.IsNullOrEmpty(userID)){
                    CMNUserDataSet userDS = _userBC.getUserByLoginID(userID);

                    if (userDS.T_CMN001_USER.Rows.Count >= 1)
                    {
                        userRow = (CMNUserDataSet.T_CMN001_USERRow)userDS.T_CMN001_USER.Rows[0];
                        foreach (DataRow item in userDS.T_CMN001_USER.Rows)
                        {
                            if (item["LOGINID"] == null || String.IsNullOrEmpty(item["LOGINID"].ToString()))
                            {
                                continue;
                            }
                            UserDTO user = new UserDTO
                            {
                                UserID = item["LOGINID"].ToString(),
                                UserEmail = item["EMAIL_ADDRESS"].ToString(),
                            };

                            userList.Add(user);
                        }
                    }
                    else if(!string.IsNullOrEmpty(Email))
                    {// if have the email will insert one new user
                        userRow = courseDS.T_CMN001_USER.NewT_CMN001_USERRow();
                        userRow.USERID = Utility.NewDataKey();
                        userRow.LOGINID = userID;
                        userRow.USER_NAME = userID;
                        userRow.EMAIL_ADDRESS = Email;
                        userRow.STATUS = "A";
                        userRow.USER_ROLE_ARR = Constants.UserRoles.MOBILE_PEDIA_ROLE;

                        Utility.UpdateCommonFields(userRow);
                        courseDS.T_CMN001_USER.AddT_CMN001_USERRow(userRow);

                        _userBC.UpdateTable(courseDS.T_CMN001_USER);

                        UserDTO user = new UserDTO
                        {
                            UserID = userID,
                            UserEmail = Email,
                            IsCreated = "Yes"
                        };

                        userList.Add(user);
                    }
                }
            }

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(userList);
            context.Response.Write(sJSON);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public class UserDTO
        {
            public string UserID { get; set; }
            public string UserEmail { get; set; }
            public string IsCreated { get; set; }
        }
    }
}