using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OneCalendar.BusinessComponent.DataAccess
{
    public class CourseDA : DataAccessBase
    {
        public DataTable getCoursesViewDataTable()
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_COURSES_FOR_VIEW);
        }
    }
}
