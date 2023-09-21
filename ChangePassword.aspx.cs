using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    public string email, oldpass, newpass, error;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            email = Request.Form["email"];
            oldpass = Request.Form["oldpassword"];
            newpass = Request.Form["newpassword"];
            string z = MyAdoHelper.ExecuteSelect("select password from signUp where email='" + email + "'").Rows[0]["password"].ToString();
            if (MyAdoHelper.Exists("select * from signUp where email='" + email +"'"))
            {
                if (string.Compare(z,oldpass) == 0)
                {
                    if (string.Compare(oldpass, newpass) == 0)
                    {
                        error = "Your new password is the same as your old password";
                    }
                    else
                    {
                        MyAdoHelper.DoQuery("UPDATE signUp SET password='" + newpass + "' WHERE email='" + email + "'");
                        Response.Redirect("Login.aspx?email=" + email);
                    }
                }
                else
                {
                    error = "Either your email doesn't fit your old password or your email doesn't exist.";
                }
            }
            else
            {
                error = "Either your email doesn't fit your old password or your email doesn't exist.";
            }
        }
    }
}