using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ChatBot.Framework;

namespace Onecalendar.WebPortal.Handler
{
    /// <summary>
    /// Summary description for JSonFormatCourses
    /// </summary>
    public class JsonChatbotMessages : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string keyword = string.Empty;
            DataTable courseDT = new DataTable();
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;

            Activity returnMsg = new Activity() {
                Text = "Happy New Year",
                Type = ActivityTypes.Message,
                ChannelId = "Channel1",
                Id = Guid.NewGuid().ToString(),
                Recipient = new Member() { Id = "781ajk076fln20n86", Name = "Bot" },
                From = new Member() { Id = "default-user", Name = "@coco" },
                Timestamp = DateTime.UtcNow.ToString("o"),
                LocalTimestamp = DateTime.Now.ToString("o"),
                Conversation = new Conversation() { Id = "3kcmig40nn8hiiad3" },
                ServiceUrl = "http://localhost:44338"
            };

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer =
             new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(returnMsg);
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