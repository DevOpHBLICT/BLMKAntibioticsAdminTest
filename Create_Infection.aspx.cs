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
using System.Globalization;

public partial class _Default : Page


{



    protected void itemSelected(object sender, EventArgs e)



    {




    }




    protected void Save_Data()



    {



        var ok = 0;



        Error_Label.Visible = false;



        var Error_Text = "Please Enter:";





        if (Infection_name.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Infection_name,"; }

       
   
        if (Area.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Area_ID,"; }


        Error_Label.Text = Error_Text.TrimEnd(',');



        if (ok == 0)


        {

            SqlConnection cnn = new SqlConnection();

            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;



            cnn.Open();

            DateTimeOffset localTime = DateTimeOffset.Now;
            string user_id = "";
            if (Session["User"]!=null)
            {
                user_id = Session["User"].ToString();
            }
              var sql = "";
     
            sql = sql + "insert into todoitems(user_id,UpdatedAt,Deleted,Complete,Text,Area_ID,First,Second,Third, Forth";

            sql = sql + ")";

            sql = sql + "values('";
            sql = sql + user_id + "',";
            sql = sql  + "@localtime,";
            sql = sql + "@deleted,";
            sql = sql +" @complete,";
            sql = sql + "@infection_name,";
            sql = sql + "@area,";
            sql = sql + "@first,";
            sql = sql + "@second,";
            sql = sql + "@third,";
            sql = sql + "@forth";
            sql = sql + ")";



            var description = First.Text;
            var first_line = Second.Text;
            var second_line = Third.Text;
            var third_line = Forth.Text;


          
            SqlCommand cmd2 = new SqlCommand(sql, cnn);
           cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
            cmd2.Parameters.AddWithValue("@infection_name", Infection_name.Text);
            cmd2.Parameters.AddWithValue("@area", Area.SelectedValue);
            cmd2.Parameters.AddWithValue("@first", description);
            cmd2.Parameters.AddWithValue("@second", first_line);
            cmd2.Parameters.AddWithValue("@third", second_line);
            cmd2.Parameters.AddWithValue("@forth", third_line);






            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("InfectionHierarchy.aspx");


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

                string section = rdr[0].ToString().ToLower();
                string section_order = rdr[1].ToString().ToLower();
                if (section_order == "1") { first_label.Text = section; }
                if (section_order == "2") { second_label.Text = section; }
                if (section_order == "3") { third_label.Text = section; }
                if (section_order == "4") { forth_label.Text = section; }

            }
            rdr.Close();
            cnn.Close();
        }
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }









    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)



    {







    }



}
