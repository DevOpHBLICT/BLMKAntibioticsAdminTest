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
using System.Text.RegularExpressions;
public static class StringExtensions
{
   

}
public partial class _Default : Page
{




  


    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";


        if (Infection_name.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Infection_name,"; }

        if (First.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "First,"; }


         if (Area.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Area_ID,"; }

        var ii = "";
  

        var sql = "";
        string user_id = "";
        if (Session["User"] != null)
        {
            user_id = Session["User"].ToString();
        }

        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            cnn.Open();

            DateTimeOffset localTime = DateTimeOffset.Now;

            var sql2 = "select Area,Description from  RAGs where deleted =0 order by Area";
            SqlCommand cmd3 = new SqlCommand(sql2, cnn);
            var first = First.Text;
            var second = Second.Text;
            var third = Third.Text;
            var forth = Forth.Text;


            SqlDataReader rdr = cmd3.ExecuteReader();
            while (rdr.Read())
            {
                string drug = rdr[0].ToString().ToLower();
                string colour = rdr[1].ToString().ToLower() ;

             



       
            }
            rdr.Close();







            sql = "";
            sql = sql + "update  todoitems " +
                "set user_id='" + user_id + "',UpdatedAt =@localtime," +
            
            "deleted = 0," +
            "complete = 0," +
           "Text =@infection_name," +
            "Area_ID =@area," +
           "First=@first," +
            "Second =@second," +
            "Third =@third," +
            "Forth =@forth " +
          "where id = '" + Request.QueryString["id"].ToString() + "'";

         
            SqlCommand cmd2 = new SqlCommand(sql, cnn);
      
            cmd2.Parameters.AddWithValue("@infection_name", Infection_name.Text);
            cmd2.Parameters.AddWithValue("@area",Area.SelectedValue);
            cmd2.Parameters.AddWithValue("@first", first);
            cmd2.Parameters.AddWithValue("@second",second);
            cmd2.Parameters.AddWithValue("@third", third);
            cmd2.Parameters.AddWithValue("@forth", forth);
          
            cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
      
            cmd2.ExecuteNonQuery();
            Response.Redirect("InfectionHierarchy.aspx");
           

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


        SqlConnection cnn = new SqlConnection();
        cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        cnn.Open();

        DateTimeOffset localTime = DateTimeOffset.Now;
        var sql = "";            
         sql = sql + "update todoitems set UpdatedAt =@localtime,user_id = '" + user_id + "',Complete ='1',Deleted='1' where id = '" + Request.QueryString["id"].ToString() + "'";



        SqlCommand cmd2 = new SqlCommand(sql, cnn);
        cmd2.Parameters.AddWithValue("@localtime", localTime);

        cmd2.ExecuteNonQuery();

       
            Response.Redirect("InfectionHierarchy.aspx");
     

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
      
            Response.Redirect("InfectionHierarchy.aspx");
      


    }





    protected void Page_Load(object sender, EventArgs e)
    {

    

        if (!IsPostBack)
        {

            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            cnn.Open();
            string sql2 = "select Section,Section_Order from  Sections where deleted=0 order by Section_Order";
            SqlCommand cmd3 = new SqlCommand(sql2, cnn);
            SqlDataReader rdr = cmd3.ExecuteReader();
            while (rdr.Read())
            {

                string section = rdr[0].ToString();
                string section_order = rdr[1].ToString().ToLower();
                if (section_order == "1") { first_label.Text = section; }
                if (section_order == "2") { second_label.Text = section; }
                if (section_order == "3") { third_label.Text = section; }
                if (section_order == "4") { forth_label.Text = section; }

            }
            rdr.Close();
            cnn.Close();


            //Get 
            String i = Request.QueryString["id"].ToString();
            string query = "select * from todoitems where id ='" + i + "'";
            SqlCommand cmd = new SqlCommand(query);

            string strCon = System.Web
                      .Configuration
                      .WebConfigurationManager
                      .ConnectionStrings["DefaultConnection"].ConnectionString;

            //   ClientList_DropDown();
            using (SqlConnection con = new SqlConnection(strCon))

            {

                using (SqlDataAdapter sda = new SqlDataAdapter())

                {

                    cmd.Connection = con;

                    sda.SelectCommand = cmd;


                  



                    using (DataSet ds = new DataSet())

                    {




                        sda.Fill(ds);

                           string id = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                        Area.SelectedValue = Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[1].ToString());
                      //  string Infection_id = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                //      Area.SelectedValue= Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[1].ToString());
                        Infection_name.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        First.Text =ds.Tables[0].Rows[0].ItemArray[6].ToString();
                        Second.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        Third.Text =ds.Tables[0].Rows[0].ItemArray[4].ToString();
                        Forth.Text = ds.Tables[0].Rows[0].ItemArray[5].ToString();

                       





                        string created_date = Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[10].ToString());
                        string updated_date = Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[11].ToString());



                    }



                }







            }



        }





    }

   
}



  