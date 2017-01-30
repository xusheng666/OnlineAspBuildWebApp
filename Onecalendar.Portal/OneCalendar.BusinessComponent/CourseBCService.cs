using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent
{
    public class CourseBCService : InternetBusinessComponentBase
    {
        CourseDA _da = new CourseDA();
        public DataTable getAllCourses()
        {
            return _da.getCoursesViewDataTable();
        }
    }
}
