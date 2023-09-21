using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Select : System.Web.UI.Page
{
    public string fname, lname, showstring;
    public string[] show;
    public string x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Convert.ToBoolean(Session["manage"])) Response.Redirect("main1.aspx");
        if (Page.IsPostBack)
        {
            fname = Request.Form["Fname"];
            lname = Request.Form["Lname"];
            if (Request.Form["show"] != null)
            {
                show = Request.Form["show"].Split(',');
            }
            foreach (string s in show)
            {
                showstring += " and show like '%" + s + "%'";
            }
            x = "<table id=\"users\"><tr><td>First Name</td><td>Last Name</td><td>Email*</td><td>Gender</td><td>Shows</td><td>Password</td><td>Age</td>";
            for (int i = 0; i < MyAdoHelper.ExecuteSelect("select * from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows.Count; i++)
            {
                x += "<tr>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select fname from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" +  showstring).Rows[i]["fname"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select lname from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["lname"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select email from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["email"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select gender from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["gender"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select show from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["show"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select password from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["password"].ToString() + "</td>";
                x += "<td>" + MyAdoHelper.ExecuteSelect("select age from signUp where fname like '" + fname + "%' and lname like '" + lname + "%'" + showstring).Rows[i]["age"].ToString() + "</td>";
                x += "</tr>";
            }
        }
    }
}