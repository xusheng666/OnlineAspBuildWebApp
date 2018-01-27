using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TuitionPedia
{
    public class RestForWit
    {
        RestService m_helper;
        WebHeaderCollection headers;

        string wit_url = "https://api.wit.ai/message?v=20/12/2017";

        public RestForWit()
        {

            m_helper = new RestService();
            headers = new WebHeaderCollection();
            headers["Authorization"] = "Bearer CP3CQQTLQE6OFM272PNVYQ5I6CLGSH6J";
        }

        public WitReply SendChatBotMessage(DateTime now, string msg)
        {
            System.Threading.Thread.Sleep(100);

            var param = "";

            wit_url = wit_url + "&q=" + RestService.FormatTextForJSON(msg);


            WitReply reply;

            try
            {
                string value = m_helper.CallRestService(wit_url, "GET", param, headers);
                reply = new WitReply(value);
            }
            catch (Exception ex)
            {
                reply = new WitReply(ex);
            }

            return reply;
        }

        public WitReply GetIntroduction()
        {
            var s = new WitReply("");
            return s;

        }
    }

    public class RestForTitionPublish
    {
        RestService m_helper;
        WebHeaderCollection headers;

        string url = "http://35.185.135.144/Tuition/Handler/JsonAPICourseQuery.ashx?";

        public RestForTitionPublish()
        {
            m_helper = new RestService();
            headers = new WebHeaderCollection();
            //headers["Authorization"] = "Bearer CP3CQQTLQE6OFM272PNVYQ5I6CLGSH6J";
        }

        public TuitionPublishReply GetTutionPayment(string subject, string location)
        {
            string urlp = url
                + "&CourseName=" + subject
                + "&Location=" + location;

            string json = m_helper.CallRestService(urlp, "GET", null);


            return new TuitionPublishReply("");
        }
    }



    public class TuitionPublishReply : JSONReply
    {
        public TuitionPublishReply(string json_raw)
            : base(json_raw)
        {
        }

        public TuitionPublishReply(Exception error)
            : base(error)
        {
        }
    }


    public class WitReply : JSONReply
    {
        string m_chatReply;

        public WitReply()
            : base("")
        {
        }

        public WitReply(string json_raw)
            : base(json_raw)
        {
            var data = CalOneBotData.FromJson(json_raw);
            m_chatReply = IntentManager.ProcessChatBotMessage(data);
        }

        public WitReply(Exception error)
            : base(error)
        {
        }

        public string chatReply
        {
            get
            {
                if (!string.IsNullOrEmpty(m_chatReply))
                    return m_chatReply;

                return "I don't understand!";
            }
        }

        public string chatIntroduction
        {
            get
            {
                return WitContants.chatbot_introduction;
            }
        }
    }

    public class JSONReply
    {
        string m_json_raw;
        Exception m_ex = null;
        JObject DataJObject = null;

        public string JSON_Raw { get { return m_json_raw; } }
        public Exception Error { get { return m_ex; } }


        public JSONReply(string json_raw)
        {
            m_json_raw = json_raw;
            try
            {
                DataJObject = JObject.Parse(json_raw);
                //m_chatReply = IntentManager.ProcessChatBotMessage(data);
            }
            catch (Exception ex) { }
        }

        public JSONReply(Exception error)
        {
            m_ex = error;
        }
    }


    public class WitData
    {
        public class WitEntity
        {
            public double confidence { get; set; }
            public string value { get; set; }
            public string type { get; set; }
        }

        public string _text { get; set; }
        public IList<WitEntity> entities { get; set; }
        public string msg_id { get; set; }

        public WitData(JObject data)
        {

            if (data == null)
                return;

            if (data.Count > 0)
            {

            }
        }
    }
}
