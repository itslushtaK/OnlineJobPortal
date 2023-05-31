using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineJobPortal.User
{
    public partial class JobListing : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int jobCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showJobList();
                RBSelectedColorChange();
            }
        }



        private void showJobList()
        {
            con = new SqlConnection(str);
            string query = @"Select JobId, Title, Salary, JobType, CompanyName, State, CreateDate from Jobs";
            cmd = new SqlCommand(query, con);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            DataList1.DataSource = dt.DefaultView; // Use DefaultView to bind DataRowView objects
            DataList1.DataBind();
            lbljobCount.Text = JobCount(dt.Rows.Count);

        }

        string JobCount(int count)
        {
            if (count > 1)
            {
                return "Total <b>" + count + "</b> Jobs Found";
            }
            else if (count == 1)
            {
                return "Total <b>" + count + "</b> job found";
            }
            else
            {
                return "No jobs found";
            }
        }


        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~{0}");
            }
            return ResolveUrl(url1);
        }
        // Getting RelativeDate for given date like -- '1 month ago'

        public static string RelativeDate(DateTime theDate)

        {

            Dictionary<long, string> thresholds = new Dictionary<long, string>();

            int minute = 60;

            int hour = 60 * minute;

            int day = 24 * hour;

            thresholds.Add(60, "{0} seconds ago");

            thresholds.Add(minute * 2, "a minute ago");

            thresholds.Add(45 * minute, "{0} minutes ago");

            thresholds.Add(120 * minute, "an hour ago");

            thresholds.Add(day, "{0} hours ago");

            thresholds.Add(day * 2, "yesterday");

            thresholds.Add(day * 30, "{0} days ago");

            thresholds.Add(day * 365, "{0} months ago");

            thresholds.Add(long.MaxValue, "{0} years ago");

            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;

            foreach (long threshold in thresholds.Keys)

            {

                if (since < threshold)

                {

                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));

                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());

                }

            }

            return "";

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbFilter_Click(object sender, EventArgs e)
        {

        }

        protected void lbReset_Click(object sender, EventArgs e)
        {

        }
         void RBSelectedColorChange()
        {
            throw new NotImplementedException();
        }
    }
}