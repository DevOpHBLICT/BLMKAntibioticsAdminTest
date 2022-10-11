<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Edit_Infection.aspx.cs" validateRequest="false" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

           <asp:Label ID="Label1" runat="server" Text="Edit Infection" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />
    <br />  
    <br />

<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

 
        



<div class="form-group" > <asp:Label ID="Label7" runat="server" Text="Area:" Font-Bold="True" ></asp:Label> <asp:DropDownList ID="Area" class="form-control" runat="server"  AppendDataBoundItems="True" 
     DataSourceID="Area_List" DataTextField="Area" DataValueField="Id"  ><asp:ListItem Text="--Please Select--" Value="" />
     

</asp:DropDownList></div>
     
                      
             
<div class="form-group"> <asp:Label ID="Label2" runat="server" Text="Infection Name:" Font-Bold="True" Font-Size="Large"></asp:Label><asp:TextBox Font-Size="Large" AutoPostback="true" runat="server" class="form-control" type = "text" id = "Infection_name" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="first_label" runat="server" Text="First:" Font-Bold="True" Font-Size="Large"></asp:Label> <asp:TextBox Font-Size="Large" AutoPostback="true" ID="First" class="form-control" type="text" runat="server" Height="280px" Width="1000px" TextMode="MultiLine"></asp:TextBox></div>
<div class="form-group"> <asp:Label ID="second_label" runat="server" Text="Second:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Font-Size="Large" Autopostback="true" runat="server" class="form-control" type = "text" id = "Second" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="third_label" runat="server" Text="Third:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Font-Size="Large" Autopostback="true" runat="server" class="form-control" type = "text" id = "Third" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="forth_label" runat="server" Text="Forth:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Font-Size="Large" Autopostback="true" runat="server" class="form-control" type = "text" id = "Forth" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>
 
 
<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Confirm"    /></div>

 
                        

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
    <div class="form-group">  <asp:Button  ID="Delete" runat="server"  OnClick="Delete_Click" CssClass="btn btn-danger" Width="100px" Text="Delete" Enabled="False"   />&nbsp;&nbsp;
                <br />
                Type 'delete' (in lower case) <asp:TextBox Autopostback="true" ID="deletebox" OnTextChanged="Delete_Check" runat="server" MaxLength="6"></asp:TextBox> press Enter
                <br />
                <br />
                then click on red 'Delete' button to confirm deletion
                     </div>
                     
                

                     <strong>
 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 

SelectCommand="SELECT * FROM [Area_List]"></asp:SqlDataSource>

                     </strong>


 
<asp:SqlDataSource ID="Infections" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [items] WHERE ([Deleted] = @Deleted)" OldValuesParameterFormatString="original_{0}" >
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="Deleted" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

 <asp:SqlDataSource ID="Area_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [Areas]" OldValuesParameterFormatString="original_{0}" >
</asp:SqlDataSource>



   
 <script type="text/javascript" lang="javascript" src="Scripts/ckeditor/ckeditor.js"></script>
 
      
             <script type="text/javascript" lang="javascript">
                 CKEDITOR.replace('<%=First.ClientID%>',
                     {
                         contentsCss: "body{font-family:arial;font-size: 20px !important;"
                     }
                 );
                 CKEDITOR.replace('<%=Second.ClientID%>',
                     {
                         contentsCss: "body{font-family:arial;font-size: 20px !important;"
                     }
                 );
                 CKEDITOR.replace('<%=Third.ClientID%>',
                     {
                         contentsCss: "body{font-family:arial;font-size: 20px !important;"
                     }
                 );
                 CKEDITOR.replace('<%=Forth.ClientID%>',
                     {
                         contentsCss: "body{font-family:arial;font-size: 20px !important;"
                     }
                 );
                 CKEDITOR.config.autoParagraph = false;


                             </script>
 

</asp:Content>

     