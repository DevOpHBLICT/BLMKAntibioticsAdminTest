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

        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string filename = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(filename);
        int fileSize = postedFile.ContentLength;
       
        
        
        Stream stream = null;
        Byte[] bytes = null;
        var height = 0;
        var width = 0;

        var ok = 0;

        Error_Label.Visible = false;



        var Error_Text = "Please Enter:";
        string s = "";
        string ss = "";

        if (fileSize > 0)
        {
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                   || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
            {
                stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                bytes = binaryReader.ReadBytes((int)stream.Length);
                s = Convert.ToBase64String(bytes);

            }
            System.Drawing.Image i = System.Drawing.Image.FromStream(stream);

           height = i.Height;
            width = i.Width;
        }else
        {
            ok = 1; Error_Label.Visible = true;
            Error_Label.Text= Error_Label.Text + "Please select an image. Image must be 120px x 120px.";

        }


        if (height == 120 && width == 120)
        {

        }
        else
        {

            ok = 1; Error_Label.Visible = true;
            Error_Label.Text= Error_Label.Text + "Image must be 120px x 120px.";
        }






        if (Area.Text == "") { ok = 1; Error_Label.Visible = true; Error_Label.Text = Error_Label.Text+ "Area_name,"; }
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
    

            sql = sql + "insert into areas(user_id,UpdatedAt,Deleted,Complete,Description,Area,Area_Image,Area_Image_String)";

            sql = sql + "values('";
            sql = sql + user_id + "',";
            sql = sql  + "@localtime,";
            sql = sql + "@deleted,";
            sql = sql +" @complete,";
             sql = sql + "@description,";
            sql = sql + "@area,";
                sql = sql+ "@bytes,";
            sql = sql + "@as ";
            sql = sql + ")";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
           cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
             cmd2.Parameters.AddWithValue("@description", Description.Text);
            cmd2.Parameters.AddWithValue("@area", Area.Text);
            cmd2.Parameters.AddWithValue("@bytes", bytes);
            cmd2.Parameters.AddWithValue("@as", s);





            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("Areas.aspx");


        }




    }




    protected void Button1_Click(object sender, EventArgs e)



    {




        Save_Data();



    }


    protected void Cancel_Click(object sender, EventArgs e)



    {




        Response.Redirect("Areas.aspx");



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
