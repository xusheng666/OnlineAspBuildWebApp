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
    public partial class Courses : InternetPageBase
    {
        CourseBCService _bc = new CourseBCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            CourseDataBind();
        }

        private void CourseDataBind()
        {
            DataTable dt = _bc.getAllCourses() as DataTable;
            //dt.Columns.Add(new DataColumn("PictureURL", typeof(string)));
            //foreach (DataRow row in dt.Rows)
            //{
            //    row["PictureURL"] = ResolveUrl("~/Content/images/img7.jpg");
            //}
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/Course/AddCourse.aspx");
        }

        protected void lnkDelete(Object sender, CommandEventArgs e)
        {
            String courseId = e.CommandArgument.ToString();
            if (!String.IsNullOrEmpty(courseId))
            {
                _bc.DeleteCourseByID(courseId);
            }
            CourseDataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string startDttmTxt = this.tbStartDttm.Text;
            string endDttmTxt = this.tbEndDttm.Text;

            DateTime startDttm = DateTimeUtil.parseToDateTime(startDttmTxt);
            DateTime endDttm = DateTimeUtil.parseToDateTime(endDttmTxt);

            DataTable dt = _bc.getCoursesByCriteria(startDttmTxt, endDttmTxt) as DataTable;

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