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
        public DataTable getNewCourses()
        {
            return _da.getMNewCoursesViewDataTable();
        }
        public DataTable getCoursesForPublish()
        {
            return _da.getCoursesPublishDataTable();
        }
        public DataSet getAllCourseEvents()
        {
            return _da.getAllCoursesCourseEvents();
        }
        public DataTable getCourseById(String courseid)
        {
            return _da.getCourseViewById(courseid);
        }

        public DataSet getCourseDataSetById(String courseid)
        {
            return _da.getCourseDataSetById(courseid);
        }
        public void DeleteCourseByID(String courseid)
        {
            _da.DeleteCourseByID(courseid);
        }

        public DataTable getCourseEventByCourseId(string courseId)
        {
            return _da.getCourseEventByCourseId(courseId);
        }

        public BIZCourseDataSet getCourseDSEventByCourseId(string courseId)
        {
            return _da.getCourseDSEventByCourseId(courseId);
        }

        public BIZCourseDataSet getEventDataSetById(string eventId)
        {
            return _da.getEventDataSetById(eventId);
        }

        public void DeleteCourseEventByID(String eventId)
        {
            _da.DeleteCourseEventByID(eventId);
        }

        public DataTable getCoursesByCriteria(String searchKey, String startDttm, String endDttm, String userID)
        {
            return _da.getCoursesByCriteria(searchKey, startDttm, endDttm, userID);
        }

        public DataTable getCoursesByParameter(String category, String location, String orderby)
        {
            return _da.getCoursesByParameter(category, location, orderby);
        }

        public DataTable getCoursesByFreetext(string searchKey)
        {
            return _da.getCoursesByFreetext(searchKey);
        }


        public DataTable getCoursesByCriteriaAdmin(string decodeKey, string startDttmTxt, string endDttmTxt)
        {
            return _da.getCoursesByCriteriaAdmin(decodeKey, startDttmTxt, endDttmTxt);
        }
    }
}
