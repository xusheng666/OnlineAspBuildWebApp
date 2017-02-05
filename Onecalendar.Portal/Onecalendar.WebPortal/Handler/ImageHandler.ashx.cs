using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Onecalendar.WebPortal.Handler
{
    /// <summary>
    /// Summary description for ImageHandler
    /// write below code in your cs file
    /// uploadedImage.ImageUrl = "~/MyImageHandler.ashx?filename=foo.png" //in ur server code.
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "image/png";

            var filepath = @"E:\your_image_dir\" + context.Request.QueryString["filename"];

            //Ensure you have permissions else the below line will throw exception.
            context.Response.WriteFile(filepath);
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