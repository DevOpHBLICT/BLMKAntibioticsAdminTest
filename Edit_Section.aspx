<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Edit_Section.aspx.cs" validateRequest="false" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


           <asp:Label ID="Label1" runat="server" Text="Edit Section" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
       <div class="form-group" >
<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="True"></asp:Label>
</div>
    
    <br />
      
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>                      
                        
                              <asp:BoundField  DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                      
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
       
 <div class="form-group" > <asp:Label ID="Label8" runat="server" Text="Section:" Font-Bold="True" ></asp:Label></div>
 
<div class="form-group"> <asp:TextBox AutoCompleteType="Disabled" runat="server" class="form-control" type = "text" id = "Section" Width="1000px"  Font-Bold="False"></asp:TextBox> </div>
     


 <asp:Label ID="Label2" runat="server" Text="Section Order:" Font-Bold="True" ></asp:Label> 
     
     
  

 <div class="form-group">  <div class="form-group" > 
     <asp:Label ID="Label3" runat="server" Text="Colour:" Font-Bold="True" ></asp:Label>
     <asp:DropDownList ID="Section_Order" class="form-control" runat="server"  AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Section_Order" DataValueField="Section_Order"   >
       <asp:ListItem Text="--Please Select--" Value="" />
            </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Section_Order] FROM [Section_Order]"></asp:SqlDataSource>
   </div> </div>


<div class="form-group" >     
    <strong>     
    <br />
    </strong> 
    <br />
    <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Confirm"    />
    <br />
           </div>

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
    <div class="form-group">  <asp:Button  ID="Delete" runat="server"  OnClick="Delete_Click" CssClass="btn btn-danger" Width="100px" Text="Delete" Enabled="False"   />&nbsp;&nbsp;
                <br />
                Type 'delete' (in lower case) <asp:TextBox Enabled="true" Autopostback="true" ID="deletebox" OnTextChanged="Delete_Check" runat="server" MaxLength="6"></asp:TextBox> press Enter
                <br />
                <br />
                then click on red 'Delete' button to confirm deletion
                     </div>
                     
                

                     <strong>
 


                     </strong>

            
 
<asp:SqlDataSource ID="Catheters" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [RAG]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [RAG] WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" InsertCommand="INSERT INTO [RAG] ([Id], [Area], [Description], [Complete], [Version], [CreatedAt], [UpdatedAt], [Deleted], [user_id]) VALUES (@Id, @Area, @Description, @Complete, @Version, @CreatedAt, @UpdatedAt, @Deleted, @user_id)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [RAG] SET [Area] = @Area, [Description] = @Description, [Complete] = @Complete, [Version] = @Version, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt, [Deleted] = @Deleted, [user_id] = @user_id WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" >
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
SelectCommand="SELECT * FROM [RAG]" OldValuesParameterFormatString="original_{0}" >
</asp:SqlDataSource>




 

      

 

</asp:Content>