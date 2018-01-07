using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Onecalendar.WebPortal.Handler;

namespace Onecalendar.WebPortal.Handler
{
    /// <summary>
    /// Summary description for JsonQueryParameter
    /// </summary>
    public class JsonQueryParameter : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            IList<JSonFormatCourses.CourseDTO> tasksList = new List<JSonFormatCourses.CourseDTO>();
            // from mobile it will pass in the FULL or the real search key. if it's null means invalid will return null list.
            String category = String.IsNullOrEmpty(context.Request.QueryString["category"]) ? "Invalid" : context.Request.QueryString["category"];
            String location = String.IsNullOrEmpty(context.Request.QueryString["location"]) ? "Invalid" : context.Request.QueryString["location"];
            String orderby = String.IsNullOrEmpty(context.Request.QueryString["orderby"]) ? "NoSort" : context.Request.QueryString["orderby"];// will be date or title

            
            CourseBCService _bc = new CourseBCService();
            DataTable courseDT = _bc.getCoursesByParameter(category, location, orderby);

            JSonFormatCourses jfc = new JSonFormatCourses();
            jfc.CastDataTable2TaskList(courseDT, tasksList, _bc);
            

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(tasksList);
            context.Response.Write(sJSON);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}