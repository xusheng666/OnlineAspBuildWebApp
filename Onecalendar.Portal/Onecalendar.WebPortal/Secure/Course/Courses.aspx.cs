using OneCalendar.BusinessComponent;
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
    }
}