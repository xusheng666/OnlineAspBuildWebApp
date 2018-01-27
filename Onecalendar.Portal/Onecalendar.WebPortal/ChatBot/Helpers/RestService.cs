using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TuitionPedia
{
    public class RestService
    {
        public dynamic CallRestService(string uri, string method, dynamic parms)
        {
            return CallRestService(uri, method, parms, null);
        }

        public dynamic CallRestService(string uri, string method, dynamic parms, WebHeaderCollection webHeaders)
        {
            try
            {
                var data = CallRestServiceMain(uri, method, parms, webHeaders);
                return data;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }

            return null;
        }

        public static string FormatTextForJSON(string value)
        {
            string value2 = System.Uri.EscapeDataString(value);
            return value2;
        }

        private dynamic CallRestServiceMain(string uri, string method, dynamic parms, WebHeaderCollection webHeaders)
        {

            if (parms == null)
                parms = "";
            method = method.ToUpper();

            var req = HttpWebRequest.Create(uri);
            req.Method = method;
            req.Headers = webHeaders;
            req.ContentType = "application/json";
            byte[] bytes = UTF8Encoding.UTF8.GetBytes(parms.ToString());
            req.ContentLength = bytes.Length;

            //IF POST - USE THE parms variable.
            if (method == "POST")
                using (var stream = req.GetRequestStream())
                {
                    stream.Write(bytes, 0, bytes.Length);
                }

            using (var resp = req.GetResponse())
            {
                string results = new StreamReader(resp.GetResponseStream()).ReadToEnd();

                return results;
            }

        }
    }
}
