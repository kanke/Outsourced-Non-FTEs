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
using System.Data.SqlClient;
using System.Text;

public partial class lookup : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        TextBox1.Text = "";
        DropDownList2.SelectedIndex = -1;
        DropDownList2.Focus();


    }
    protected void addButton_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
        string que = "";
        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
        SqlConnection Myconn = new SqlConnection(connstr);
        string searchfield = TextBox1.Text;

        switch (DropDownList2.SelectedValue)
        {
            case "jobrole_name":
                que = "insert into nfte.jobrole (jobrole_name) values (@searchfield)";
                break;

            case "linemanager":
                que = "insert into nfte.linemanager (linemanager) values (@searchfield)";
                break;


            case "training_status":
                que = "insert into nfte.trainingstatus(training_status) values (@searchfield)";
                break;

            case "grade":
                que = "insert into nfte.appraisal_grade(grade) values (@searchfield)";
                break;

            case "description":
                que = "insert into nfte.qualification(description) values (@searchfield)";
                break;

            case "provider_name" :
                que = "insert into nfte.providers(provider_name) values (@searchfield)";
                break;
        }

        SqlCommand com = new SqlCommand(que, Myconn);
        com.Parameters.AddWithValue("searchfield", searchfield);
        
            Myconn.Open();
            com.ExecuteNonQuery();
            Label1.Text = "Record Added" + " ! ";

            if ((!ClientScript.IsStartupScriptRegistered("Alert")))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('Record added');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('Record added');", true);
            }

            TextBox1.Text = "";
            DropDownList2.SelectedIndex = -1;

        }
        catch (Exception x)
        {

            if ((!ClientScript.IsStartupScriptRegistered("Alert")))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('" + x.Message.Replace("'", " ") + "');", true);
                Label1.Text = x.Message;
            }
        }
    }

    protected void cancelButton_Click(object sender, ImageClickEventArgs e)
    {
        base.OnLoad(e);
        Response.Redirect("view.aspx");

    }


}