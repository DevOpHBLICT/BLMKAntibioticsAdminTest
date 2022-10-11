<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Sites.master" AutoEventWireup="true" CodeFile="RAG.aspx.cs" Inherits="Account_Manage" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script runat="server">

  
</script>



        <span style="font-weight: bold; font-size: x-large; text-decoration: underline">Drug/Colour combination</span><br />
    <br />
    <br />

        <asp:Button style="color:white;Background-Color: green" CssClass="btn btn-default" ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click" Text="Add Drug/Colour combination"></asp:Button>
   
       
    <br />
   
       
    Filter Drug: 
    <br />

       
 
      
                <asp:GridView ID="GridView1" width="1200px" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"  CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                             <asp:BoundField  DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                      
                         <asp:BoundField DataField="Area" HeaderText="Drug" SortExpression="Area" />
                         <asp:BoundField DataField="Description" HeaderText="Colour" SortExpression="Area" />
                           
                             <asp:CheckBoxField DataField="Complete" HeaderText="Complete" SortExpression="Complete" />
                         <asp:BoundField DataField="CreatedAt" HeaderText="CreatedAt" SortExpression="CreatedAt" />
                         <asp:BoundField DataField="UpdatedAt" HeaderText="UpdatedAt" SortExpression="UpdatedAt" />
                             <asp:CheckBoxField DataField="Deleted" HeaderText="Deleted" SortExpression="Deleted" />
                      
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
          
              
            

        </div>
    </div>


  

</asp:Content>