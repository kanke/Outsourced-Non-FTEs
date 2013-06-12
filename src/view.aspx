<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="view" Title="View All Reports Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="msgBox" namespace="BunnyBear" tagprefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
        }
        .style10
    {
    }
        .style11
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="style1">
        <tr>
            <td class="style11">
                Search by:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="SN ">S/N </asp:ListItem>
                    <asp:ListItem Value="staff_no">Staff ID No</asp:ListItem>
                    <asp:ListItem Value="staffname">Name</asp:ListItem>
                    <asp:ListItem Value="gender">Gender</asp:ListItem>
                    <asp:ListItem Value="jobrole_name">Job Role</asp:ListItem>
                    <asp:ListItem Value="date_of_employ">Date of Employment</asp:ListItem>
                    <asp:ListItem Value="date_of_birth">Date of Birth</asp:ListItem>
                    <asp:ListItem Value="dept">Department</asp:ListItem>
                    <asp:ListItem Value="cost_cent_no">Cost centre No</asp:ListItem>
                    <asp:ListItem Value="acct_no">Account No</asp:ListItem>
                    <asp:ListItem Value="Monthly_netpay">Monthly Net Pay</asp:ListItem>
                    <asp:ListItem Value="Monthly_gross_pay">Monthly Gross Pay</asp:ListItem>
                    <asp:ListItem Value="ctc">CTC</asp:ListItem>
                    <asp:ListItem Value="ctc_medicals">CTC+Medicals</asp:ListItem>
                    <asp:ListItem Value="grade">Appraisal Grade</asp:ListItem>
                    <asp:ListItem Value="branch_name">Branch</asp:ListItem>
                    <asp:ListItem Value="sap_id">Sap ID</asp:ListItem>
                    <asp:ListItem Value="description">Academic Qualification</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Required Field" ControlToValidate="DropDownList2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                Search Field:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" DescriptionUrl="Search" 
                    ImageUrl="~/images/1305880811_search_button.png" onclick="ImageButton1_Click" />
&nbsp;
            </td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" 
                    Text="Click on the Column headers to Sort" ForeColor="#000066"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style11" colspan="3">
                <hr style="width: 1024px; height: -12px;" align="left" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="3">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    Width="1029px" TabIndex="5" DataKeyNames="staff_no" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    style="margin-bottom: 10px" onrowdeleting="GridView1_RowDeleting" 
                    onsorting="GridView1_Sorting">
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <Columns>
                        <asp:BoundField HeaderText="Staff Name" DataField="staffname" SortExpression="staffname" />
                        <asp:BoundField HeaderText="Staff ID No" DataField="staff_no" ReadOnly="True" 
                                                SortExpression="staff_no" />
                        <asp:BoundField DataField="sap_id" HeaderText="Sap ID" 
                                                SortExpression="sap_id" />
                        <asp:BoundField HeaderText="Gender" DataField="gender" SortExpression="gender" />
                        <asp:BoundField HeaderText="date of Employment" DataField="date_of_employ" 
                                                SortExpression="date_of_employ" />
                        <asp:BoundField HeaderText="Department" DataField="dept" SortExpression="dept_id" />
                        <asp:BoundField HeaderText="Jobrole" DataField="jobrole_name" SortExpression="jobrole_id" />
                        <asp:BoundField HeaderText="Account no" DataField="acct_no" SortExpression="acct_no" />
                        <asp:BoundField HeaderText="CTC" DataField="ctc" SortExpression="ctc" />
                        <asp:BoundField HeaderText="Grade" DataField="grade" SortExpression="grade" />
                        <asp:BoundField HeaderText="Branch" DataField="branch_name" SortExpression="branch_id" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                            <a href='edit.aspx?sid=<%# DataBinder.Eval(Container.DataItem, "staff_no") %>'>Edit</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                
                <cc2:msgBox ID="msgBox1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="3">
                &nbsp;&nbsp;
                <asp:ImageButton ID="excelButton" runat="server" AlternateText="Excel Format" 
                    ImageAlign="Left" ImageUrl="~/images/1305883412_table_excel.png" 
                    onclick="excelButton_Click" />
                    
            </td>
        </tr>
    </table>
    
</asp:Content>

