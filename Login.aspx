<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Sites.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Manage" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
      <div class="form-group">
                <div>Username: <asp:TextBox ID="txtusername" class="form-control" placeholder="Type your username"  runat="server"></asp:TextBox></div>
                  <br />
                  <div>Password: <asp:TextBox ID="txtpassword" TextMode="Password" class="form-control" placeholder="Type your password"  runat="server"></asp:TextBox>  </div>                    
              <br />
          <div>   <asp:Button ID="btnlogin" class="login100-form-btn" runat="server" Text="Login" onclick="btnlogin_Click" /></div>
    </div>
      </div>
    </div>
  

</asp:Content>