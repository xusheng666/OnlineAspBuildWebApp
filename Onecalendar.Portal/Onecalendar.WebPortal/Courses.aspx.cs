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
    public partial class Courses : System.Web.UI.Page
    {
        CourseBCService _bc = new CourseBCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = _bc.getAllCourses() as DataTable;
            dt.Columns.Add(new DataColumn("PictureURL", typeof(string)));
            foreach (DataRow row in dt.Rows)
            {
                row["PictureURL"] = ResolveUrl("~/Content/images/img7.jpg");
            }
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }
    }
}