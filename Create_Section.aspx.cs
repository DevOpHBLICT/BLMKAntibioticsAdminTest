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



     
 

         if (Section_Order.SelectedValue == "") { ok = 1; Error_Label.Visible = true; Error_Label.Text = Error_Label.Text + "Section_Order,"; }

        if (Section.Text == "") { ok = 1; Error_Label.Visible = true; Error_Label.Text = Error_Label.Text + "Section,"; }



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
    

            sql = sql + "insert into Sections(UpdatedAt,Deleted,Complete,Section,Section_Order)";

            sql = sql + "values(";

            sql = sql  + "@localtime,";
            sql = sql + "@deleted,";
            sql = sql +" @complete,";
             sql = sql + "@section,";
            sql = sql + "@section_order";
            sql = sql + ")";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
           cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
             cmd2.Parameters.AddWithValue("@section_order", Section_Order.SelectedValue);
            cmd2.Parameters.AddWithValue("@section", Section.Text);






            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("Section.aspx");


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
       if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }


}
