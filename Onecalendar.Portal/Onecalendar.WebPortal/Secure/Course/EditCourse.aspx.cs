using Onecalendar.BusinessEntity;
using OneCalendar.BusinessComponent;
using OneCalendar.BusinessComponent.Common;
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
                    if (course.Rows.Count > 0)
                    {
                        courseName.Text = course.Rows[0]["COURSE_NAME"].ToString();
                        description.Text = course.Rows[0]["COURSE_DETAIL"].ToString();
                        this.image.ImageUrl = course.Rows[0]["COURSE_IMAGEPATH"].ToString();
                        courseTag.Text = course.Rows[0]["COURSE_TAG"].ToString();

                        this.EventDataBind();
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
                courseRow.COURSE_TAG = this.courseTag.Text;

                _bc.UpdateTable(courseDS.T_BIZ001_COURSE);

                ShowMessage("Update Successfully!", MessageSeverity.Information);

                Response.Redirect("~/Secure/Course/Courses.aspx");
            }
        }

        protected void EventDataBind()
        {
            string courseId = ViewState["CourseId"].ToString();

            // Create Data Table
            DataTable dt = new DataTable();
            dt.Columns.Add("COURSEEVENTID", typeof(string));
            dt.Columns.Add("SCHEDULE", typeof(string));
            dt.Columns.Add("LOCATION", typeof(string));
            dt.Columns.Add("PRICE", typeof(string));
            dt.Columns.Add("START_DTTM", typeof(string));
            dt.Columns.Add("END_DTTM", typeof(string));

            // fetch the events under this course
            DataTable courseEvents = _bc.getCourseEventByCourseId(courseId);
            if (courseEvents.Rows.Count == 0)
            {
                dt.Rows.Add(dt.NewRow());// to display the gridview
                gvwCourseEvents.DataSource = dt;
                gvwCourseEvents.DataBind();

                gvwCourseEvents.Columns[6].Visible = false;
                foreach (GridViewRow row in gvwCourseEvents.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        LinkButton lb = ((LinkButton)row.FindControl("lnkRemove"));
                        lb.Visible = false;
                    }
                }
            }
            else
            {// for have existing records
                foreach (DataRow item in courseEvents.Rows)
                {
                    dt.Rows.Add(item["COURSEEVENTID"], item["SCHEDULE"], item["LOCATION"], item["Price"], item["START_DTTM"], item["END_DTTM"]);
                }

                this.gvwCourseEvents.DataSource = courseEvents;
                this.gvwCourseEvents.DataBind();

                if (gvwCourseEvents.Rows.Count > 0)
                {
                    gvwCourseEvents.UseAccessibleHeader = true;
                    gvwCourseEvents.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                gvwCourseEvents.Columns[6].Visible = true;
            }
        }

        #region gridview controls
        /// <summary>
        /// 
        /// below are for the gridview controls
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        // This event is raised when the Cancel button of a row in edit mode is clicked, 
        //but before the row exits edit mode
        protected void gvwDash_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvwCourseEvents.EditIndex = -1;
            EventDataBind();
        }

        protected void gvwDash_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvwCourseEvents.EditIndex = e.NewEditIndex;
            EventDataBind();
        }

        // Adding new Event
        protected void AddNewEvent(object sender, EventArgs e)
        {
            string eventSchedule = ((TextBox)gvwCourseEvents.FooterRow.FindControl("txtNewSchedule")).Text;
            string eventLocation = ((TextBox)gvwCourseEvents.FooterRow.FindControl("txtNewLocation")).Text;
            string eventPrice = ((TextBox)gvwCourseEvents.FooterRow.FindControl("txtNewPrice")).Text;
            string eventStartDttm = ((TextBox)gvwCourseEvents.FooterRow.FindControl("txtNewStartDttm")).Text;
            string eventEndDttm = ((TextBox)gvwCourseEvents.FooterRow.FindControl("txtNewEndDttm")).Text;

            // below to add new event
            string courseId = ViewState["CourseId"].ToString();
            BIZCourseDataSet courseDS = new BIZCourseDataSet();
            BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow courseRow = courseDS.T_BIZ002_COURSE_EVENT.NewT_BIZ002_COURSE_EVENTRow();
            courseRow.COURSEEVENTID = Utility.NewDataKey();
            courseRow.COURSEID = courseId;
            courseRow.SCHEDULE = eventSchedule;
            courseRow.LOCATION = eventLocation;
            courseRow.PRICE = eventPrice;
            courseRow.START_DTTM = DateTimeUtil.parseToDateTime(eventStartDttm);
            courseRow.END_DTTM = DateTimeUtil.parseToDateTime(eventEndDttm);

            Utility.UpdateCommonFields(courseRow);
            courseDS.T_BIZ002_COURSE_EVENT.AddT_BIZ002_COURSE_EVENTRow(courseRow);

            _bc.UpdateTable(courseDS.T_BIZ002_COURSE_EVENT);
            // end of add new event

            // Rebind Grid view
            this.EventDataBind();
        }

        // Updating a event
        protected void gvwDash_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string eventId = ((Label)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtEventId")).Text;
            string eventSchedule = ((TextBox)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtSchedule")).Text;
            string eventLocation = ((TextBox)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtLocation")).Text;
            string eventPrice = ((TextBox)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtPrice")).Text;
            string eventStartDttm = ((TextBox)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtStartDttm")).Text;
            string eventEndDttm = ((TextBox)gvwCourseEvents.Rows[e.RowIndex].FindControl("txtEndDttm")).Text;

            // update event start
            BIZCourseDataSet eventDS = _bc.getEventDataSetById(eventId);

            BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow eventRow = (BIZCourseDataSet.T_BIZ002_COURSE_EVENTRow)eventDS.T_BIZ002_COURSE_EVENT.Rows[0];
            eventRow.SCHEDULE = eventSchedule;
            eventRow.LOCATION = eventLocation;
            eventRow.PRICE = eventPrice;
            eventRow.START_DTTM = DateTimeUtil.parseToDateTime(eventStartDttm);
            eventRow.END_DTTM = DateTimeUtil.parseToDateTime(eventEndDttm);

            _bc.UpdateTable(eventDS.T_BIZ002_COURSE_EVENT);
            // end of add new event

            gvwCourseEvents.EditIndex = -1;
            // Rebind Grid view
            this.EventDataBind();
        }

        // Deleting event
        protected void DeleteEvent(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            String eventId = lnkRemove.CommandArgument;

            _bc.DeleteCourseEventByID(eventId);
            // Rebind Grid view
            this.EventDataBind();
        }
        #endregion

        protected void btnBackCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Secure/Course/Courses.aspx");
        }
    }
}