<%@ Page Title="Home Page" validateRequest="false" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Create_Config.aspx.cs" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

           <asp:Label ID="Label1" runat="server" Text="Create Config" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
           <br />

<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

           <br />

           Config:<div class="form-group"> <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" type = "text" id = "Config" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>




 <div class="form-group">  <div class="form-group" > 
     <asp:Label ID="Label8" runat="server" Text="Value:" Font-Bold="True" ></asp:Label>
     <asp:TextBox ID="Value" class="form-control" runat="server"   DataTextField="Value" DataValueField="Value"   />
      
         
     </div> </div>

<div class="form-group"> </div>
 
 
<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Confirm"    /></div>

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
 

                     <strong>
 

                     </strong>


 
 

</asp:Content>