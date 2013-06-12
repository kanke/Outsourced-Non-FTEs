<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="add" Title="Add New Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
    {
        }
    .style4
    {
            width: 279px;
        }
        .style5
        {
        }
        .style6
        {
            width: 259px;
        }
    </style>
    <link type="text/css" href="radcalendar.css" rel="stylesheet" />
    <script type="text/javascript"> 
function Alert(txt){ 
    alert(txt) 
} 
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="style1" style="margin: 2px; padding: 2px; color: #0000FF" 
    align="center" cellpadding="2px" cellspacing="2px" width="500">
    <tr>
        <td class="style3" style="color: #0000FF" colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="260px" />
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Staff ID NO :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                ControlToValidate="TextBox19" ErrorMessage="Insert Id No">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            SAP Id&nbsp; :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Insert Sap Id " ControlToValidate="TextBox1" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Name :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="* Insert Staff " ControlToValidate="TextBox2" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Gender :</td>
        <td class="style4">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Value="M">Male</asp:ListItem>
                <asp:ListItem Value="F">Female</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            Job Role :</td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList4" runat="server" 
                DataSourceID="jobroleDataSource" DataTextField="jobrole_name" 
                DataValueField="jobrole_id" ForeColor="#0000CC">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="* Insert job role" ControlToValidate="DropDownList4" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Date of Legacy</td>
        <td class="style4">
            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="TextBox18_CalendarExtender" runat="server" 
                Enabled="True" CssClass="radcalendar" TargetControlID="TextBox18">
            </cc1:CalendarExtender>
&nbsp;&nbsp;
            <asp:Image ID="Image4" runat="server" 
                ImageUrl="~/images/1305898649_Calender.png" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                ControlToValidate="TextBox18" ErrorMessage=" Pick a date of Legacy">*</asp:RequiredFieldValidator>
                                </td>
    </tr>
    <tr>
        <td class="style6">
            Date of Employment :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                Enabled="True" CssClass="radcalendar" TargetControlID="TextBox4">
            </cc1:CalendarExtender>
        &nbsp;&nbsp;
            <asp:Image ID="Image2" runat="server" 
                ImageUrl="~/images/1305898649_Calender.png" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="* Pick a date of " ControlToValidate="TextBox4" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Date of Birth :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                Enabled="True" CssClass="radcalendar" TargetControlID="TextBox5">
            </cc1:CalendarExtender>
        &nbsp;&nbsp;
            <asp:Image ID="Image3" runat="server" 
                ImageUrl="~/images/1305898649_Calender.png" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="* Pick a date of " ControlToValidate="TextBox5" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Business Unit :</td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList1" runat="server" ForeColor="#0000CC" 
                DataValueField="bu_id" DataSourceID="business_unitsDataSource" 
                DataTextField="bu_name" AutoPostBack="true" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="20px" 
                Width="134px">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="a Business unit" ControlToValidate="DropDownList1" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Department :</td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList2" runat="server" ForeColor="#0000CC" 
                DataValueField="dept_id" DataSourceID="departmentsDataSource" 
                DataTextField="department" AutoPostBack="true" Width="138px" 
                Height="19px">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="DropDownList2" ErrorMessage="* Pick a Department" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Branch :</td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList3" runat="server" ForeColor="#0000CC" 
                Height="20px" Width="102px" DataSourceID="branchDataSource" 
                DataTextField="branch_name" DataValueField="branch_no">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                ControlToValidate="DropDownList3" ErrorMessage="* Pick a Branch" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Cost centre No :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ErrorMessage="* Insert cost " ControlToValidate="TextBox8" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Account No :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ErrorMessage="* Insert account " ControlToValidate="TextBox9" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox9" Display="Dynamic" 
                ErrorMessage="Account number should be 10 digits" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Monthly Net Payment :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ErrorMessage="* Insert monthly Net Payment" ControlToValidate="TextBox15" 
                Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox15" 
                ErrorMessage="Please enter a numeric value with two decimal places WITHOUT a comma." 
                ValidationExpression="\s*\d+\.\d{2}\s*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Monthly Gross Payment :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ErrorMessage="* Insert monthly Gross Payment" 
                ControlToValidate="TextBox14" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="TextBox14" 
                ErrorMessage="Please enter a numeric value with two decimal places WITHOUT a comma." 
                ValidationExpression="\s*\d+\.\d{2}\s*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            CTC :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="TextBox11" ErrorMessage="* Insert cost to Company">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="TextBox11" 
                ErrorMessage="Please enter a numeric value with two decimal places WITHOUT a comma." 
                ValidationExpression="\s*\d+\.\d{2}\s*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            CTC+Medical :</td>
        <td class="style4">
            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ErrorMessage="* Insert CTC Medical" ControlToValidate="TextBox12">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="TextBox12" 
                ErrorMessage="Please enter a numeric value with two decimal places WITHOUT a comma." 
                ValidationExpression="\s*\d+\.\d{2}\s*">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Appraisal Grade :</td>
        <td class="style4">
            <asp:DropDownList ID="gradeDropDownList" runat="server" 
                DataSourceID="gradeDataSource" DataTextField="grade" DataValueField="id" 
                ForeColor="#0000CC">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ErrorMessage="* Pick Appraisal grade" 
                ControlToValidate="gradeDropDownList">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Academic Qualification :</td>
        <td class="style4">
            <asp:DropDownList ID="qualDropDownList" runat="server" 
                DataSourceID="qualificationDataSource" DataTextField="description" 
                DataValueField="qual_id" ForeColor="#0000CC" 
                >
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                ControlToValidate="qualDropDownList" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Line manager :</td>
        <td class="style4">
            <asp:DropDownList ID="lineDropDownList" runat="server" 
                DataSourceID="lineSqlDataSource" DataTextField="linemanager" 
                DataValueField="line_id" ForeColor="#0000CC">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                ControlToValidate="lineDropDownList" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Training Status</td>
        <td class="style4">
            <asp:DropDownList ID="trainDropDownList" runat="server" 
                DataSourceID="trainDataSource" DataTextField="training_status" 
                DataValueField="training_id" ForeColor="#0000CC">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                ControlToValidate="trainDropDownList" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                </td>
    </tr>
    <tr>
        <td class="style6" style="color: #0000FF">
            Service Provider:</td>
        <td class="style4">
            <asp:DropDownList ID="providerDropDownList" runat="server" 
                DataSourceID="providerSqlDataSource" DataTextField="provider_name" 
                DataValueField="provider_id" ForeColor="#0000CC">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                ControlToValidate="providerDropDownList" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
        </td>
        <td>
        </td>
        <td class="style5">
            <asp:Button ID="Button1" runat="server" Height="25px" onclick="Button1_Click" 
                Text="Add" Width="84px" />
        </td>
    </tr>
    <tr>
        <td class="style6">
            <asp:SqlDataSource ID="jobroleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select jobrole_name, jobrole_id from nfte.jobrole">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="branchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select branch_no, branch_name from nfte.branches">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="qualificationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select qual_id, description from nfte.qualification">
            </asp:SqlDataSource>
        </td>
        <td class="style4">
            <asp:SqlDataSource ID="business_unitsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select bu_name,bu_id from cb.business_units">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="gradeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select id, grade from nfte.appraisal_grade">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="lineSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select line_id,linemanager from nfte.linemanager">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="trainDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select training_id,training_status from nfte.trainingstatus">
            </asp:SqlDataSource>
        </td>
        <td>
            <asp:SqlDataSource ID="providerSqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select provider_id,provider_name from nfte.providers">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="departmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:nfte %>" 
                SelectCommand="select department,dept_id from cb.departments where bu_id = @unit">
                <SelectParameters>
                   <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="unit" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>

