using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Secure.User
{
    public partial class ManageUser : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.UserDataBind();
            }
        }

        protected void UserDataBind()
        {
            // Create Data Table
            DataTable dt = new DataTable();
            dt.Columns.Add("USERID", typeof(string));
            dt.Columns.Add("LOGINID", typeof(string));
            dt.Columns.Add("USER_NAME", typeof(string));
            dt.Columns.Add("EMAIL_ADDRESS", typeof(string));
            dt.Columns.Add("USER_ROLE_ARR", typeof(string));

            // fetch the events under this course
            DataTable usersDT = _userBC.getAllUsers();
            if (usersDT.Rows.Count == 0)
            {
                dt.Rows.Add(dt.NewRow());// to display the gridview
                gvwUsers.DataSource = dt;
                gvwUsers.DataBind();

                gvwUsers.Columns[4].Visible = false;
                foreach (GridViewRow row in gvwUsers.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        LinkButton lb = ((LinkButton)row.FindControl("lnkRemove"));
                        lb.Visible = false;
                    }
                }
            }
            else
            {// for have existing records
                foreach (DataRow item in usersDT.Rows)
                {
                    dt.Rows.Add(item["USERID"], item["LOGINID"], item["USER_NAME"], item["EMAIL_ADDRESS"], item["USER_ROLE_ARR"]);
                }

                this.gvwUsers.DataSource = usersDT;
                this.gvwUsers.DataBind();

                if (gvwUsers.Rows.Count > 0)
                {
                    gvwUsers.UseAccessibleHeader = true;
                    gvwUsers.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                gvwUsers.Columns[4].Visible = true;
            }
        }

        #region gridview controls
        /// <summary>
        /// 
        /// below are for the gridview controls
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        // This event is raised when the Cancel button of a row in edit mode is clicked, 
        //but before the row exits edit mode
        protected void gvwDash_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvwUsers.EditIndex = -1;
            UserDataBind();
        }

        protected void gvwDash_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvwUsers.EditIndex = e.NewEditIndex;
            UserDataBind();
        }

        // Adding new user
        protected void AddNewUser(object sender, EventArgs e)
        {
            string eventLoginID = ((TextBox)gvwUsers.FooterRow.FindControl("txtNewLoginID")).Text;
            string eventUserName = ((TextBox)gvwUsers.FooterRow.FindControl("txtNewUserName")).Text;
            string eventEmail = ((TextBox)gvwUsers.FooterRow.FindControl("txtNewEmail")).Text;
            string eventRoles = ((TextBox)gvwUsers.FooterRow.FindControl("txtNewUserRole")).Text;

            // below to add new event
            CMNUserDataSet courseDS = new CMNUserDataSet();
            CMNUserDataSet.T_CMN001_USERRow userRow = courseDS.T_CMN001_USER.NewT_CMN001_USERRow();
            userRow.USERID = Utility.NewDataKey();
            userRow.LOGINID = eventLoginID;
            userRow.USER_NAME = eventUserName;
            userRow.EMAIL_ADDRESS = eventEmail;
            userRow.STATUS = "A";
            userRow.USER_ROLE_ARR = eventRoles;

            Utility.UpdateCommonFields(userRow);
            courseDS.T_CMN001_USER.AddT_CMN001_USERRow(userRow);

            _userBC.UpdateTable(courseDS.T_CMN001_USER);
            // end of add new event

            // Rebind Grid view
            this.UserDataBind();
        }

        // Updating a event
        protected void gvwDash_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string userId = ((Label)gvwUsers.Rows[e.RowIndex].FindControl("txtUserId")).Text;
            string loginID = ((TextBox)gvwUsers.Rows[e.RowIndex].FindControl("txtLoginID")).Text;
            string userName = ((TextBox)gvwUsers.Rows[e.RowIndex].FindControl("txtUserName")).Text;
            string email = ((TextBox)gvwUsers.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string userRole = ((TextBox)gvwUsers.Rows[e.RowIndex].FindControl("txtUserRole")).Text;

            // update event start
            CMNUserDataSet userDS = _userBC.getUserDataSetByUserId(userId);

            CMNUserDataSet.T_CMN001_USERRow userRow = (CMNUserDataSet.T_CMN001_USERRow)userDS.T_CMN001_USER.Rows[0];
            userRow.LOGINID = loginID;
            userRow.USER_NAME = userName;
            userRow.EMAIL_ADDRESS = email;
            userRow.USER_ROLE_ARR = userRole;

            _userBC.UpdateTable(userDS.T_CMN001_USER);
            // end of add new event

            gvwUsers.EditIndex = -1;
            // Rebind Grid view
            this.UserDataBind();
        }

        // Deleting event
        protected void DeleteUser(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            String userId = lnkRemove.CommandArgument;

            _userBC.DeleteUserByID(userId);
            // Rebind Grid view
            this.UserDataBind();
        }
        #endregion

    }
}