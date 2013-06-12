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
using CarlosAg.ExcelXmlWriter;

public partial class view : System.Web.UI.Page
{
    static string query = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dset = new DataTable();
            string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;

            query = @"SELECT a.staff_no,a.sap_id,a.staffname,a.gender,c.jobrole_name,a.date_of_employ,a.date_of_birth,b.dept, a.dept_id,a.line_id,a.training_id,d.branch_name,
            a.cost_cent_no,a.acct_no,a.monthly_netpay,a.monthly_gross_pay,a.ctc,a.ctc_medicals,g.grade,a.jobrole_id, a.branch_id,e.training_status,f.linemanager, q.description, p.provider_name
            from nfte.staff a
            inner join nfte.departments b on a.dept_id = b.dept_id
            inner join nfte.jobrole c on a.jobrole_id=c.jobrole_id
            inner join nfte.branches d on a.branch_id = d.branch_no
            inner join nfte.trainingstatus e on a.training_id = e.training_id
            inner join nfte.linemanager f on a.line_id = f.line_id
            inner join nfte.providers p on a.provider_id = p.provider_id
            inner join nfte.appraisal_grade g on a.id = g.id 
			inner join nfte.qualification q on a.qual_id = q.qual_id";
            SqlConnection Myconn = new SqlConnection(connstr);
            SqlCommand commd = new SqlCommand(query, Myconn);

            SqlDataAdapter adap = new SqlDataAdapter(commd);
            adap.Fill(dset);

            Encryptor encryptor = new Encryptor();
            foreach (DataRow nrow in dset.Rows)
            {
                nrow["monthly_netpay"] = encryptor.Decrypt(nrow["monthly_netpay"].ToString());
                nrow["monthly_gross_pay"] = encryptor.Decrypt(nrow["monthly_gross_pay"].ToString());
                nrow["ctc"] = encryptor.Decrypt(nrow["ctc"].ToString());
                nrow["ctc_medicals"] = encryptor.Decrypt(nrow["ctc_medicals"].ToString());
            }

            GridView1.DataSource = dset;
            GridView1.DataBind();
        }
    }

    protected DataTable dset
    {
        set
        {
            ViewState["dset"] = value;
        }
        get
        {
            return (ViewState["dset"] != null) ? (DataTable)ViewState["dset"] : new DataTable();
        }
    }

    private void FetchData()
    {
        dset = new DataTable();
        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;

        string op = "";
        bool convert = false;
        string searchField = TextBox1.Text;
        switch (DropDownList2.SelectedValue)
        {
            case "staff_no":
            case "staffname":
            case "gender":
            case "sap_id":
            case "jobrole_name":
            case "dept":
            case "description":
            case "training_status":
            case "branch_name":
            case "linemanager":
            case "grade":
            case "monthly_netpay":
            case "monthly_gross_pay":
            case "acct_no":
                op = "like";
                searchField = "%" + searchField + "%";
                convert = true;
                break;
            case "date_of_employ":
            case "date_of_birth":
                searchField = "'" + searchField + "'";
                op = " <= ";
                break;
            case "ctc":
            case "ctc_medicals":
            case "cost_cent_no":
                op = "=";
                break;
        }

        query = @"SELECT a.staff_no,a.sap_id,a.staffname,a.gender,c.jobrole_name,a.date_of_employ,a.date_of_birth,b.dept, a.dept_id,a.line_id,a.training_id,d.branch_name,
            a.cost_cent_no,a.acct_no,a.monthly_netpay,a.monthly_gross_pay,a.ctc,a.ctc_medicals,g.grade,a.jobrole_id, a.branch_id,e.training_status,f.linemanager, q.description, p.provider_name
            from nfte.staff a
            inner join nfte.departments b on a.dept_id = b.dept_id
            inner join nfte.jobrole c on a.jobrole_id=c.jobrole_id
            inner join nfte.branches d on a.branch_id = d.branch_no
            inner join nfte.trainingstatus e on a.training_id = e.training_id
            inner join nfte.linemanager f on a.line_id = f.line_id
            inner join nfte.providers p on a.provider_id = p.provider_id
            inner join nfte.appraisal_grade g on a.id = g.id 
			inner join nfte.qualification q on a.qual_id = q.qual_id ";

        if (convert)
        {
            query += "where UPPER (" + DropDownList2.SelectedValue + ") " + op + " UPPER ('" + searchField + "')";
        }
        else
        {
            query += "where " + DropDownList2.SelectedValue + " " + op + " " + searchField;
        }

        
        SqlConnection Myconn = new SqlConnection(connstr);
        SqlCommand commd = new SqlCommand(query, Myconn);
        SqlDataAdapter adap = new SqlDataAdapter(commd);
        adap.Fill(dset);

        Encryptor encryptor = new Encryptor();
        foreach (DataRow nrow in dset.Rows)
        {
            nrow["monthly_netpay"] = encryptor.Decrypt(nrow["monthly_netpay"].ToString());
            nrow["monthly_gross_pay"] = encryptor.Decrypt(nrow["monthly_gross_pay"].ToString());
            nrow["ctc"] = encryptor.Decrypt(nrow["ctc"].ToString());
            nrow["ctc_medicals"] = encryptor.Decrypt(nrow["ctc_medicals"].ToString());
        }

        GridView1.DataSource = dset;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        msgBox1.alert("Non-FTE successfully deleted !");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = dset;
        GridView1.DataBind();       
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        FetchData();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string staff_no = "";
        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
        string deletequery =  "delete from nfte.staff where staff_no = @staff_no";        

        SqlConnection Myconn = new SqlConnection(connstr);
        SqlCommand commd = new SqlCommand(deletequery, Myconn);
        staff_no = GridView1.Rows[e.RowIndex].Cells[1].Text;
        
        commd.Parameters.AddWithValue("@staff_no", staff_no);
        Myconn.Open();
        commd.ExecuteNonQuery();
       
        dset.Rows[e.RowIndex].Delete();

        GridView1.DataSource = dset;
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {       
        dset.DefaultView.Sort = e.SortExpression +" " + ((e.SortDirection == SortDirection.Ascending)? "ASC" : "DESC");
        GridView1.DataSource = dset.DefaultView;
        GridView1.DataBind();
    }
    protected void excelButton_Click(object sender, ImageClickEventArgs e)
    {
        //go to database
        //fetch a list of valid providers with their IDs
        //foreach item in the list
        //create a worksheet with the provider name
        //move to the next item

        string connstr = ConfigurationManager.ConnectionStrings["nfte"].ConnectionString;
        string fetchquery = "select provider_name from nfte.providers";

        SqlConnection Myconn = new SqlConnection(connstr);
        SqlCommand command = new SqlCommand(fetchquery, Myconn);

        Workbook book = new Workbook();
        WorksheetStyle style = book.Styles.Add("HeaderStyle");
        style.Font.FontName = "Tahoma";
        style.Font.Size = 12;
        style.Font.Bold = true;
        style.Alignment.Horizontal = StyleHorizontalAlignment.Center;
        style.Font.Color = "White";
        style.Interior.Color = "Blue";
        style.Interior.Pattern = StyleInteriorPattern.Solid;

        //Create the Default Style to use for everyone
        style = book.Styles.Add("Default");
        style.Font.FontName = "Tahoma";
        style.Font.Size = 12;

        try
        {
            Myconn.Open();
            // we need a reader to do a row-by-row fetch of providers from the DB
            SqlDataReader reader = command.ExecuteReader();

            //reader.read always has a value of 'true' as long as there is something 
            //to fetch from the DB, so we set up a while loop until there is nothing to fetch
            while(reader.Read())
            {
                //for each provider fetched, get it's 'provider_name'
                string mynewName = reader["provider_name"].ToString();

                //use the retrieved providername to create a new worksheet
                Worksheet sheet = book.Worksheets.Add(mynewName);

                //create a new, blank row of excel cells to represent the headers
                WorksheetRow wsrow = sheet.Table.Rows.Add();
                
                //create columnheaders in the worksheet for each columnheader found in dset
                foreach (DataColumn myColumn in dset.Columns)
                {
                    switch (myColumn.ColumnName)
                    {
                        case "dept_id":
                        case "line_id":
                        case "training_id":
                        case "jobrole_id":
                        case "branch_id":
                        case "provider_name":
                        
                            // do nothing
                            break;
                        default:
                            wsrow.Cells.Add(myColumn.ColumnName.ToString(), DataType.String, "HeaderStyle");
                            break;
                    }
                }

               wsrow.Cells[0].Data.Text = "Staff No";
                wsrow.Cells[1].Data.Text = "SAP ID";
                wsrow.Cells[2].Data.Text = "Staff name";
                wsrow.Cells[3].Data.Text = "Gender";
                wsrow.Cells[4].Data.Text = "Jobrole";
                wsrow.Cells[5].Data.Text = "Date of Employment";
                wsrow.Cells[6].Data.Text = "Date of Birth";
                wsrow.Cells[7].Data.Text = "Department";
                wsrow.Cells[8].Data.Text = "Branch";
                wsrow.Cells[9].Data.Text = "Cost Centre No";
                wsrow.Cells[10].Data.Text = "Account No";
                wsrow.Cells[11].Data.Text = "Monthly Net Pay";
                wsrow.Cells[12].Data.Text = "Monthly Gross Pay";
                wsrow.Cells[13].Data.Text = "CTC";
                wsrow.Cells[14].Data.Text = "CTC Medicals";
                wsrow.Cells[15].Data.Text = "Grade";
                wsrow.Cells[16].Data.Text = "Training Status";
                wsrow.Cells[17].Data.Text = "Line Manager";
                wsrow.Cells[18].Data.Text = "Academic Qualification";
                
            }         
        }
        catch (Exception ex)
        {
        }
        finally
        {
            Myconn.Close();
        }

        
        foreach (DataRow myrow in dset.Rows)
        {
            // retrieve the providername to which the current row belongs
            string currentProviderName = myrow["provider_name"].ToString();

            // find the sheet that is named after the provider name we fetched above
            Worksheet sheet = book.Worksheets[currentProviderName];

            //add a new, blank row of excel cells to the worksheet we just picked
            WorksheetRow wsrow = sheet.Table.Rows.Add();

            //loop through the available columns in dset and copy them to 
            //corresponding excel cells in the worksheet
            foreach (DataColumn TCol in dset.Columns)
            {
                switch (TCol.ColumnName)
                {
                    case "dept_id":
                    case "line_id":
                    case "training_id":
                    case "jobrole_id":
                    case "branch_id":
                    case "provider_name":
                    
                        // do nothing
                        break;
                    default:
                        wsrow.Cells.Add(myrow[TCol].ToString());
                        break;
                }
            }
        }

        //export the collection of worksheets as excel
        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=Outsourced_NFTE_export" + DateTime.Now.ToString("yyyyMMddhhmm") + ".xls");
        book.Save(Response.OutputStream);
        Response.End();

    }

}
