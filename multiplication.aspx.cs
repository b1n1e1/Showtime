using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class multiplication : System.Web.UI.Page
{
    public string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        st = "<table id=\"multi\" style=\"width:100%;\">";
        for (int i=1; i<=10; i++)
        {
            st += "<tr>";
            for (int j=1; j<=10; j++)
            {
                st += "<td>";
                st += i * j;
                st += "</td>";
            }
            st += "</tr>";
        }
        st += "</table>";
    }
}