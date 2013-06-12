<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="edit" Title="Edit Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="NfteDetailsView" runat="server" AutoGenerateRows="False" 
        DataKeyNames="staff_no" DataSourceID="generalDataSource" Width="663px" 
        AllowPaging="True" DefaultMode="Edit" 
        onitemupdated="NfteDetailsView_ItemUpdated" 
        onitemcreated="NfteDetailsView_ItemCreated" 
        onitemupdating="NfteDetailsView_ItemUpdating" 
        ondatabound="NfteDetailsView_DataBound">
        <FieldHeaderStyle Width="160px" BackColor="AliceBlue" Font-Names="Verdana" Font-Size="12px" />
        <RowStyle Font-Names="Verdana" Font-Size="12px" />
        <Fields>
            <asp:BoundField DataField="sn" HeaderText="S/N" ReadOnly="true" />
            <asp:BoundField DataField="staff_no" HeaderText="Staff ID NO" ReadOnly="true" />
            <asp:BoundField DataField="sap_id" HeaderText="SAP ID" ReadOnly="true"/>
            <asp:BoundField DataField="staffname" HeaderText="Staff Name"/>
            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    SelectedValue='<%# Bind("gender") %>' RepeatDirection="Horizontal">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Role" SortExpression="jobrole_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="jobRoleDropDownList" runat="server" 
                        DataSourceID="jobDataSource" DataTextField="jobrole_name" 
                        DataValueField="jobrole_id" SelectedValue='<%# Bind("jobrole_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date_of_legacy" HeaderText="Date of Legacy" 
                DataFormatString="{0:d}" HtmlEncode="false" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="date_of_employ" HeaderText="Date of employment" 
                DataFormatString="{0:d}" HtmlEncode="false" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="date_of_birth" HeaderText="Date of Birth" 
                DataFormatString="{0:d}" HtmlEncode="false" ApplyFormatInEditMode="True"/>
            <asp:TemplateField HeaderText="Business Unit">
                <EditItemTemplate>
                    <asp:DropDownList ID="buDropDownList" runat="server" AutoPostBack="true" 
                        DataSourceID="unitDataSource" DataTextField="business_unit" 
                        DataValueField="bu_id" SelectedValue='<%# Eval("bu_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Department" SortExpression="dept_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="deptDropDownList" runat="server" 
                        DataSourceID="departmentDataSource" DataTextField="dept" 
                        DataValueField="dept_id" SelectedValue='<%# Bind("dept_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Branch" SortExpression="branch_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="branchDropDownList" runat="server" 
                        DataSourceID="branchSqlDataSource" DataTextField="branch_name" 
                        DataValueField="branch_no" SelectedValue='<%# Bind("branch_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="cost_cent_no" HeaderText="Cost centre No"/>
            <asp:BoundField DataField="acct_no" HeaderText="Account No"/>
            <asp:BoundField DataField="monthly_netpay" HeaderText="Monthly Net pay" 
                DataFormatString="{0:F2}" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="monthly_gross_pay" HeaderText="Monthly gross Pay" 
                DataFormatString="{0:F2}" ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="ctc" HeaderText="CTC" DataFormatString="{0:F2}" 
                ApplyFormatInEditMode="True"/>
            <asp:BoundField DataField="ctc_medicals" HeaderText="CTC+Medicals" 
                DataFormatString="{0:F2}" ApplyFormatInEditMode="True"/>
            <asp:TemplateField HeaderText="Appraisal Grade">
                <EditItemTemplate>
                    <asp:DropDownList ID="GradeDropDownList" runat="server" 
                        DataSourceID="gradeDataSource" DataTextField="grade" DataValueField="id"
                        SelectedValue='<%# Bind("id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Academic Qualification">
                <EditItemTemplate>
                    <asp:DropDownList ID="qualDropDownList" runat="server" 
                        DataSourceID="qualDataSource" DataTextField="description" 
                        DataValueField="qual_id" SelectedValue='<%# Bind("qual_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Line Manager">
                <EditItemTemplate>
                    <asp:DropDownList ID="lineManDropDownList" runat="server" 
                        DataSourceID="lineSqlDataSource" DataTextField="linemanager" 
                        DataValueField="line_id" SelectedValue='<%# Bind("line_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Training Status">
                <EditItemTemplate>
                    <asp:DropDownList ID="trainStatDropDownList" runat="server" 
                        DataSourceID="trainSqlDataSource" DataTextField="training_status" 
                        DataValueField="training_id" SelectedValue='<%# Bind("training_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Provider">
                <EditItemTemplate>
                    <asp:DropDownList ID="providerDropDownList" runat="server" 
                        DataSourceID="providerDataSource" DataTextField="provider_name" 
                        DataValueField="provider_id" SelectedValue='<%# Bind("provider_id") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" ItemStyle-HorizontalAlign="Center"
                CancelImageUrl="~/images/toolbar-cancel-over.gif" 
                UpdateImageUrl="~/images/update.gif">
            <ItemStyle HorizontalAlign="Center"/>
            </asp:CommandField>
            <asp:CommandField 
                CancelImageUrl="~/images/toolbar-cancel-over.gif" ShowEditButton="True" 
                UpdateImageUrl="~/images/update.gif" ShowCancelButton="False" />
        </Fields>
    </asp:DetailsView>
    <asp:HyperLink runat = "server" NavigateUrl="~/view.aspx" Text="Back To Reports"></asp:HyperLink>
    <asp:SqlDataSource ID="generalDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="nfte.fetchdetails" SelectCommandType="StoredProcedure"
        UpdateCommand="nfte.update" UpdateCommandType="StoredProcedure" 
        onupdated="generalDataSource_Updated" onupdating="generalDataSource_Updating" 
        >
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="sid" Name="staff_no" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter QueryStringField="sid" Name="staff_no" />             
            <asp:Parameter Name="staffname" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="date_of_legacy" Type="DateTime" />
            <asp:Parameter Name="date_of_employ" Type="DateTime" />
            <asp:Parameter Name="date_of_birth" Type="DateTime" />
            <asp:Parameter Name="jobrole_id" Type="Int32" />
            <asp:Parameter Name="dept_id" Type="Int32" />
            <asp:Parameter Name="branch_id" Type="Int32" />
            <asp:Parameter Name="cost_cent_no" Type="String" />
            <asp:Parameter Name="acct_no" Type="String" />
            <asp:Parameter Name="monthly_netpay" Type="String" />
            <asp:Parameter Name="monthly_gross_pay" Type="String" />
            <asp:Parameter Name="ctc" Type="String" />
            <asp:Parameter Name="ctc_medicals" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="training_id" Type="Int32" />
            <asp:Parameter Name="line_id" Type="Int32" />
            <asp:Parameter Name="qual_id" Type="Int32" />
            <asp:Parameter Name="provider_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:SqlDataSource ID="departmentDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select dept_id, dept from nfte.departments where bu_id = @bu_id" 
        onselecting="departmentDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter Name="bu_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="unitDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select business_unit,bu_id from nfte.businessunits">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="gradeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" SelectCommand="select id,grade from nfte.appraisal_grade">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="branchSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:nfte %>" 
    SelectCommand="select branch_no,branch_name from nfte.branches">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="lineSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select line_id,linemanager from nfte.linemanager">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="jobDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select jobrole_id,jobrole_name from nfte.jobrole">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="providerDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select provider_id,provider_name from nfte.providers">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="trainSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select training_id,training_status from nfte.trainingstatus">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="qualDataSource" runat="server"
       ConnectionString="<%$ ConnectionStrings:nfte %>" 
        SelectCommand="select qual_id,description from nfte.qualification"/>
</asp:Content>

