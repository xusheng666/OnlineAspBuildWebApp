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
    public partial class _Default : Page
    {
        CourseBCService _bc = new CourseBCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindListView();
            }
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCourses.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindListView();
        }

        private void BindListView()
        {
            DataTable dt = _bc.getAllCourses() as DataTable;

            this.lvCourses.DataSource = dt;
            this.lvCourses.DataBind();
        }

        protected void lvCourses_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
           String courseId=  e.CommandArgument.ToString();
           if (!String.IsNullOrEmpty(courseId))
           {
               Response.Redirect("~/Public/CourseDetailView.aspx?"+QueryStringNames.QUERY_STR_COURSE_ID+"="+courseId);
           }
        }
    }
}