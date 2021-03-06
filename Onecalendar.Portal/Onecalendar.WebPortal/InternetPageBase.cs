﻿using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal
{
    public class InternetPageBase: System.Web.UI.Page
    {
        public CourseBCService _bc = new CourseBCService();
        public UserManageBC _userBC = new UserManageBC();
        public CommonService _cmnBC = new CommonService();

        public String GetQueryParameterValue(String aQueryName)
        {
            
            if (String.IsNullOrEmpty(Request.QueryString[aQueryName]))
            {
                throw new ArgumentException("Invalid Query String");
            }

            return HttpUtility.HtmlDecode(Request.QueryString[aQueryName]);
        }

        public void ShowMessage(string message, MessageSeverity severity)
        {
            this.MaintainScrollPositionOnPostBack = false;
            Panel messagePanel = FindMessagePanelControl();
            Label messageLabel = FindMessageLabelControl();

            switch (severity)
            {
                case MessageSeverity.Critical:
                case MessageSeverity.Error:
                    this.AddScript("document.getElementById('" + messagePanel.ClientID +
                                   "').className = 'messageError';");
                    break;
                case MessageSeverity.Warning:
                case MessageSeverity.Debug:
                    this.AddScript("document.getElementById('" + messagePanel.ClientID +
                                   "').className = 'messageWarning';");
                    break;
                case MessageSeverity.Confirmation:
                case MessageSeverity.Information:
                    this.AddScript("document.getElementById('" + messagePanel.ClientID +
                                   "').className = 'messageInfo';");
                    break;
                default:
                    this.AddScript("document.getElementById('" + messagePanel.ClientID +
                                   "').className = 'messageError';");
                    break;
            }
            this.AddScript("document.getElementById('" + messagePanel.ClientID +
                           "').style.display = '';document.getElementById('" + messageLabel.ClientID +
                           "').innerHTML = '" + message + "';document.body.scrollTop = 0;");
        }

        public void AddScript(string scriptString)
        {
            ScriptManager.RegisterStartupScript((Page)this, typeof(InternetPageBase),
                                                Guid.NewGuid().ToString(), scriptString, true);
        }

        private Panel FindMessagePanelControl()
        {
            if (((Page)(HttpContext.Current.Handler)).Master != null)
            {
                Panel myPanel = (Panel)((Page)(HttpContext.Current.Handler)).Master.FindControl("PanelMessage");
                if (myPanel == null)// for those inherits Site.Master with deepth more than 2 
                {
                    myPanel = (Panel)((Page)(HttpContext.Current.Handler)).Master.Master.FindControl("PanelMessage");
                }
                return myPanel;
            }
            else
            {
                return (Panel)this.FindControl("PanelMessage");
            }
        }

        private Label FindMessageLabelControl()
        {
            Panel myPanel = FindMessagePanelControl();
            return (Label)myPanel.FindControl("LabelMessage");
        }

        public String SaveFileToDisk(byte[] filebytes, String fileName, String UserId)
        {
            String mImagePathPre = ConfigurationManager.AppSettings["ImagePath"];
            String mContext = ConfigurationManager.AppSettings["Context"];
            String relativeDir = mImagePathPre + UserId + "/";
            String directoryPath = Server.MapPath("~") + relativeDir;
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
            string filePath = directoryPath + fileName;
            File.WriteAllBytes(filePath, filebytes);
            // return the path in application
            String relativePath = relativeDir + fileName;
            return mContext + relativePath;
        }

        public SessionUserInfoStore GetLoginSessionInfo()
        {
            SessionUserInfoStore userInfo = (SessionUserInfoStore)Session["SessionUserInfoStore"];
            return userInfo;
        }

        public String GetLoginCompanyID()
        {
            SessionUserInfoStore userInfo = (SessionUserInfoStore)Session["SessionUserInfoStore"];
            return userInfo.UserEntityId;
        }
        /// <summary>
        /// below to redirection of the pages
        /// </summary>
        public void RedirectToCourseList()
        {
            Response.Redirect("~/Secure/Course/Courses.aspx");
        }

        public void RedirectToCompanyList()
        {
            Response.Redirect("~/Secure/User/ListCompany.aspx");
        }

        public void RedirectToAddCompany()
        {
            Response.Redirect("~/Secure/User/CreateCompany.aspx");
        }
    }
}