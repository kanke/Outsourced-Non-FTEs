using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class edit : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.QueryString.HasKeys())
        {
            Response.Redirect("view.aspx");
        }
    }
    protected void buDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList deptDropDownList = (DropDownList)NfteDetailsView.FindControl("deptDropDownList");
        if (deptDropDownList != null)
        {
            deptDropDownList.DataBind();
        }
    }

    protected void departmentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        DropDownList buDropDownList = (DropDownList)NfteDetailsView.FindControl("buDropDownList");
        DropDownList deptDropDownList = (DropDownList)NfteDetailsView.FindControl("deptDropDownList");
        if (deptDropDownList != null)
        {
            e.Command.Parameters["@bu_id"].Value = buDropDownList.SelectedValue;
        }
    }


    protected void NfteDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {

        if (e.Exception != null)
        {
            Label2.Text = "Record not Updated" + " ! " + e.Exception.Message;
            // notify the user
        }
        else
        {
            Label2.Text = "Record Updated" + " ! ";


            // show a sucess message
            //go back to view page
        }

        e.ExceptionHandled = true;
    }

    protected void NfteDetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        Encryptor enc = new Encryptor();
        e.NewValues["monthly_netpay"] = enc.Encrypt(e.NewValues["monthly_netpay"].ToString());
        e.NewValues["monthly_gross_pay"] = enc.Encrypt(e.NewValues["monthly_gross_pay"].ToString());
        e.NewValues["ctc"] = enc.Encrypt(e.NewValues["ctc"].ToString());
        e.NewValues["ctc_medicals"] = enc.Encrypt(e.NewValues["ctc_medicals"].ToString());
    }
    protected void NfteDetailsView_ItemCreated(object sender, EventArgs e)
    {
        //Encryptor enc = new Encryptor();

        //TextBox netpayTextBox = (TextBox)NfteDetailsView.Rows[14].Cells[1].Controls[0];
        //netpayTextBox.Text = enc.Decrypt(netpayTextBox.Text);
    }
    protected void NfteDetailsView_DataBound(object sender, EventArgs e)
    {
        Encryptor enc = new Encryptor();

        TextBox netpayTextBox = (TextBox)NfteDetailsView.Rows[14].Cells[1].Controls[0];
        netpayTextBox.Text = enc.Decrypt(netpayTextBox.Text);

        TextBox grosspayTextBox = (TextBox)NfteDetailsView.Rows[15].Cells[1].Controls[0];
        grosspayTextBox.Text = enc.Decrypt(grosspayTextBox.Text);

        TextBox ctcTextBox = (TextBox)NfteDetailsView.Rows[16].Cells[1].Controls[0];
        ctcTextBox.Text = enc.Decrypt(ctcTextBox.Text);

        TextBox ctcmTextBox = (TextBox)NfteDetailsView.Rows[17].Cells[1].Controls[0];
        ctcmTextBox.Text = enc.Decrypt(ctcmTextBox.Text);
    }

    protected void generalDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {

    }
    protected void generalDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
}