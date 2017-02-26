﻿using Onecalendar.BusinessEntity;
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

        public DataTable getCoursesByCriteria(String startDttm, String endDttm)
        {
            return _da.getCoursesByCriteria(startDttm, endDttm);
        }
    }
}
