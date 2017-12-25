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
    /// Summary description for JsonMNewCourses
    /// </summary>
    public class JsonMNewCourses : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<CourseDTO> courseList = new List<CourseDTO>();

            CourseBCService _bc = new CourseBCService();
            DataTable courseDT = _bc.getNewCourses();
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

                courseList.Add(course);
            }
            
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
            public string CourseDetail { get; set; }
            public string CourseRegURL { get; set; }
        }
    }
}