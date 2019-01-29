<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddEditOrder.aspx.cs" Inherits="OpticalPointOfSale.Pages.AddEditOrder" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpCenter" runat="server">
    <script type="text/javascript">
        
        function calcBalance()
        {
            var total = document.getElementById('<%= txtTotal.ClientID %>').value;
            var advance = document.getElementById('<%= txtAdvance.ClientID %>').value;
            var balance = total - advance;
            document.getElementById('<%= txtBalance.ClientID %>').value = balance;
        }
    </script>
    <asp:ScriptManager ID="toolScriptManageer1" runat="server"></asp:ScriptManager>
    <table align="left" cellpadding="0" cellspacing="0" style="width: 100%; float: left">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblHeading" runat="server" CssClass="site-title" Text="Create Order"></asp:Label>
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
            <td>
                <asp:Label ID="Label6" runat="server" Text="System Order #"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Book Serial #" CssClass="label"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 40%">
                <asp:TextBox ID="txtSystemOrderNo" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
            </td>
            <td style="width: 40%">
                <asp:TextBox ID="txtBookSerial" runat="server"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 40%">
                <asp:Label ID="Label2" runat="server" Text="Date" CssClass="label"></asp:Label>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field is required</asp:RequiredFieldValidator>
            </td>
            <td style="width: 40%">
                <asp:Label ID="Label3" runat="server" Text="Delivery Date"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td style="width: 40%">
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" ID="txtDateExtender" TargetControlID="txtDate" Format="MMM dd yyyy" PopupButtonID="Image1" />
            </td>
            <td style="width: 40%">
                <asp:TextBox ID="txtDeliveryDate" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" ID="txtDeliveryDateExtender" TargetControlID="txtDeliveryDate" Format="MMM dd yyyy" PopupButtonID="Image1" />
            </td>
        </tr>
        
        <tr>
            <td style="width: 40%">
                <asp:Label ID="Label4" runat="server" Text="Customer Name" CssClass="label"></asp:Label>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerName" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field is required</asp:RequiredFieldValidator>
            </td>
            <td style="width: 40%"></td>
        </tr>
        
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="width: 40%">
                <asp:Label ID="Label5" runat="server" Text="Contact information" CssClass="label"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" style="width: 80%">
                <asp:TextBox ID="txtContactInfo" runat="server"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="text-align: center; width: 80%" colspan="2">
                <asp:Label ID="Label7" runat="server" Text="Particulars"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" style="width: 80%">
                <asp:TextBox ID="txtParticulars" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td style="padding: 0px 2em 0em 0em; width: 40%; vertical-align: top;">
                <table align="left" cellpadding="0" cellspacing="0" class="float-left">
                    <tr>
                        <td style="padding: 0px 10px 0px 0px; margin: 0px;"> 
                     <table cellpadding="0" cellspacing="0" style="border: 1px solid #999999; width: 100%;">
                    <tr>
                        <td colspan="5" style="padding: 0px; margin: 0px; text-align:center; background-color: #999999; font-size: large; color: #FFFFFF; font-weight: bold;">
                <asp:Label ID="Label14" runat="server" Text="Right Eye" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:30px" >
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;"></td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">SPH</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">CYL</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">AXIS</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">VA</td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999; text-align: center;">D</td>
                        <td style="padding: 0em 0.9em 0em 0em; border: 1px solid #999999;">
                <asp:TextBox ID="txtR_SPH_D" runat="server"></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_CYL_D" runat="server" ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_AXIS_D" runat="server" ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_VA_D" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999">R</td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_SPH_R" runat="server" ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_CYL_R" runat="server" TextMode="SingleLine"></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_AXIS_R" runat="server" ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_VA_R" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999">CL</td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_SPH_CL" runat="server"></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_CYL_CL" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_AXIS_CL" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtR_VA_CL" runat="server"  ></asp:TextBox>
                        </td>
                    </tr>
                </table>

                        </td>
                        <td style="padding: 0px 0px 0px 10px; margin: 0px;">     
                     <table cellpadding="0" cellspacing="0" style="border: 1px solid #999999">
                    <tr>
                        <td colspan="5" style="padding: 0px; margin: 0px; text-align:center; font-size: large; font-weight: bold; color: #FFFFFF; background-color: #999999;">
                <asp:Label ID="Label15" runat="server" Text="Left Eye" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:30px" >
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;"></td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">SPH</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">CYL</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">AXIS</td>
                        <td style="border: 1px solid #999999;padding: 0px; margin: 0px; text-align:center;">VA</td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999">D</td>
                        <td style="padding:0em 0.9em 0em 0em; border: 1px solid #999999">
                <asp:TextBox ID="txtL_SPH_D" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_CYL_D" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_AXIS_D" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_VA_D" runat="server"  ></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999">R</td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_SPH_R" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_CYL_R" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_AXIS_R" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_VA_R" runat="server"  ></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #999999; height:38px" >
                        <td style="padding: 0px; margin: 0px; text-align:center; border: 1px solid #999999">CL</td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_SPH_CL" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_CYL_CL" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_AXIS_CL" runat="server"  ></asp:TextBox>
                        </td>
                        <td style="padding: 0em 0.9em 0em 0em;border: 1px solid #999999">
                <asp:TextBox ID="txtL_VA_CL" runat="server"  ></asp:TextBox>
                        </td>
                    </tr>
                </table>               </td>
                    </tr>
                </table>
            </td>
            <td style="width: 40%; padding-right: 0px;">
                <table cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Frame"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Lenses"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%">
                <asp:TextBox ID="txtFrames" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 50%">
                <asp:TextBox ID="txtLense" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Contact Lenses"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Total"></asp:Label>
                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                <asp:TextBox ID="txtContactLenses" runat="server"></asp:TextBox>
                        </td>
                        <td>
                <asp:TextBox ID="txtTotal" runat="server" TextMode="Number" onKeyUp = "calcBalance()">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="Label12" runat="server" Text="Advance"></asp:Label>
                        </td>
                        <td>
                <asp:Label ID="Label13" runat="server" Text="Balance"></asp:Label>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBalance" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field is required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:TextBox ID="txtAdvance" runat="server" TextMode="Number" onKeyUp = "calcBalance()">0</asp:TextBox>
                        </td>
                        <td>
                <asp:TextBox ID="txtBalance" runat="server" TextMode="Number">0</asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td style="text-align: center;" colspan="2"><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  CssClass="button buttonSubmit" /></td>
        </tr>
        
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooter" runat="server">
</asp:Content>
