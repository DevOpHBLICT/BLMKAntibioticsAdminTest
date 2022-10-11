<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="View_Section.aspx.cs" validateRequest="false" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

           <asp:Label ID="Label1" runat="server" Text="View Infection" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />
    <br />  
    <br />

<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

 
        



<div class="form-group" > <asp:Label ID="Label7" runat="server" Text="Area:" Font-Bold="True" ></asp:Label> <asp:DropDownList Enabled="false" ID="Area" class="form-control" runat="server"  AppendDataBoundItems="True" 
     DataSourceID="Area_List" DataTextField="Area" DataValueField="Id"  ><asp:ListItem Text="--Please Select--" Value="" />
     

</asp:DropDownList></div>
     
                      
             
<div class="form-group"> <asp:Label ID="Label2" runat="server" Text="Infection Name:" Font-Bold="True" Font-Size="Large"></asp:Label><asp:TextBox Enabled="false" AutoPostback="true" runat="server" class="form-control" type = "text" id = "Infection_name" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="first_label" runat="server" Text="First:" Font-Bold="True" Font-Size="Large"></asp:Label> <asp:TextBox Enabled="false" AutoPostback="true" ID="First" class="form-control" type="text" runat="server" Height="280px" Width="1000px" TextMode="MultiLine"></asp:TextBox></div>
<div class="form-group"> <asp:Label ID="second_label" runat="server" Text="Second:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Enabled="false" Autopostback="true" runat="server" class="form-control" type = "text" id = "Second" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="third_label" runat="server" Text="Third:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Enabled="false" Autopostback="true" runat="server" class="form-control" type = "text" id = "Third" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>
<div class="form-group"> <asp:Label ID="forth_label" runat="server" Text="Forth:" Font-Bold="True" Font-Size="Large"></asp:Label>  <asp:TextBox Enabled="false" Autopostback="true" runat="server" class="form-control" type = "text" id = "Forth" Width="1000px" Height="280px" TextMode="MultiLine"></asp:TextBox> </div>

 
<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Edit"    /></div>

 
                        

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
 
                

                     <strong>
 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 

SelectCommand="SELECT * FROM [Area_List]"></asp:SqlDataSource>

                     </strong>


 
<asp:SqlDataSource ID="Infections" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [Infections]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Infections] WHERE [ID] = @original_ID AND (([Area_ID] = @original_Area_ID) OR ([Area_ID] IS NULL AND @original_Area_ID IS NULL)) AND (([Infection_name] = @original_Infection_name) OR ([Infection_name] IS NULL AND @original_Infection_name IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([First_Line] = @original_First_Line) OR ([First_Line] IS NULL AND @original_First_Line IS NULL)) AND (([Second_Line] = @original_Second_Line) OR ([Second_Line] IS NULL AND @original_Second_Line IS NULL)) AND (([Third_Line] = @original_Third_Line) OR ([Third_Line] IS NULL AND @original_Third_Line IS NULL)) AND (([Further_information] = @original_Further_information) OR ([Further_information] IS NULL AND @original_Further_information IS NULL))" InsertCommand="INSERT INTO [Infections] ([Area_ID], [Infection_name], [Description], [First_Line], [Second_Line], [Third_Line], [Further_information]) VALUES (@Area_ID, @Infection_name, @Description, @First_Line, @Second_Line, @Third_Line, @Further_information)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Infections] SET [Area_ID] = @Area_ID, [Infection_name] = @Infection_name, [Description] = @Description, [First_Line] = @First_Line, [Second_Line] = @Second_Line, [Third_Line] = @Third_Line, [Further_information] = @Further_information WHERE [ID] = @original_ID AND (([Area_ID] = @original_Area_ID) OR ([Area_ID] IS NULL AND @original_Area_ID IS NULL)) AND (([Infection_name] = @original_Infection_name) OR ([Infection_name] IS NULL AND @original_Infection_name IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([First_Line] = @original_First_Line) OR ([First_Line] IS NULL AND @original_First_Line IS NULL)) AND (([Second_Line] = @original_Second_Line) OR ([Second_Line] IS NULL AND @original_Second_Line IS NULL)) AND (([Third_Line] = @original_Third_Line) OR ([Third_Line] IS NULL AND @original_Third_Line IS NULL)) AND (([Further_information] = @original_Further_information) OR ([Further_information] IS NULL AND @original_Further_information IS NULL))" >
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_Area_ID" Type="Int32" />
        <asp:Parameter Name="original_Infection_name" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_First_Line" Type="String" />
        <asp:Parameter Name="original_Second_Line" Type="String" />
        <asp:Parameter Name="original_Third_Line" Type="String" />
        <asp:Parameter Name="original_Further_information" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Area_ID" Type="Int32" />
        <asp:Parameter Name="Infection_name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="First_Line" Type="String" />
        <asp:Parameter Name="Second_Line" Type="String" />
        <asp:Parameter Name="Third_Line" Type="String" />
        <asp:Parameter Name="Further_information" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Area_ID" Type="Int32" />
        <asp:Parameter Name="Infection_name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="First_Line" Type="String" />
        <asp:Parameter Name="Second_Line" Type="String" />
        <asp:Parameter Name="Third_Line" Type="String" />
        <asp:Parameter Name="Further_information" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_Area_ID" Type="Int32" />
        <asp:Parameter Name="original_Infection_name" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_First_Line" Type="String" />
        <asp:Parameter Name="original_Second_Line" Type="String" />
        <asp:Parameter Name="original_Third_Line" Type="String" />
        <asp:Parameter Name="original_Further_information" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

 <asp:SqlDataSource ID="Area_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [Areas]" OldValuesParameterFormatString="original_{0}" >
</asp:SqlDataSource>



   
 <script type="text/javascript" lang="javascript" src="Scripts/ckeditor/ckeditor.js"></script>
    <style type="text/css">
.entry-content {font-family: 'Segoe UI';font-size:20px;}
</style>
      
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
                     });
                 CKEDITOR.replace('<%=Forth.ClientID%>',
                     {
                         contentsCss: "body{font-family:arial;font-size: 20px !important;"
                     });
               

                        </script>
 

</asp:Content>

     