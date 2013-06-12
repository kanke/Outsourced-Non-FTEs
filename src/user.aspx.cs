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

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        TextBoxsap.Text = "";
        TextBoxuser.Text = "";
        TextBoxuser.Focus();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        base.OnLoad(e);
        Response.Redirect("view.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
        string que = "";
        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
        SqlConnection Myconn = new SqlConnection(connstr);

            que= "insert into nfte.users(name,userid) values (@namefield,@useridfield)";

            SqlCommand com = new SqlCommand(que, Myconn);
            com.Parameters.AddWithValue("namefield", TextBoxuser.Text);
            com.Parameters.AddWithValue("useridfield", TextBoxsap.Text);

            Myconn.Open();
            com.ExecuteNonQuery();
            Label1.Text = "Record Added" + " ! ";

            if ((!ClientScript.IsStartupScriptRegistered("Alert")))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('Record added');", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Alert('Record added');", true);
            }

            TextBoxsap.Text = "";
            TextBoxuser.Text = "";
            TextBoxuser.Focus();
            

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
}
