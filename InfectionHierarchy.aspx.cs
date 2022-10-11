using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Account_Manage : System.Web.UI.Page
{

    protected void ddlAreas_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAreas.SelectedValue != "All")
            SqlDataSource1.FilterExpression = " Area_Id like '" + ddlAreas.SelectedValue + "'";
        else
            SqlDataSource1.FilterExpression = "";

        GridView1.DataBind();


        //Your ID to use
        string id = ddlAreas.SelectedValue;

        //Call your stored procedure here

        string strCon = System.Web
                   .Configuration
                   .WebConfigurationManager
                   .ConnectionStrings["DefaultConnection"].ConnectionString;

 



        //Use a using statement to handle your SQL calls (it's much safer)
        using (SqlConnection sqlConnection = new SqlConnection(strCon))
        {
            //Your SQL Command
            SqlCommand cmd = new SqlCommand("select * from todoitems where Area_Id ='" + id + "' and Deleted ='false';", sqlConnection);

            //Open your connection
            sqlConnection.Open();

            //Set up your databinding
            ddlInfections.DataSource = cmd.ExecuteReader();
            ddlInfections.DataTextField = "Text";
            ddlInfections.DataValueField = "Text";
         
            //Bind your data
            ddlInfections.DataBind();
            ddlInfections.Items.Insert(0, "--Please Select--");

           
            sqlConnection.Close();

        }

    }





        protected void Page_Load(object sender, EventArgs e)
    {
     if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }


        protected void lbtnAdd_Click(object sender, EventArgs e)

    {

        Response.Redirect("Create_Infection.aspx");

        // Hide the Add button and showing Add panel. 

        lbtnAdd.Visible = false;



    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='View_Section.aspx?id={0}'", drv["id"]));
        }
    }



    private void BindGridView()
    {
        GridView1.DataBind();
    }





}