using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public int n = 1;
    public string x = "<table id=\"users\"><tr><td>First Name</td><td>Last Name</td><td>Email*</td><td>Gender</td><td>Shows</td><td>Password</td><td>Age</td><td>Link to Delete</td><td>Link to Update</td></tr>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Convert.ToBoolean(Session["manage"]) == true)) Response.Redirect("Main1.aspx");
        for (int i=0; i<MyAdoHelper.ExecuteSelect("select * from signUp").Rows.Count; i++)
        {
            x += "<tr>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select fname from signUp").Rows[i]["fname"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select lname from signUp").Rows[i]["lname"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select email from signUp").Rows[i]["email"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select gender from signUp").Rows[i]["gender"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select show from signUp").Rows[i]["show"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select password from signUp").Rows[i]["password"].ToString() + "</td>";
            x += "<td>" + MyAdoHelper.ExecuteSelect("select age from signUp").Rows[i]["age"].ToString() + "</td>";
            x += "<td><a href=\"DeleteUser.aspx?email=" + MyAdoHelper.ExecuteSelect("select email from signUp").Rows[i]["email"].ToString() + "\">Delete</a></td>";
            x += "<td><a href=\"UpdateUser.aspx?email=" + MyAdoHelper.ExecuteSelect("select email from signUp").Rows[i]["email"].ToString() + "\">Update</a></td>";
            x += "</tr>";
        }
        x += "</table>";
    }
}