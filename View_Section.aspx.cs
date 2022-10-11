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




  
    protected void Button1_Click(object sender, EventArgs e)
    {
        String i = Request.QueryString["id"].ToString();

        Response.Redirect("Edit_Infection?id=" + i);
        //Go to Edit Infection page.
       // View_Infection.aspx? id = { 0 }'", drv["id"]
       // Save_Data();



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
                        Infection_name.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();

                        First.Text =ds.Tables[0].Rows[0].ItemArray[6].ToString();
                        
                        Second.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        Third.Text =ds.Tables[0].Rows[0].ItemArray[4].ToString();
                        Forth.Text = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                      //  Fifth.Text = ds.Tables[0].Rows[0].ItemArray[13].ToString();

                        string query2 = "select * from RAGs where deleted =0";
                       cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        cnn.Open();
                        SqlCommand cmd2 = new SqlCommand(query2, cnn);
                        SqlDataReader sdr;
                        sdr = cmd2.ExecuteReader();
                        var des = "";
                        var fn = "";
                        var sn = "";
                        var thn = "";
                        var fif = "";
                        while (sdr.Read())
                        {
                            des = "";
                            fn = "";
                            sn = "";
                            thn = "";
                            fif = "";
                            string name = sdr["area"].ToString();
                            string color = sdr["description"].ToString();

                            if (First.Text != "")
                            {
                                des = First.Text;
                                des = des.Replace(name, "<span style='color:" + color + "'>" + name + "</span>");
                                First.Text = des;

                            }
                            if (Second.Text != "")
                            {
                                fn = Second.Text;
                                fn = fn.Replace(name, "<span style='color:" + color + "'>" + name + "</span>");
                             Second.Text = fn;

                            }
                            if (Third.Text != "")
                            {
                                sn = Third.Text;
                                sn = sn.Replace(name, "<span style='color:" + color + "'>" + name + "</span>");
                                Third.Text = sn;

                            }
                            if (Forth.Text != "")
                            {
                               thn = Forth.Text;
                                thn = thn.Replace(name, "<span style='color:" + color + "'>" + name + "</span>");
                                Forth.Text = thn;

                            }
                       
                        }
                        cnn.Close();






                        string created_date = Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[10].ToString());
                        string updated_date = Server.HtmlEncode(ds.Tables[0].Rows[0].ItemArray[11].ToString());



                    }



                }







            }



        }





    }

   
}



  