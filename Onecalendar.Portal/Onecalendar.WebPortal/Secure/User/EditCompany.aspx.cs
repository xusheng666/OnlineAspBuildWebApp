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
    public partial class EditCompany : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string companyId = GetQueryParameterValue(QueryStringNames.QUERY_STR_COMPANY_ID);
                ViewState[QueryStringNames.QUERY_STR_COMPANY_ID] = companyId;
                if (!String.IsNullOrEmpty(companyId))
                {
                    CMNUserDataSet course = _cmnBC.getCompanyDataSetById(companyId);
                    if (course.T_CMN003_COMPANY.Rows.Count > 0)
                    {
                        CMNUserDataSet.T_CMN003_COMPANYRow companyRow = (CMNUserDataSet.T_CMN003_COMPANYRow) course.T_CMN003_COMPANY.Rows[0];
                        companyName.Text = companyRow.COMPANY_NAME;
                        companyDetail.Text = companyRow.COMPANY_DETAIL;
                        contactInfo.Text = companyRow.COMPANY_CONTACT;
                        location.Text = companyRow.COMPANY_LOCATION;

                        this.UserDataBind();
                    }
                    else
                    {
                        ShowMessage("No Company Found!", MessageSeverity.Information);
                    }
                }
            }
        }

        protected void btnUpdateCompany_Click(object sender, EventArgs e)
        {
            string companyId = ViewState[QueryStringNames.QUERY_STR_COMPANY_ID].ToString();
            if (!string.IsNullOrEmpty(companyId))
            {
                CMNUserDataSet companyDS = (CMNUserDataSet)_cmnBC.getCompanyDataSetById(companyId);
                CMNUserDataSet.T_CMN003_COMPANYRow companyRow = (CMNUserDataSet.T_CMN003_COMPANYRow)companyDS.T_CMN003_COMPANY.Rows[0];
                companyRow.COMPANY_NAME = this.companyName.Text;
                companyRow.COMPANY_DETAIL = this.companyDetail.Text;
                companyRow.COMPANY_CONTACT = this.contactInfo.Text;
                companyRow.COMPANY_LOCATION = this.location.Text;

                _bc.UpdateTable(companyDS.T_CMN003_COMPANY);

                ShowMessage("Update Successfully!", MessageSeverity.Information);

                //Response.Redirect("~/Secure/User/ListCompany.aspx");
            }
        }

        protected void btnBackCompany_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/User/ListCompany.aspx");
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

            // fetch the users under this course
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

        #endregion
    }
}