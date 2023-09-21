using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateUser : System.Web.UI.Page
{
    public string email, fname, lname, age, x, a, b, c, error, shows;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null) {
            Response.Write("<script>alert(\"You Must Be Signed In\")</script>");
            Response.Redirect("Main1.aspx");
        }
        x = Request.QueryString["email"];
        if (x != null && MyAdoHelper.Exists("select * from signUp where email='" + x + "'"))
        {

            a = MyAdoHelper.ExecuteSelect("select fname from signUp where email='" + x + "'").Rows[0]["fname"].ToString();
            b = MyAdoHelper.ExecuteSelect("select lname from signUp where email='" + x + "'").Rows[0][0].ToString();
            c = MyAdoHelper.ExecuteSelect("select age from signUp where email='" + x + "'").Rows[0][0].ToString();
        }
        if (Page.IsPostBack)
        {
            email = Request.Form["email"];
            fname = Request.Form["Fname"];
            lname = Request.Form["Lname"];
            age = Request.Form["age"].ToString();
            shows = Request.Form["show"];
            if (email.CompareTo(Session["email"]) == 0 || "admin@gmail.com".CompareTo(Session["email"]) == 0)
            {
                if (MyAdoHelper.Exists("SELECT * FROM signUp WHERE email='" + email + "'"))
                {
                    if (string.Compare(email, "admin@gmail.com") == 0) error = "You can't update the admin.";
                    else
                    {
                        MyAdoHelper.DoQuery("UPDATE signUp SET fname='" + fname + "', lname='" + lname + "', show='" + shows +  "', age=" + age + " WHERE email='" + email + "'");
                        Response.Redirect("AdminManage.aspx");
                    }
                }
                else
                {
                    error = "The user does not exist. Check all the user's fields and try again.";
                }
            }
            else error = "You don't have the authorization to change this user's information.";
           
        }

    }
}