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
    public partial class EmployeeHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
                Response.Redirect("Login.aspx");
            PopulateTable();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        void PopulateTable()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                SqlCommand cmd;
                SqlDataReader dr;
                DataTable dt;
                String query;
                conn.Open();
                query = @"SELECT * FROM Employee e
                            INNER JOIN Department dept ON e.EmpDepartment = dept.DeptId
                            INNER JOIN Designation desg ON e.EmpDesignation = desg.DesignationId AND e.EmpId =" + Session["EmpId"];
                cmd = new SqlCommand(query, conn);
                dr = cmd.ExecuteReader();
                dt = new DataTable();
                dt.Load(dr);
                dr.Close();
                foreach (DataRow row in dt.Rows)
                {
                    empName.Text = (string)row["EmpName"];
                    empDesg.Text = (string)row["DesignationName"];
                    empDept.Text = (string)row["DeptName"];
                    empDob.Text = row["EmpDob"].ToString();
                    empAdd.Text = row["EmpAddress"].ToString();
                    empEmail.Text = row["EmpEmail"].ToString();
                    empMobile.Text = row["EmpMobile"].ToString();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}