<%@ Page Language="C#" MasterPageFile="~/Basic.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Outsourced Non full time employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
        width: 580px;
    }
        .style7
        {
        height: 28px;
        width: 580px;
    }
    .style9
    {
        width: 580px;
        height: 41px;
    }
    .style12
    {
        width: 128%;
    }
    .style13
    {
        width: 101px;
    }
    .style14
    {
        width: 242px;
    }
    .style15
    {
        width: 115px;
    }
    .style16
    {
        width: 324px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" 
        Font-Size="Small" ForeColor="#333333" Height="177px" align="Center" 
        onauthenticate="Login1_Authenticate" Width="378px" >
        <CheckBoxStyle Font-Names="Tahoma" Font-Size="Small" />
        <TextBoxStyle Font-Size="0.8em" />
        <LoginButtonStyle BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            ForeColor="#284775" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <TitleTextStyle BackColor="#003366" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
    </asp:Login>
    </asp:Content>
