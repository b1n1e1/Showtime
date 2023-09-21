using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public string z,y,x,error;
    protected void Page_Load(object sender, EventArgs e)
    {
        x = Request.QueryString["email"];

        if (Page.IsPostBack)
        {
            string c = Request.Form["email"];
            string n = Request.Form["password"];

            

            if (MyAdoHelper.Exists("select * from signUp where email='" + c + "'"))
            {
                z = MyAdoHelper.ExecuteSelect("select password from signUp where email='" + c + "'").Rows[0]["password"].ToString();

                if (string.Compare(n, z) == 0)
                {
                    string a = MyAdoHelper.ExecuteSelect("select fname from signUp where email='" + c + "'").Rows[0][0].ToString();
                    string b = MyAdoHelper.ExecuteSelect("select lname from signUp where email='" + c + "'").Rows[0][0].ToString();
                    if (string.Compare(c, "admin@gmail.com") == 0)
                    {
                        Session["manage"] = true;
                        Session["email"] = c;
                        Response.Redirect("AdminManage.aspx");
                    }
                    else
                    {
                        Session["manage"] = false;
                        Session["email"] = c;
                        Session["name"] = a + " " + b;
                        Response.Redirect("Main1.aspx");
                    }
                }
                else
                {
                    error = "Either your email doesn't fit your password or your email doesn't exist.";
                }
            }
            else
            {
                error = "Either your email doesn't fit your password or your email doesn't exist.";
            }
        }
    }
}