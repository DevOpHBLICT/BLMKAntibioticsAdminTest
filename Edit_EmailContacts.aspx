<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Edit_EmailContacts.aspx.cs" validateRequest="false" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


           <asp:Label ID="Label1" runat="server" Text="Only one email address allowed. Check on mobile app that it is working correctly after making changes." Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
       <div class="form-group" >
<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="True"></asp:Label>
</div>
    
    
    
    
    <br /> 
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"  CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>                      
                        
                              <asp:BoundField  DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                      
                       <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                        </Columns>
                    <EditRowStyle BackColor="#2461BF" ForeColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
       
 <div class="form-group" > <asp:Label ID="Label8" runat="server" Text="Emails separated by semi colon ;:" Font-Bold="True" ></asp:Label>
 
<div class="form-group"> <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" type = "text" id = "Area" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>
     


 <asp:Label ID="Label2" runat="server" Text="Description:" Font-Bold="True" ></asp:Label>  <asp:TextBox TextMode="MultiLine" AutoCompleteType="Disabled" runat="server" class="form-control" type = "text" id = "Description" Width="1000px" Height="301px"></asp:TextBox> </div>
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
 


                     </strong>

            
 
<asp:SqlDataSource ID="Catheters" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [EmailContacts]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [EmailContacts] WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" InsertCommand="INSERT INTO [EmailContacts] ([Id], [Area], [Description], [Complete], [Version], [CreatedAt], [UpdatedAt], [Deleted], [user_id]) VALUES (@Id, @Area, @Description, @Complete, @Version, @CreatedAt, @UpdatedAt, @Deleted, @user_id)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Areas] SET [Area] = @Area, [Description] = @Description, [Complete] = @Complete, [Version] = @Version, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt, [Deleted] = @Deleted, [user_id] = @user_id WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" >
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="String" />
        <asp:Parameter Name="original_Area" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_Complete" Type="Boolean" />
        <asp:Parameter Name="original_Version" Type="Object" />
        <asp:Parameter Name="original_CreatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="original_UpdatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="original_Deleted" Type="Boolean" />
        <asp:Parameter Name="original_user_id" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Id" Type="String" />
        <asp:Parameter Name="Area" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Complete" Type="Boolean" />
        <asp:Parameter Name="Version" Type="Object" />
        <asp:Parameter Name="CreatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="UpdatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="Deleted" Type="Boolean" />
        <asp:Parameter Name="user_id" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Area" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Complete" Type="Boolean" />
        <asp:Parameter Name="Version" Type="Object" />
        <asp:Parameter Name="CreatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="UpdatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="Deleted" Type="Boolean" />
        <asp:Parameter Name="user_id" Type="String" />
        <asp:Parameter Name="original_Id" Type="String" />
        <asp:Parameter Name="original_Area" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
        <asp:Parameter Name="original_Complete" Type="Boolean" />
        <asp:Parameter Name="original_Version" Type="Object" />
        <asp:Parameter Name="original_CreatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="original_UpdatedAt" DbType="DateTimeOffset" />
        <asp:Parameter Name="original_Deleted" Type="Boolean" />
        <asp:Parameter Name="original_user_id" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

 <asp:SqlDataSource ID="Area_List" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [EmailContacts]" OldValuesParameterFormatString="original_{0}" >
</asp:SqlDataSource>




 

      

 

</asp:Content>