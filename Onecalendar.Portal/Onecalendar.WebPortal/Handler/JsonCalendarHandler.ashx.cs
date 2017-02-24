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
    /// Summary description for JsonCalendarHandler
    /// </summary>
    public class JsonCalendarHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<CalendarDTO> tasksList = new List<CalendarDTO>();
            CourseBCService _bc = new CourseBCService();
            BIZCourseDataSet eventDS = (BIZCourseDataSet)_bc.getAllCourseEvents();

            foreach (BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow eventRow in eventDS.T_BIZ002_COURSE_EVENT.Rows)
            {
                tasksList.Add(new CalendarDTO
                {
                    id = 1,
                    title = eventRow.SCHEDULE,
                    start = ConvertToDateString(eventRow.START_DTTM),
                    end = ConvertToDateString(eventRow.END_DTTM),
                    url = ""
                });
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
        public class CalendarDTO
        {
            public int id { get; set; }
            public string title { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            public string url { get; set; }
        }
    }
}