<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 77px;
        }
        .style4
        {
            width: 158px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" style="width: 66%" >
        <tr>
            <td align="center" colspan="3">
                To add a new user, enter the username and SAP IDs in the Textfields provided below</td>
        </tr>
        <tr>
            <td align="justify" colspan="3">
                <hr align="left" style="width: 888px; height: -12px" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                User Name:</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxuser" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxuser" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                SAP ID:</td>
            <td class="style4">
                <asp:TextBox ID="TextBoxsap" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxsap" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Font-Names="Trebuchet MS" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Add" 
                    ImageUrl="~/images/1306488016_Add.png" onclick="ImageButton1_Click" 
                    Width="31px" ToolTip="Add" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton3" runat="server" AlternateText="Reset" 
                    ImageUrl="~/images/1306488316_Reset.png" onclick="ImageButton3_Click" 
                    ToolTip="Reset" />
            </td>
        </tr>
    </table>
</asp:Content>

