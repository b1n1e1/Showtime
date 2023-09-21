using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteUser : System.Web.UI.Page
{
    public string email, fname, lname, password, error, x,a,b,c;
    public static string FirstUp(string s)
    {
        return char.ToUpper(s[0]) + s.Substring(1);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Convert.ToBoolean(Session["manage"]) == true)) Response.Redirect("Main1.aspx");
        x = Request.QueryString["email"];
        if (x != null) {
            
            a = MyAdoHelper.ExecuteSelect("select fname from signUp where email='" + x + "'").Rows[0]["fname"].ToString();
            b = MyAdoHelper.ExecuteSelect("select lname from signUp where email='" + x + "'").Rows[0][0].ToString();
            c = MyAdoHelper.ExecuteSelect("select password from signUp where email='" + x + "'").Rows[0][0].ToString();
        }
        if (Page.IsPostBack)
        {
            email = Request.Form["email"];
            fname = FirstUp(Request.Form["Fname"]);
            lname = FirstUp(Request.Form["Lname"]);
            password = Request.Form["password"];
            if (MyAdoHelper.Exists("SELECT * FROM signUp WHERE email='" + email + "' and fname='" + fname + "' and lname='" + lname + "' and password='" + password + "'"))
            {
                if (string.Compare(email, "admin@gmail.com") == 0) error = "You can't delete the admin.";
                else
                {
                    MyAdoHelper.DoQuery("DELETE FROM signUp WHERE email='" + email + "' and fname='" + fname + "' and lname='" + lname + "' and password='" + password + "'");
                    Response.Redirect("AdminManage.aspx");
                }
            }
            else
            {
                error = "The user does not exist. Check all the user's fields and try again.";
            }
        }
    }
}