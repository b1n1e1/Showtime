using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string email, password, fname, lname, gender, pref, error;
    public int age;
    public static string FirstUp(string s)
    {
        return char.ToUpper(s[0]) + s.Substring(1);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            Response.Write("SENT");

            email = Request.Form["email"];
            password = Request.Form["password"];
            fname = FirstUp(Request.Form["Fname"]);
            lname = FirstUp(Request.Form["Lname"]);
            gender = Request.Form["gender"];
            pref = Request.Form["show"];
            age = Convert.ToInt32(Request.Form["age"]);
            if (MyAdoHelper.Exists("SELECT * FROM signUp WHERE email='" + email + "'"))
            {
                error = "This email already exists in the system. Please choose a different email or if you alread have an account then <a href=\"Login.aspx\">Log in</a>";
            }
            else
            {
                string sql_command = "INSERT INTO signUp (fname, email, password, gender, lname, show, age) VALUES('" + fname + "', '" + email + "', '" + password + "', '" + gender + "', '" + lname + "', '" + pref + "', '" + age + "')";
                int x = MyAdoHelper.RowsAffected(sql_command);
                Response.Redirect("Login.aspx?email=" + email);
            }
        }
    }
}