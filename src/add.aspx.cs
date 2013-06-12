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
using System.Text;
using System.Data.SqlClient;

public partial class add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text.Trim();
        TextBox2.Text.Trim();
        TextBox8.Text.Trim();
        TextBox9.Text.Trim();
        TextBox11.Text.Trim();
        TextBox12.Text.Trim();
        TextBox14.Text.Trim();
        TextBox15.Text.Trim();
        TextBox19.Text.Trim();

        Encryptor encryptor = new Encryptor();

        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
        SqlConnection Myconn = new SqlConnection(connstr);

        SqlCommand comm = new SqlCommand("nfte.addnew", Myconn);
        comm.CommandType = CommandType.StoredProcedure;

       
        comm.Parameters.AddWithValue("@sap_id", TextBox1.Text);
        comm.Parameters.AddWithValue("@staffname", TextBox2.Text);
        comm.Parameters.AddWithValue("@gender", RadioButtonList1.Text);
        comm.Parameters.AddWithValue("@date_of_employ", TextBox4.Text);
        comm.Parameters.AddWithValue("@date_of_birth", TextBox5.Text);
        comm.Parameters.AddWithValue("@jobrole_id", DropDownList4.SelectedValue);
        comm.Parameters.AddWithValue("@dept_id", DropDownList2.SelectedValue);
        comm.Parameters.AddWithValue("@branch_id", DropDownList3.SelectedValue);
        comm.Parameters.AddWithValue("@cost_cent_no", TextBox8.Text);
        comm.Parameters.AddWithValue("@acct_no", TextBox9.Text);
        comm.Parameters.AddWithValue("@monthly_netpay", encryptor.Encrypt(TextBox15.Text));
        comm.Parameters.AddWithValue("@monthly_gross_pay", encryptor.Encrypt(TextBox14.Text));
        comm.Parameters.AddWithValue("@ctc", encryptor.Encrypt(TextBox11.Text));
        comm.Parameters.AddWithValue("@ctc_medicals",encryptor.Encrypt( TextBox12.Text));
        comm.Parameters.AddWithValue("@id", gradeDropDownList.SelectedValue);
        comm.Parameters.AddWithValue("@date_of_legacy", TextBox18.Text);
        comm.Parameters.AddWithValue("@staff_no", TextBox19.Text);
        comm.Parameters.AddWithValue("@training_id",trainDropDownList.SelectedValue);
        comm.Parameters.AddWithValue("@line_id",lineDropDownList.SelectedValue);
        comm.Parameters.AddWithValue("@qual_id", qualDropDownList.SelectedValue);
        comm.Parameters.AddWithValue("@provider_id", providerDropDownList.SelectedValue);

        try
        {
            Myconn.Open();
            comm.ExecuteNonQuery();

            if ((!ClientScript.IsStartupScriptRegistered("Alert")))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('Record added');", true);
            }

            #region Clear controls
            TextBox19.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox15.Text = "";
            TextBox14.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox18.Text = "";
            RadioButtonList1.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList4.SelectedIndex = 0;
            lineDropDownList.SelectedIndex=0;
            trainDropDownList.SelectedIndex=0;
            qualDropDownList.SelectedIndex = 0;
            providerDropDownList.SelectedIndex = 0;
            #endregion

        }
        catch (Exception ex)
        {
            
            if ((!ClientScript.IsStartupScriptRegistered("Alert")))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('" + ex.Message.Replace("'", " ") + "');", true);
            }
        }
    }
}
