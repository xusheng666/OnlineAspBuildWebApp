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
            string keyword = string.Empty;
            DataTable courseDT = new DataTable();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<CourseDTO> tasksList = new List<CourseDTO>();
            CourseBCService _bc = new CourseBCService();

            if (context.Request.QueryString.Count >= 1)
            {
                keyword = context.Request.QueryString["Keyword"];
                courseDT = _bc.getCoursesByFreetext(keyword);
            }
            else
            {
                courseDT = _bc.getAllCourses();
            }
            CastDataTable2TaskList(courseDT, tasksList, _bc);

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(tasksList);
            context.Response.Write(sJSON);
        }

        public void CastDataTable2TaskList(DataTable courseDT, IList<CourseDTO> tasksList, CourseBCService _bc)
        {
            foreach (DataRow item in courseDT.Rows)
            {
                if (item["COURSEID"] == null || String.IsNullOrEmpty(item["COURSEID"].ToString()))
                {
                    continue;
                }
                CourseDTO course = new CourseDTO
                {
                    CourseID = item["COURSEID"].ToString(),
                    CourseName = item["COURSE_NAME"].ToString(),
                    CourseDetail = item["COURSE_DETAIL"].ToString(),
                    CourseRegURL = item["COURSE_REG_URL"].ToString()
                };

                BIZCourseDataSet eventDS = (BIZCourseDataSet)_bc.getCourseDSEventByCourseId(item["COURSEID"].ToString());

                List<EventDTO> eventList = new List<EventDTO>();
                foreach (BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow eventRow in eventDS.T_BIZ002_COURSE_EVENT.Rows)
                {
                    if (!String.IsNullOrEmpty(eventRow.COURSEEVENTID))
                    {
                        EventDTO eventTO = new EventDTO
                        {
                            Id = eventRow.COURSEEVENTID,
                            Schedule = eventRow.SCHEDULE,
                            Location = eventRow.LOCATION,
                            Startdttm = ConvertToDateString(eventRow.START_DTTM),
                            Enddttm = ConvertToDateString(eventRow.END_DTTM),
                        };
                        eventList.Add(eventTO);
                    }
                }
                course.EventList = eventList;
                tasksList.Add(course);
            }
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
            public string CourseID { get; set; }
            public string CourseName { get; set; }
            public string CourseDetail { get; set; }
            public string CourseRegURL { get; set; }
            public List<EventDTO> EventList { get; set; }
        }
        public class EventDTO
        {
            public string Id { get; set; }
            public string Schedule { get; set; }
            public string Location { get; set; }
            public string Startdttm { get; set; }
            public string Enddttm { get; set; }
            public string Price { get; set; }
        }
    }
}