<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sites.Master" AutoEventWireup="true" CodeFile="Edit_Logo.aspx.cs" validateRequest="false" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


           <asp:Label ID="Label1" runat="server" Text="Edit Logo" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
       <div class="form-group" >
<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="True"></asp:Label>
</div>
    
    
    
    
    <br />
    <br />  
    <br />
           <asp:Image ID="Image1" runat="server" />
    <br />
  
 
      
    <br />  
           <asp:FileUpload ID="FileUpload1" runat="server" />
    <br /> 
       
 <div class="form-group" > 
 
<div class="form-group"> </div>
     


           </div>
<div class="form-group" >     
    <strong>     
    <br />
    </strong> 
    <br />
    <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Confirm"    />
    <br />
           </div>

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-default" Text="Cancel"   /></div>

 
    <div class="form-group">  
                     </div>
                     
                

                     <strong>
 


                     </strong>

            
 
<asp:SqlDataSource ID="Catheters" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
SelectCommand="SELECT * FROM [Areas]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Areas] WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" InsertCommand="INSERT INTO [Areas] ([Id], [Area], [Description], [Complete], [Version], [CreatedAt], [UpdatedAt], [Deleted], [user_id]) VALUES (@Id, @Area, @Description, @Complete, @Version, @CreatedAt, @UpdatedAt, @Deleted, @user_id)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Areas] SET [Area] = @Area, [Description] = @Description, [Complete] = @Complete, [Version] = @Version, [CreatedAt] = @CreatedAt, [UpdatedAt] = @UpdatedAt, [Deleted] = @Deleted, [user_id] = @user_id WHERE [Id] = @original_Id AND (([Area] = @original_Area) OR ([Area] IS NULL AND @original_Area IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Complete] = @original_Complete AND [Version] = @original_Version AND [CreatedAt] = @original_CreatedAt AND (([UpdatedAt] = @original_UpdatedAt) OR ([UpdatedAt] IS NULL AND @original_UpdatedAt IS NULL)) AND [Deleted] = @original_Deleted AND (([user_id] = @original_user_id) OR ([user_id] IS NULL AND @original_user_id IS NULL))" >
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
SelectCommand="SELECT * FROM [Areas]" OldValuesParameterFormatString="original_{0}" >
</asp:SqlDataSource>




 

      

 

</asp:Content>