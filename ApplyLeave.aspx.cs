using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayrollApplication
{
    public partial class ApplyLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
                fillLeaveTypesDrop();
        }
        private void fillLeaveTypesDrop()
        {
            //throw new NotImplementedException();
            drpLeaveTypes.DataSource = getLeaveTypes();
            drpLeaveTypes.DataTextField = "LeaveType";
            drpLeaveTypes.DataValueField = "LeaveId";
            drpLeaveTypes.DataBind();
        }
        public DataTable getLeaveTypes()
        {
            //throw new NotImplementedException();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
            SqlCommand cmd;
            SqlDataAdapter da;
            DataTable dt;
            conn.Open();
            cmd = new SqlCommand("getLeaveTypes", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        protected void ApplyLeave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                string query = @"INSERT INTO LeaveDetails (EmpId,LeaveId,FromDate,ToDate,Reason,Status)
                    VALUES(@EmpId,@LeaveId,@FromDate,@ToDate,@Reason,@Status)";
                SqlCommand cmd = new SqlCommand(query, conn);
                Console.WriteLine(Session["EmpId"]);
                cmd.Parameters.AddWithValue("@EmpId", Session["EmpId"]);
                cmd.Parameters.AddWithValue("@LeaveId", int.Parse(drpLeaveTypes.SelectedValue));
                cmd.Parameters.AddWithValue("@FromDate", txtFromDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Reason", txtReason.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.ExecuteNonQuery();
                txtFromDate.Text = "";
                txtToDate.Text = "";
                txtReason.Text = "";
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }

        protected void drpLeaveTypes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}