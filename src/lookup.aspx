<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="lookup.aspx.cs" Inherits="lookup" Title="Look-Up Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 99px;
        }
        .style4
        {
            width: 243px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" style="width: 72%">
        <tr>
            <td colspan="4" align="justify">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                To add new, pick an option and enter the value in the Textfield
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <hr align="left" style="width: 891px" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Choose Option</td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="jobrole_name">Add Jobrole</asp:ListItem>
                    <asp:ListItem Value="linemanager">Add Line Manager</asp:ListItem>
                    <asp:ListItem Value="training_status">Add Training Status</asp:ListItem>
                    <asp:ListItem Value="grade">Add Appraisal Grade</asp:ListItem>
                    <asp:ListItem Value="description">Add Qualification</asp:ListItem>
                    <asp:ListItem Value="provider_name">Add Service Provider</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="DropDownList2" ErrorMessage="Please choose an option">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Enter Value in the Textfield</td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Please enter a value">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Font-Names="Trebuchet MS" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="addButton" runat="server" AlternateText="ADD" 
                    ImageUrl="~/images/1306488016_Add.png" onclick="addButton_Click" 
                    ToolTip="Add" />
&nbsp;
                &nbsp;
                <asp:ImageButton ID="resetButton" runat="server" AlternateText="Reset" 
                    ImageUrl="~/images/1306488316_Reset.png" onclick="ImageButton3_Click" 
                    ToolTip="Reset" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

