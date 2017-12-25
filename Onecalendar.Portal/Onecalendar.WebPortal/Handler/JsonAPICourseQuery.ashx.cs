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
    /// Summary description for JsonAPICourseQuery
    /// </summary>
    public class JsonAPICourseQuery : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<CourseDTO> courseList = new List<CourseDTO>();

            CourseDTO course = new CourseDTO
            {
                CourseID = "1",
                CourseName = "English Weedend",
                CourseDateTime = DateTime.Now.ToString(),
                CourseCompany = "Tution1",
                CoursePrice = "150",
                CourseBarnchName = "East Branch",
                CourseSchedule = "Each Sunday",
                CourseSubject = "English",
                CourseLocation = "Jurong East"
            };
            CourseDTO course2 = new CourseDTO
            {
                CourseID = "2",
                CourseName = "Math Weekday",
                CourseDateTime = DateTime.Now.ToString(),
                CourseCompany = "Tution2",
                CoursePrice = "100",
                CourseBarnchName = "West Branch",
                CourseSchedule = "Each Monday",
                CourseSubject = "Math",
                CourseLocation = "Jurong West"
            };
            courseList.Add(course);
            courseList.Add(course2);

            //CourseBCService _bc = new CourseBCService();
            //DataTable courseDT = _bc.getAllCourses();

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(courseList);
            context.Response.Write(sJSON);
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
            public string CourseLocation { get; set; }
            public string CourseCompany { get; set; }
            public string CourseBarnchName { get; set; }
            public string CoursePrice { get; set; }
            public string CourseSubject { get; set; }
            public string CourseDateTime { get; set; }
            public string CourseSchedule { get; set; }
        }
    }
}