<%@ Page Title="Home Page" validateRequest="false" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Create_RAG.aspx.cs" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

           <asp:Label ID="Label1" runat="server" Text="Create Drug/Colour combination" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
           <br />

<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

           <br />

 <asp:Label ID="Label3" runat="server" Text="Drug:" Font-Bold="True" ></asp:Label>          <div class="form-group"> <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" type = "text" id = "Area" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>




 <div class="form-group">  <div class="form-group" > 
     <asp:Label ID="Label8" runat="server" Text="Colour:" Font-Bold="True" ></asp:Label>
     <asp:DropDownList ID="Description" class="form-control" runat="server"  AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Colour" DataValueField="ColorHEX"   >
       <asp:ListItem Text="--Please Select--" Value="" />
            </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Colour], [ColorHEX] FROM [Colour]"></asp:SqlDataSource>
   </div> </div>

<div class="form-group"> </div>
 
 
<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Confirm"    /></div>

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
 

                     <strong>
 

                     </strong>


 
 

</asp:Content>