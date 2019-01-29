<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrdersList.aspx.cs" Inherits="OpticalPointOfSale.Pages.OrdersList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpCenter" runat="server">
    <script type="text/javascript">
       
    </script>
    <table align="left" cellpadding="0" cellspacing="0" style="width: 100%; float: left">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblHeading" runat="server" CssClass="site-title" Text="Orders Lists"></asp:Label>
            </td>
            
        </tr>
        
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblError" runat="server" CssClass="error" Font-Size="Medium"></asp:Label>
            </td>
            
        </tr>
        
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" CssClass="message-success" Font-Size="Medium"></asp:Label>
            </td>
            
        </tr>
        
        <tr>
            <td style="width: 20%">
                <asp:Label ID="Label5" runat="server" Text="Search Type" CssClass="label"></asp:Label>
            </td>
            
        </tr>
        
        <tr>
            <td style="width: 20%; padding:0px;">
                <table align="left" cellpadding="0" cellspacing="0" style="width: 100%; float: left">
                    <tr>
                        <td style="width: 20%; padding:0px 1.5em 0px 0px">
                            <asp:DropDownList ID="cmbSearchType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbSearchType_SelectedIndexChanged" Width="100%" CssClass="select"></asp:DropDownList>
                        </td>
                        <td style="width: 70%">
                            <asp:TextBox ID="txtSearchText" runat="server" Width="100%"></asp:TextBox>
                        </td>
                        <td style="width: 10%; padding:0px">
                             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Width="100%" CssClass="button buttonSubmit" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td style="width: 20%"></td>
        </tr>      
        <tr>
            <td colspan="2" style="width: 80%; padding:0px;">
                <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="Grid" DataKeyNames="OrderId" AllowPaging="True" OnPageIndexChanging="gvOrders_PageIndexChanging" PageSize="30">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="OrderId" DataNavigateUrlFormatString="~/Pages/AddEditOrder.aspx?orderid={0}" DataTextField="OrderId" HeaderText="Order #" NavigateUrl="~/Pages/AddEditOrder.aspx" >
                        <ItemStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle"/>
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                        <asp:BoundField DataField="CustomerContact" HeaderText="Customer Contact" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                        <asp:BoundField DataField="DeliveryDate" HeaderText="Delivery Date" />
                        <asp:BoundField DataField="Particularls" HeaderText="Particularls" />
                        <asp:BoundField DataField="F_L_C" HeaderText="F/L/C" />
                        <asp:BoundField DataField="Total" HeaderText="Total" />
                        <asp:BoundField DataField="Advance" HeaderText="Advance" />
                        <asp:BoundField DataField="Balance" HeaderText="Balance" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" Visible="False" />
                    </Columns>
                    <PagerStyle CssClass="pgr" HorizontalAlign="Center" />
                </asp:GridView>
            </td>
        </tr>
        
        <tr>
            <td style="text-align: center;" colspan="2">&nbsp;</td>
        </tr>
        
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooter" runat="server">
</asp:Content>
