using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Public
{
    public partial class CourseDetailView : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseId = GetQueryParameterValue(QueryStringNames.QUERY_STR_COURSE_ID);
                if (!String.IsNullOrEmpty(courseId))
                {
                    DataTable course = _bc.getCourseById(courseId);

                    if (course.Rows.Count>0)
                    {
                        courseName.Text = course.Rows[0]["COURSE_NAME"].ToString();
                        description.Text = course.Rows[0]["COURSE_DETAIL"].ToString();
                        this.image.ImageUrl = course.Rows[0]["COURSE_IMAGEPATH"].ToString();

                        // fetch the events under this course
                        DataTable courseEvents = _bc.getCourseEventByCourseId(courseId);
                        if (courseEvents.Rows.Count==0)
                        {
                            courseEvents = new DataTable();
                        }
                        this.gvwCourseEvents.DataSource = courseEvents;
                        this.gvwCourseEvents.DataBind();
                    }
                    else
                    {
                        ShowMessage("No Course Found!", MessageSeverity.Information);
                    }
                }
            }
        }

        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}