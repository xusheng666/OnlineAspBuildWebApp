using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Secure.Course
{
    public partial class EditCourse : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string courseId = GetQueryParameterValue(QueryStringNames.QUERY_STR_COURSE_ID);
                ViewState["CourseId"] = courseId;
                if (!String.IsNullOrEmpty(courseId))
                {
                    DataTable course = _bc.getCourseById(courseId);
                    if (course.Rows.Count>0)
                    {
                        courseName.Text = course.Rows[0]["COURSE_NAME"].ToString();
                        description.Text = course.Rows[0]["COURSE_DETAIL"].ToString();
                        this.image.ImageUrl = course.Rows[0]["COURSE_IMAGEPATH"].ToString();
                    }
                    else
                    {
                        ShowMessage("No Course Found!", MessageSeverity.Information);
                    }
                }
                
            }
        }

        protected void btnUpdateCourse_Click(object sender, EventArgs e)
        {
            string courseId = ViewState["CourseId"].ToString();
            if (!string.IsNullOrEmpty(courseId))
            {
                BIZCourseDataSet courseDS = (BIZCourseDataSet)_bc.getCourseDataSetById(courseId);
                BIZCourseDataSet.T_BIZ001_COURSERow courseRow = (BIZCourseDataSet.T_BIZ001_COURSERow)courseDS.T_BIZ001_COURSE.Rows[0];
                if (fileUpload.HasFile)
                {
                    string fileName = fileUpload.FileName;
                    string filePath = SaveFileToDisk(fileUpload.FileBytes, fileName, courseRow.USERID);

                    courseRow.COURSE_FILENAME = fileName;
                    courseRow.COURSE_IMAGEPATH = filePath;
                }
                courseRow.COURSE_DETAIL = this.description.Text;
                courseRow.COURSE_NAME = this.courseName.Text;

                _bc.UpdateTable(courseDS.T_BIZ001_COURSE);

                ShowMessage("Update Successfully!", MessageSeverity.Information);

                Response.Redirect("~/Secure/Course/Courses.aspx");
            }
           
        }

        protected void gvwDash_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvwDash_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvwDash_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvwDash_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gvwDash_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvwDash_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}