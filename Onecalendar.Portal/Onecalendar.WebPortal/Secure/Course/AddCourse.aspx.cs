using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Onecalendar.WebPortal.Secure.Course
{
    public partial class AddCourse : InternetPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                ShowMessage("Please login to proceed this function!", MessageSeverity.Error);
            }
            else
            {
                BIZCourseDataSet courseDS = new BIZCourseDataSet();
                BIZCourseDataSet.T_BIZ001_COURSERow courseRow = courseDS.T_BIZ001_COURSE.NewT_BIZ001_COURSERow();
                courseRow.COURSEID = Utility.NewDataKey();
                courseRow.USERID = HttpContext.Current.User.Identity.Name;
                courseRow.COURSE_NAME = this.courseName.Text;
                courseRow.COURSE_DETAIL = this.description.Text;
                courseRow.COURSE_TAG = this.courseTag.Text;
                
                if (fileUpload.HasFile)
                {
                    string fileName = fileUpload.FileName;
                    string filePath = SaveFileToDisk(fileUpload.FileBytes, fileName, courseRow.USERID);

                    courseRow.COURSE_FILENAME = fileName;
                    courseRow.COURSE_IMAGEPATH = filePath;
                }

                Utility.UpdateCommonFields(courseRow);
                courseDS.T_BIZ001_COURSE.AddT_BIZ001_COURSERow(courseRow);
                
                _bc.UpdateTable(courseDS.T_BIZ001_COURSE);

                Response.Redirect("~/Secure/Course/Courses.aspx");
            }
        }

        
    }
}