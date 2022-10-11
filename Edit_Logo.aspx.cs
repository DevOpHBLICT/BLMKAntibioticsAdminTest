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
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string filename = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(filename);
        int fileSize = postedFile.ContentLength;
        string s="";
        string ss = "";
        Byte[] bytes = null;
        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
               || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            bytes = binaryReader.ReadBytes((int)stream.Length);
            //  s = System.Text.Encoding.UTF8.GetString(bytes, 0, bytes.Length);
           s= Convert.ToBase64String(bytes);
            System.Drawing.Image i = System.Drawing.Image.FromStream(stream);
   //         if (i.Height == 120 && i.Width == 120)
   //         {

     //       }
     //       else
     //       {

     //           ok = 0; Error_Label.Visible = true;
      //          Error_Label.Text = Error_Label.Text + "Image must be 120px x 120px.";
        //    }









            //    ss=  System.Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(s));
            //        System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(ss));
        }
   //     if (bytes == null) {
     //       ok = 0; Error_Label.Visible = true; 
       //     Error_Label.Text = Error_Label.Text+ "Please choose new image;"; 
     //   }


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

            sql = "";
            if (bytes != null)
            {
                sql = sql + "update Configs " +
                    "set UpdatedAt =@localtime," +

                "deleted = 0," +
                "complete = 0," +
                   "Picture =@bytes " +
                

                "where Config= 'logo'";
            }
         




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
      
            
       
            cmd2.Parameters.AddWithValue("@localtime", localTime);
            cmd2.Parameters.AddWithValue("@deleted", 0);
            cmd2.Parameters.AddWithValue("@complete", 0);
            if (bytes != null)
            {
                cmd2.Parameters.AddWithValue("@bytes", bytes);
            }
          


            cmd2.ExecuteNonQuery();
            Response.Redirect("InfectionHierarchy.aspx");
           

        }

    }

    protected void Delete_Record()
    {
    //    var ok = 1;


     //   string user_id = "";
      //  if (Session["User"] != null)
      //  {
      //      user_id = Session["User"].ToString();
      //  }

      //  DateTimeOffset localTime = DateTimeOffset.Now;
      //  SqlConnection cnn = new SqlConnection();
      //  cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
      //  cnn.Open();

       // var sql = "";            
        // sql = sql + "update Configs set UpdatedAt =@localtime,user_id = '" + user_id + "',Complete =1,Deleted=1 where id = '" + Request.QueryString["id"].ToString() + "'";


        //SqlCommand cmd2 = new SqlCommand(sql, cnn);
        //cmd2.Parameters.AddWithValue("@localtime", localTime);
        //cmd2.ExecuteNonQuery();

       
          //  Response.Redirect("InfectionHierarchy.aspx");
     

    }



    protected void Delete_Click(object sender, EventArgs e)
    {

        Delete_Record();



    }


    protected void Delete_Check(object sender, EventArgs e)
    {
    // if (deletebox.Text == "delete")
     //   {
    //       Delete.Enabled = true;
      //  }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
      
            Response.Redirect("InfectionHierarchy.aspx");
      


    }


    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {




        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;

            if (!Convert.IsDBNull(dr["Picture"]))
            {
                //   bytes = (byte[])r["proposalDoc"];
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Picture"]);
                (e.Row.FindControl("Picture") as Image).ImageUrl = imageUrl;


            }
        }
    }




    protected void Page_Load(object sender, EventArgs e)
    {

    

        if (!IsPostBack)
        {

           
            //Get 
             string query = "select Picture from Configs where Config ='logo'";
            SqlCommand cmd = new SqlCommand(query);

            string strCon = System.Web
                      .Configuration
                      .WebConfigurationManager
                      .ConnectionStrings["DefaultConnection"].ConnectionString;
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT Picture FROM Configs where Config ='logo'", conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                  
                }
            }


              

          
        }
    }
}



  