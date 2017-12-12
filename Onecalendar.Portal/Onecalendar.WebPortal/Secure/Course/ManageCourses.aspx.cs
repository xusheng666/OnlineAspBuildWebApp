using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using OneCalendar.BusinessComponent.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal
{
    public partial class ManageCourses : InternetPageBase
    {
        CourseBCService _bc = new CourseBCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CourseDataBind();
            }
        }

        private void CourseDataBind()
        {
            //String companyId = GetLoginCompanyID();
            DataTable dt = _bc.getCoursesForPublish() as DataTable;
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();

            // set the from date to end date
            this.tbStartDttm.Text = System.DateTime.Now.AddMonths(-1).ToString(Constants.DateTimeFormat.searchDateTimeFormat);
            //this.tbEndDttm.Text = System.DateTime.Now.AddMonths(3).ToString(Constants.DateTimeFormat.searchDateTimeFormat);
        }

        protected void lnkPublish(Object sender, CommandEventArgs e)
        {
            UpdateCourse(e, Constants.CourseStatus.APPROVED);
        }

        protected void lnkUnPublish(Object sender, CommandEventArgs e)
        {
            UpdateCourse(e, Constants.CourseStatus.PENDING);
        }

        private void UpdateCourse(CommandEventArgs e, String action)
        {
            String courseId = e.CommandArgument.ToString();
            if (!String.IsNullOrEmpty(courseId))
            {
                BIZCourseDataSet courseDS = (BIZCourseDataSet)_bc.getCourseDataSetById(courseId);
                if (courseDS.T_BIZ001_COURSE.Rows.Count>0)
                {
                    BIZCourseDataSet.T_BIZ001_COURSERow courseRow = (BIZCourseDataSet.T_BIZ001_COURSERow)courseDS.T_BIZ001_COURSE.Rows[0];
                    courseRow.STATUS = action;

                    _bc.UpdateTable(courseDS.T_BIZ001_COURSE);

                    ShowMessage("Record Updated!", MessageSeverity.Information);
                }
                
            }
            CourseDataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string searchKey = this.searchKey.Text;
            string decodeKey = HttpUtility.HtmlDecode(searchKey);

            string startDttmTxt = this.tbStartDttm.Text;
            string endDttmTxt = this.tbEndDttm.Text;

            dt = _bc.getCoursesByCriteriaAdmin(decodeKey, startDttmTxt, endDttmTxt) as DataTable;
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();
        }

        /// <summary>
        /// paging
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwDash.PageIndex = e.NewPageIndex;
            gvwDash.DataBind();
        }

        
    }
}