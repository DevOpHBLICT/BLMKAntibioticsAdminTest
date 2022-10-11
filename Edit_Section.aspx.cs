using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Collections;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Text;
using System.Net.Mime;


public partial class _Default : Page
{




  


    protected void Save_Data()
    {
        var ok = 1;

      //  Error_Label.Visible = false;
     Error_Label.Text= "Please Enter:";
       
       
         
        if (Section.Text == "") { ok = 0; Error_Label.Visible = true; 
            Error_Label.Text= Error_Label.Text + "Section,"; 
        }

      
         if (Section_Order.Text == "") {
            ok = 0; Error_Label.Visible = true; 
            Error_Label.Text = Error_Label.Text + "Section_Order,"; 
        }

        
  

        var sql = "";
      
       
        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            cnn.Open();

            DateTimeOffset localTime = DateTimeOffset.Now;

            sql = "";
            
                sql = sql + "update Sections " +
                    "set UpdatedAt =@localtime," +

                "deleted = 0," +
                "complete = 0," +
               "Section =@section," +
                "Section_Order=@section_order " +
               

                "where id = '" + Request.QueryString["id"].ToString() + "'";
            
            SqlCommand cmd2 = new SqlCommand(sql, cnn);
      
            
            cmd2.Parameters.AddWithValue("@section", Section.Text);
            cmd2.Parameters.AddWithValue("@section_order", Section_Order.SelectedValue);
          
            cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
          

            cmd2.ExecuteNonQuery();
            Response.Redirect("Section.aspx");
           

        }

    }

    protected void Delete_Record()
    {
        var ok = 1;


        string user_id = "";
        if (Session["User"] != null)
        {
            user_id = Session["User"].ToString();
        }

        DateTimeOffset localTime = DateTimeOffset.Now;
        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn.Open();

        var sql = "";            
         sql = sql + "update Sections set UpdatedAt =@localtime,Complete =1,Deleted=1 where id = '" + Request.QueryString["id"].ToString() + "'";

        SqlCommand cmd2 = new SqlCommand(sql, cnn);
        cmd2.Parameters.AddWithValue("@localtime", localTime);
        cmd2.ExecuteNonQuery();

       
            Response.Redirect("Section.aspx");
     

    }



    protected void Delete_Click(object sender, EventArgs e)
    {

        Delete_Record();



    }


    protected void Delete_Check(object sender, EventArgs e)
    {
     if (deletebox.Text == "delete")
        {
           Delete.Enabled = true;
        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
      
            Response.Redirect("Section.aspx");
      


    }



   




    protected void Page_Load(object sender, EventArgs e)
    {

    //    if (Session["User"] == null)
     //   {
     //       Response.Redirect("Login.aspx");
     //   }

        if (!IsPostBack)
        {

           
            //Get 
            String i = Request.QueryString["id"].ToString();
          //  string query = "select Area_Image from areas where id ='" + i + "'";
           // SqlCommand cmd = new SqlCommand(query);

            string strCon = System.Web
                      .Configuration
                      .WebConfigurationManager
                      .ConnectionStrings["DefaultConnection"].ConnectionString;
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
         //   using (SqlConnection conn = new SqlConnection(constr))
          //  {
          //      using (SqlDataAdapter sda = new SqlDataAdapter("SELECT Id,Area_Image FROM Areas where id ='" + i + "' order by Sort_Order", conn))
         //       {
        //            DataTable dt = new DataTable();
        //            sda.Fill(dt);
        //            GridView1.DataSource = dt;
        //            GridView1.DataBind();
        //        }
        //    }

           string query = "select * from Sections where id ='" + i + "' ";
          SqlCommand cmd = new SqlCommand(query);

            using (SqlConnection con = new SqlConnection(strCon))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Sections where Id ='" + i + "'",con))
                {

                    cmd.Connection = con;
                    sda.SelectCommand = cmd;

                    using (DataSet ds1 = new DataSet())

                    {

                        sda.Fill(ds1);
                        
                           string id = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                        Section.Text= Server.HtmlEncode(ds1.Tables[0].Rows[0].ItemArray[1].ToString().Trim());
                          Section_Order.SelectedValue = ds1.Tables[0].Rows[0].ItemArray[2].ToString();
                        string created_date = Server.HtmlEncode(ds1.Tables[0].Rows[0].ItemArray[5].ToString());
                        string updated_date = Server.HtmlEncode(ds1.Tables[0].Rows[0].ItemArray[6].ToString());
                     
                    }

                }

            }
        }
    }
}



  