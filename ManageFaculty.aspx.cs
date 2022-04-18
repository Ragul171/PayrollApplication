using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace PayrollApplication
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                PopulateGrid();
            }

        }
        void PopulateGrid()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT EmpId,EmpName,EmpDob,EmpAddress,EmpMobile,EmpEmail FROM Employee", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                dr.Close();
                empGrid.DataSource = dt;
                empGrid.DataBind();
                conn.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void empGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            empGrid.EditIndex = e.NewEditIndex;
            PopulateGrid();
        }

        protected void empGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            empGrid.EditIndex = -1;
            PopulateGrid();
        }

        protected void empGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                string query = @"UPDATE Employee SET EmpMobile=@Emp_Mobile,EmpEmail=@Emp_Email WHERE EmpId=@Emp_Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Emp_Mobile", (empGrid.Rows[e.RowIndex].FindControl("txtEmpMobile") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Email", (empGrid.Rows[e.RowIndex].FindControl("txtEmpEmail") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Id", Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value.ToString()));
                int n = cmd.ExecuteNonQuery();
                empGrid.EditIndex = -1;
                Console.WriteLine(n);
                PopulateGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }

        protected void empGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                string query = @"DELETE FROM Employee WHERE EmpId=@Emp_Id";
                string query1 = @"DELETE FROM Deduction WHERE EmpId=@Emp_Id";
                string query2 = @"DELETE FROM Salary WHERE EmpId=@Emp_Id";
                SqlCommand cmd1 = new SqlCommand(query1, conn);
                cmd1.Parameters.AddWithValue("@Emp_Id", Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value.ToString()));
                cmd1.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                cmd2.Parameters.AddWithValue("@Emp_Id", Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value.ToString()));
                cmd2.ExecuteNonQuery();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Emp_Id", Convert.ToInt32(empGrid.DataKeys[e.RowIndex].Value.ToString()));
                int n = cmd.ExecuteNonQuery();
                
                
                empGrid.EditIndex = -1;
                Console.WriteLine(n);
                PopulateGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }
    }
}