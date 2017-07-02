using Onecalendar.BusinessEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
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

        public DataSet getAllCoursesCourseEvents()
        {
            return QueryEventDataSetWithParameters(SPNameConstants.P_QUERY_ALL_COURSES_EVENTS);
        }

        public DataTable getCourseViewById(String courseID)
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_COURSE_BY_ID_FOR_VIEW, courseID);
        }

        public DataTable getCourseEventByCourseId(String courseID)
        {
            return QueryDataTableWithParameters(SPNameConstants.P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW, courseID);
        }

        public void DeleteCourseByID(String courseID)
        {
            UpdateSPWithParameters(SPNameConstants.P_DELETE_COURSE_BY_ID, courseID);
        }

        public DataSet getCourseDataSetById(String courseID)
        {
            return QueryDataSetWithParameters(SPNameConstants.P_QUERY_COURSE_BY_ID_FOR_VIEW, courseID);
        }

        public Onecalendar.BusinessEntity.BIZCourseDataSet getEventDataSetById(string eventId)
        {
            BIZCourseDataSet ds = new BIZCourseDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_EVENT_BY_EVENT_ID);
            this.Helper.AssignParameterValues(cmd, eventId);
            this.Helper.Fill(ds.T_BIZ002_COURSE_EVENT, cmd);
            return ds;
        }

        public void DeleteCourseEventByID(string eventId)
        {
            UpdateSPWithParameters(SPNameConstants.P_DELETE_COURSE_EVENT_BY_ID, eventId);
        }

        public BIZCourseDataSet getCourseDSEventByCourseId(string courseId)
        {
            BIZCourseDataSet ds = new BIZCourseDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_COURSE_EVENTS_BY_ID_FOR_VIEW);
            this.Helper.AssignParameterValues(cmd, courseId);
            this.Helper.Fill(ds.T_BIZ002_COURSE_EVENT, cmd);
            return ds;
        }

        internal DataTable getCoursesByCriteria(String startDttm, String endDttm)
        {
            BIZCourseDataSet ds = new BIZCourseDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_COURSE_BY_DATETIME);
            this.Helper.AssignParameterValues(cmd, startDttm, endDttm);
            this.Helper.Fill(ds.T_BIZ001_COURSE, cmd);
            return ds.T_BIZ001_COURSE;
        }

        internal DataTable getCoursesByFreetext(string searchKey)
        {
            BIZCourseDataSet ds = new BIZCourseDataSet();
            DbCommand cmd = this.Helper.BuildDbCommand(SPNameConstants.P_QUERY_COURSE_BY_FREE_TEXT);
            this.Helper.AssignParameterValues(cmd, searchKey);
            this.Helper.Fill(ds.T_BIZ001_COURSE, cmd);
            return ds.T_BIZ001_COURSE;
        }
    }
}
