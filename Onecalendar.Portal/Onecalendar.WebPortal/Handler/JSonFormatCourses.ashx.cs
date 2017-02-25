using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Onecalendar.WebPortal.Handler
{
    /// <summary>
    /// Summary description for JSonFormatCourses
    /// </summary>
    public class JSonFormatCourses : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<CourseDTO> tasksList = new List<CourseDTO>();
            CourseBCService _bc = new CourseBCService();
            DataTable courseDT = _bc.getAllCourses();
            foreach (DataRow item in courseDT.Rows)
            {
                CourseDTO course = new CourseDTO
                {
                    courseID = item["COURSE_NAME"].ToString(),
                    courseName = item["COURSE_NAME"].ToString(),
                    courseDetail = item["COURSE_DETAIL"].ToString(),
                };

                BIZCourseDataSet eventDS = (BIZCourseDataSet)_bc.getCourseDSEventByCourseId(item["COURSEID"].ToString());

                List<EventDTO> eventList = new List<EventDTO>();
                foreach (BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow eventRow in eventDS.T_BIZ002_COURSE_EVENT.Rows)
                {
                    EventDTO eventTO = new EventDTO
                    {
                        id = eventRow.COURSEEVENTID,
                        schedule = eventRow.SCHEDULE,
                        location = eventRow.LOCATION,
                        startdttm = ConvertToDateString(eventRow.START_DTTM),
                        enddttm = ConvertToDateString(eventRow.END_DTTM),
                    };
                    eventList.Add(eventTO);
                }
                course.eventList = eventList;
                tasksList.Add(course);
            }
            


            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(tasksList);
            context.Response.Write(sJSON);
        }

        private long ToUnixTimespan(DateTime date)
        {
            TimeSpan tspan = date.ToUniversalTime().Subtract(
                new DateTime(1970, 1, 1, 0, 0, 0));

            return (long)Math.Truncate(tspan.TotalSeconds);
        }

        private string ConvertToDateString(DateTime value)
        {
            return value.ToString("yyyy-MM-ddTHH:mm:ss");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public class CourseDTO
        {
            public string courseID { get; set; }
            public string courseName { get; set; }
            public string courseDetail { get; set; }
            public List<EventDTO> eventList { get; set; }
        }
        public class EventDTO
        {
            public string id { get; set; }
            public string schedule { get; set; }
            public string location { get; set; }
            public string startdttm { get; set; }
            public string enddttm { get; set; }
            public string price { get; set; }
        }
    }
}