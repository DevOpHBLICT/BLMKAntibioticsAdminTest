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

        var height = 0;
        var width = 0;

        var ok = 0;

        Error_Label.Visible = false;



        var Error_Text = "Please Enter:";
        string s = "";
        string ss = "";

    


    





         if (Description.Text == "") { ok = 1; Error_Label.Visible = true; Error_Label.Text = Error_Label.Text + "Description,"; }




        Error_Label.Text = Error_Label.Text.TrimEnd(',');



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
    

            sql = sql + "insert into disclaimers(user_id,UpdatedAt,Deleted,Complete,Description,Area)";

            sql = sql + "values('";
            sql = sql + user_id + "',";
            sql = sql  + "@localtime,";
            sql = sql + "@deleted,";
            sql = sql +" @complete,";
             sql = sql + "@description,";
            sql = sql + "@area";
            sql = sql + ")";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
           cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
             cmd2.Parameters.AddWithValue("@description", Description.Text);
            cmd2.Parameters.AddWithValue("@area", "disclaimer");






            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("Disclaimer.aspx");


        }




    }




    protected void Button1_Click(object sender, EventArgs e)



    {




        Save_Data();



    }


    protected void Cancel_Click(object sender, EventArgs e)



    {




        Response.Redirect("Disclaimer.aspx");



    }




    protected void Calendar1_SelectionChanged(object sender, EventArgs e)



    {





    }



    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }




    protected void QM_Selecting(object sender, SqlDataSourceCommandEventArgs e)



    {



        e.Command.Parameters["@DynamicVariable"].Value = Session["department"];



    }





    protected void Activity_Selecting(object sender, SqlDataSourceCommandEventArgs e)



    {



        e.Command.Parameters["@DynamicVariable"].Value = Session["department"];



    }





    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)



    {







    }



}
