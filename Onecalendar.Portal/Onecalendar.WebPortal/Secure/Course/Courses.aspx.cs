using OneCalendar.BusinessComponent;
using OneCalendar.BusinessComponent.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal
{
    public partial class Courses : InternetPageBase
    {
        CourseBCService _bc = new CourseBCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CourseDataBind();
            }
        }

        private void CourseDataBind()
        {
            //String companyId = GetLoginCompanyID();
            DataTable dt = _bc.getAllCourses() as DataTable;
            //dt.Columns.Add(new DataColumn("PictureURL", typeof(string)));
            //foreach (DataRow row in dt.Rows)
            //{
            //    row["PictureURL"] = ResolveUrl("~/Content/images/img7.jpg");
            //}
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();

            // set the from date to end date
            this.tbStartDttm.Text = System.DateTime.Now.AddMonths(-1).ToString(Constants.DateTimeFormat.searchDateTimeFormat);
            //this.tbEndDttm.Text = System.DateTime.Now.AddMonths(3).ToString(Constants.DateTimeFormat.searchDateTimeFormat);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/Course/AddCourse.aspx");
        }

        protected void lnkDelete(Object sender, CommandEventArgs e)
        {
            String courseId = e.CommandArgument.ToString();
            if (!String.IsNullOrEmpty(courseId))
            {
                _bc.DeleteCourseByID(courseId);
            }
            CourseDataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string searchKey = this.searchKey.Text;
            //if (!String.IsNullOrEmpty(searchKey) && !String.IsNullOrEmpty(searchKey.Trim()))
            //{
                string decodeKey = HttpUtility.HtmlDecode(searchKey);

                //dt = _bc.getCoursesByFreetext(decodeKey) as DataTable;

                string startDttmTxt = this.tbStartDttm.Text;
                string endDttmTxt = this.tbEndDttm.Text;
                if (!String.IsNullOrEmpty(startDttmTxt) && !String.IsNullOrEmpty(startDttmTxt.Trim()))
                {
                    DateTime startDttm = DateTimeUtil.parseToDateTime(startDttmTxt);
                    DateTime endDttm = DateTime.Now;
                    if (!String.IsNullOrEmpty(endDttmTxt) && !String.IsNullOrEmpty(endDttmTxt.Trim()))
                    {
                        endDttm = DateTimeUtil.parseToDateTime(endDttmTxt);
                    }
                    dt = _bc.getCoursesByCriteria(decodeKey, startDttmTxt, endDttmTxt) as DataTable;
                }
            //}
            //else
            //{
                
            //}
           
            this.gvwDash.DataSource = dt;
            this.gvwDash.DataBind();
        }

        protected void btnFreetextSearch_Click(object sender, EventArgs e)
        {
            string searchKey = this.searchKey.Text;
            if (!String.IsNullOrEmpty(searchKey) && !String.IsNullOrEmpty(searchKey.Trim()))
            {
                string decodeKey = HttpUtility.HtmlDecode(searchKey);

                DataTable dt = _bc.getCoursesByFreetext(decodeKey) as DataTable;

                this.gvwDash.DataSource = dt;
                this.gvwDash.DataBind();
            }
            
        }
        

        /// <summary>
        /// paging
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvwDash.PageIndex = e.NewPageIndex;
            gvwDash.DataBind();
        }

        
    }
}