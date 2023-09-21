using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default :  System.Web.UI.Page
{
    public string x = "Welcome to Show Time.";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null) x = "Welcome to Show Time, " + Session["name"] + ".";
    }
}