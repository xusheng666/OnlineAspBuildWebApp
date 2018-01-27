using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using ChatBot.Framework;
using TuitionPedia;
using System.Net;

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

            String question = String.IsNullOrEmpty(context.Request.QueryString["question"]) ? "Invalid" : context.Request.QueryString["question"];
            RestForWit wit = new RestForWit();
            string reply = wit.returnRestForWit(question);

            Activity returnMsg = new Activity() {
                Text = reply,
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

    public class RestForWit
    {
        RestService m_helper;
        WebHeaderCollection headers;

        string wit_url = "https://api.wit.ai/message?v=20/12/2017";

        public String returnRestForWit(string msg)
        {

            m_helper = new RestService();
            headers = new WebHeaderCollection();
            headers["Authorization"] = "Bearer CP3CQQTLQE6OFM272PNVYQ5I6CLGSH6J";

            string param = "";

            wit_url = wit_url + "&q=" + RestService.FormatTextForJSON(msg);


            string reply = string.Empty;

            try
            {
                var json = m_helper.CallRestService(wit_url, "GET", param, headers);

                WitReply witreply = new WitReply(json);

                reply = witreply.chatReply;

                //reply = witreply.chatReply;
                //reply = new WitReply(value);
            }
            catch (Exception ex)
            {
                reply = ex.Message;
            }

            return reply;
        }

        
    }
}