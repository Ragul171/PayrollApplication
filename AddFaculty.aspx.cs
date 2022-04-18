using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PayrollApplication
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                fillDepartmentDrop();
                fillDesignationDrop();
            }
        }
        private void fillDepartmentDrop()
        {
            //throw new NotImplementedException();
            drpDept.DataSource = getDepartment();
            drpDept.DataTextField = "DeptName";
            drpDept.DataValueField = "DeptId";
            drpDept.DataBind();
        }
        private void fillDesignationDrop()
        {
            //throw new NotImplementedException();
            drpDesignation.DataSource = getDesignation();
            drpDesignation.DataTextField = "DesignationName";
            drpDesignation.DataValueField = "DesignationId";
            drpDesignation.DataBind();
        }
        public DataTable getDepartment()
        {
            //throw new NotImplementedException();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
            SqlCommand cmd;
            SqlDataAdapter da;
            DataTable dt;
            conn.Open();
            cmd = new SqlCommand("getDepartment", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public DataTable getDesignation()
        {
            //throw new NotImplementedException();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
            SqlCommand cmd;
            SqlDataAdapter da;
            DataTable dt;
            conn.Open();
            cmd = new SqlCommand("getDesignation", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                string query = @"INSERT INTO Employee (EmpName,EmpDob,EmpAddress,EmpMobile,EmpEmail,EmpUserId,EmpDesignation,EmpDepartment)
                    VALUES(@Emp_Name,@Emp_DOB,@Emp_Address,@Emp_Mobile,@Emp_Email,@Emp_UserId,@Emp_Designation,@Emp_Department)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Emp_Name", txtEmpNameAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_DOB", txtEmpDobAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Address", txtEmpAddressAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Mobile", txtEmpMobileAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Email", txtEmpEmailAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_UserId", txtEmpUserId.Text.Trim());
                cmd.Parameters.AddWithValue("@Emp_Department", int.Parse(drpDept.SelectedValue));
                cmd.Parameters.AddWithValue("@Emp_Designation", int.Parse(drpDesignation.SelectedValue));
                int n = cmd.ExecuteNonQuery();
                query = "INSERT INTO Login(LoginId,Password) VALUES('" + txtEmpUserId.Text.Trim() + "','" + txtEmpDobAdd.Text.Trim() + "');";
                cmd=new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                txtEmpNameAdd.Text = "";
                txtEmpAddressAdd.Text = "";
                txtEmpMobileAdd.Text = "";
                txtEmpDobAdd.Text = "";
                txtEmpEmailAdd.Text = "";
                txtEmpUserId.Text = "";
                
                if (n > 0)
                {
                    Console.WriteLine("Addition Successfull");
                }
                else
                {
                    Console.WriteLine("Oops!!!");
                }
              //  PopulateGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }
    }
}