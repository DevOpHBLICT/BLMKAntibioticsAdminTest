using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Account_Manage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
     if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM RAGs where deleted=0", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                   GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if(GridView1.Rows.Count > 0)
                           {
                       // lbtnAdd.Visible = false;
                        // Do Something
                    }
                }
            }
        }


    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_RAG.aspx?id={0}'", drv["id"]));
        }



        
    }

    protected void lbtnAdd_Click(object sender, EventArgs e)

    {

        Response.Redirect("Create_RAG.aspx");

        // Hide the Add button and showing Add panel. 

       


    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_Disclaimer.aspx?id={0}'", drv["id"]));
        }
    }



    private void BindGridView()
    {
        GridView1.DataBind();
    }





}