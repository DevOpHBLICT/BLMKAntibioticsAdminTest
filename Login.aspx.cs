using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Account_Manage : System.Web.UI.Page
{

    protected void btnlogin_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        con.Open();
        //     String query = "select count(*) from tbl_logins where user_name='" + txtusername.Text + "' and password_='" + txtpassword.Text + "'";

           String query = "select count(*) from tbl_logins where user_name=@username and password_=@password";

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@username";
        param1.Value = txtusername.Text;

        SqlParameter param2 = new SqlParameter();
        param2.ParameterName = "@password";
        param2.Value = txtpassword.Text;



        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.Add(param1);
        cmd.Parameters.Add(param2);

        String output = cmd.ExecuteScalar().ToString();

        if (output == "1")
        {
            Session["User"] = txtusername.Text;
            Response.Redirect("~/InfectionHierarchy.aspx");
        }

        else
        {
            Response.Write("Your User Name and Password is wrong !");
        }

    }





}