<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Sites.master" AutoEventWireup="true" CodeFile="InfectionHierarchy.aspx.cs" Inherits="Account_Manage" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <script runat="server">

   



    

  protected void ddlInfections_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInfections.SelectedValue != "All")
            SqlDataSource1.FilterExpression = " Text like '" + ddlInfections.SelectedValue + "'";
        else
            SqlDataSource1.FilterExpression = "";

        GridView1.DataBind();
    }
</script>

        <asp:Label ID="Label1" runat="server" Text="INFECTIONS" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />

        <asp:Button style="color:white;Background-Color: green" CssClass="btn btn-default" ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click" Text="Add New Infection"></asp:Button>
   
       
 
      
                <br />
   
       
 
      
                <br />
   
       
 
      
                <br />
   
     Filter Area: <asp:DropDownList width="200px" class="form-control" ID="ddlAreas" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAreas_SelectedIndexChanged" DataSourceID="Area" DataTextField="Area" DataValueField="Id">
          
                    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select * from Areas where deleted = 0"></asp:SqlDataSource>
    <br />

     <asp:SqlDataSource ID="area" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select Area,Id from Areas where Deleted=0"></asp:SqlDataSource>

     Filter Infections: <asp:DropDownList  width="200px" class="form-control" ID="ddlInfections" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInfections_SelectedIndexChanged" >
                      
               
                    </asp:DropDownList>

    <br />
   
       
 
      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                         <asp:BoundField  DataField="Area" HeaderText="Area" SortExpression="Area" />
                          <asp:BoundField DataField="Text" HeaderText="Infection" SortExpression="Text" />
                        <asp:BoundField DataField="Deleted" HeaderText="Archived" SortExpression="Deleted" />
                      
                        <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" />
                        <asp:BoundField DataField="UpdatedAt" HeaderText="UpdatedAt" SortExpression="UpdatedAt" />
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
                
    <div>
      

    </div>

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [todoitems] t,Areas a where a.ID=t.Area_ID and t.Deleted=0" 
                    OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [todoitems] WHERE [Id] = @original_Id AND [Area_Id] = @original_Area_Id AND (([Text] = @original_Text) OR ([Text] IS NULL AND @original_Text IS NULL)) AND [First_Line] = @original_First_Line AND (([Second_Line] = @original_Second_Line) OR ([Second_Line] IS NULL AND @original_Second_Line IS NULL)) AND (([Third_Line] = @original_Third_Line) OR ([Third_Line] IS NULL AND @original_Third_Line IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted" InsertCommand="INSERT INTO [todoitems] ([Id], [Area_Id], [Text], [First_Line], [Second_Line], [Third_Line], [Description], [Complete], [Version], [CreatedAt], [UpdatedAt], [Deleted]) VALUES (@Id, @Area_Id, @Text, @First_Line, @Second_Line, @Third_Line, @Description, @Complete, @Version, @CreatedAt, @UpdatedAt, @Deleted)" UpdateCommand="UPDATE [todoitems] SET [Area_Id] = @Area_Id, [Text] = @Text, [First_Line] = @First_Line, [Second_Line] = @Second_Line, [Third_Line] = @Third_Line, [Description] = @Description, [Complete] = @Complete, [Version] = @Version, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt, [Deleted] = @Deleted WHERE [Id] = @original_Id AND [Area_Id] = @original_Area_Id AND (([Text] = @original_Text) OR ([Text] IS NULL AND @original_Text IS NULL)) AND [First_Line] = @original_First_Line AND (([Second_Line] = @original_Second_Line) OR ([Second_Line] IS NULL AND @original_Second_Line IS NULL)) AND (([Third_Line] = @original_Third_Line) OR ([Third_Line] IS NULL AND @original_Third_Line IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="String" />
                        <asp:Parameter Name="original_Area_Id" Type="String" />
                        <asp:Parameter Name="original_Text" Type="String" />
                        <asp:Parameter Name="original_First_Line" Type="String" />
                        <asp:Parameter Name="original_Second_Line" Type="String" />
                        <asp:Parameter Name="original_Third_Line" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Complete" Type="Boolean" />
                        <asp:Parameter Name="original_Version" Type="Object" />
                        <asp:Parameter DbType="DateTimeOffset" Name="original_CreatedAt" />
                        <asp:Parameter DbType="DateTimeOffset" Name="original_UpdatedAt" />
                        <asp:Parameter Name="original_Deleted" Type="Boolean" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="String" />
                        <asp:Parameter Name="Area_Id" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="First_Line" Type="String" />
                        <asp:Parameter Name="Second_Line" Type="String" />
                        <asp:Parameter Name="Third_Line" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Complete" Type="Boolean" />
                        <asp:Parameter Name="Version" Type="Object" />
                        <asp:Parameter DbType="DateTimeOffset" Name="CreatedAt" />
                        <asp:Parameter DbType="DateTimeOffset" Name="UpdatedAt" />
                        <asp:Parameter Name="Deleted" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Area_Id" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="First_Line" Type="String" />
                        <asp:Parameter Name="Second_Line" Type="String" />
                        <asp:Parameter Name="Third_Line" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Complete" Type="Boolean" />
                        <asp:Parameter Name="Version" Type="Object" />
                        <asp:Parameter Name="CreatedAt" DbType="DateTimeOffset" />
                        <asp:Parameter Name="UpdatedAt" DbType="DateTimeOffset" />
                        <asp:Parameter Name="Deleted" Type="Boolean" />
                        <asp:Parameter Name="original_Id" Type="String" />
                        <asp:Parameter Name="original_Area_Id" Type="String" />
                        <asp:Parameter Name="original_Text" Type="String" />
                        <asp:Parameter Name="original_First_Line" Type="String" />
                        <asp:Parameter Name="original_Second_Line" Type="String" />
                        <asp:Parameter Name="original_Third_Line" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Complete" Type="Boolean" />
                        <asp:Parameter Name="original_Version" Type="Object" />
                        <asp:Parameter DbType="DateTimeOffset" Name="original_CreatedAt" />
                        <asp:Parameter DbType="DateTimeOffset" Name="original_UpdatedAt" />
                        <asp:Parameter Name="original_Deleted" Type="Boolean" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            

        </div>
    </div>


  

</asp:Content>