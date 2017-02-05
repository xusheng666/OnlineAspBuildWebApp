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
        public DataTable getCourseViewById(String courseID)
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_COURSE_BY_ID_FOR_VIEW, courseID);
        }

        public void DeleteCourseByID(String courseID)
        {
            UpdateSPWithParameters(SPNameConstants.P_DELETE_COURSE_BY_ID, courseID);
        }

        public DataSet getCourseDataSetById(String courseID)
        {
            return QueryDataSetWithParameters(SPNameConstants.P_QUERY_COURSE_BY_ID_FOR_VIEW, courseID);
        }
    }
}
