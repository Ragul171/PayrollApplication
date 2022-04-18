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
    public partial class Salary : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpId"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                fillEmployeeDrop();
            }
        }

        private void fillEmployeeDrop()
        {
            //throw new NotImplementedException();
            drpEmployee.DataSource = getEmployee();
            drpEmployee.DataTextField = "EmpName";
            drpEmployee.DataValueField = "EmpId";
            drpEmployee.DataBind();
        }

        public DataTable getEmployee()
        {
            //throw new NotImplementedException();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
            SqlCommand cmd;
            SqlDataAdapter da;
            DataTable dt;
            conn.Open();
            cmd = new SqlCommand("getEmployee", conn);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        protected void AddSalary_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EmployeeConnectionString"].ConnectionString);
                conn.Open();
                string query = @"INSERT INTO Salary (EmpId,BasicPay,DA,HRA,CA,SA)
                    VALUES(@EmpId,@BasicPay,@DA,@HRA,@CA,@SA)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmpId", int.Parse(drpEmployee.SelectedValue));
                cmd.Parameters.AddWithValue("@BasicPay", txtBasicPay.Text.Trim());
                cmd.Parameters.AddWithValue("@DA", txtDA.Text.Trim());
                cmd.Parameters.AddWithValue("@HRA", txtHRA.Text.Trim());
                cmd.Parameters.AddWithValue("@CA", txtCA.Text.Trim());
                cmd.Parameters.AddWithValue("@SA", txtSA.Text.Trim());
                int n = cmd.ExecuteNonQuery();
                txtBasicPay.Text = "";
                txtDA.Text = "";
                txtHRA.Text = "";
                txtCA.Text = "";
                txtSA.Text = "";
                if (n > 0)
                {
                    lblMessage.Text = "Addition Successfull";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Oops!!!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                //  PopulateGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }

        protected void drpEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblsalary.Visible = true;
        }
    }
}