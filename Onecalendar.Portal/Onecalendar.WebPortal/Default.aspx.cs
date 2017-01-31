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
            DataTable dt = _bc.getAllCourses() as DataTable;

            this.lvCourses.DataSource = dt;
            this.lvCourses.DataBind();
        }
    }
}