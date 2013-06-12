using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.DirectoryServices;
using System.Web.UI.WebControls.WebParts;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
      DirectoryEntry entry = new DirectoryEntry("LDAP://NTNIGE", Login1.UserName, Login1.Password);
        try
        {
            object ent = entry.NativeObject;
            e.Authenticated = true;

           SqlConnection con = new SqlConnection();
           SqlCommand cmd = new SqlCommand();
           
           con.ConnectionString = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
           cmd.Connection = con;
           cmd.CommandText = string.Format("select count(*) from nfte.users where userid = '{0}'", Login1.UserName.Trim());
           
           con.Open();
           object o =  cmd.ExecuteScalar();
           int usercount = Convert.ToInt32(o);

           if (usercount > 0)
           {
               FormsAuthentication.SetAuthCookie(Login1.UserName, false);
           }
           else
           {
               e.Authenticated = false;
               Login1.FailureText = "Your username or password is wrong,please check it and try again";
           }
        }
        catch
        {
            e.Authenticated = false;
            Login1.FailureText = "Internal error while trying to log in";
        }
    }
}



 