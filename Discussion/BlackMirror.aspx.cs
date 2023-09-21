using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Discussion_BlackMirror : System.Web.UI.Page
{
    public System.Data.DataTable data;
    public string html_string, search;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            search = Request.Form["search"];
            data = MyAdoHelper.ExecuteSelect("select * from posts where section='BLACKMIRROR.ASPX' and (content like '%" + search + "%' or title like '%" + search + "%')");
            for (int i = 0; i < data.Rows.Count; i++)
            {
                html_string += "<a style=\"text-decoration:none;\" href=\"ViewPost.aspx?id=" + data.Rows[i]["id"] + "\"><div class=\"wall\">";
                html_string += "<div class=\"title\">" + data.Rows[i]["title"] + "</div>";
                html_string += "<div class=\"author\">" + data.Rows[i]["author"] + "</div>";
                html_string += "</div></a>";
            }
        }
        else
        {
            data = MyAdoHelper.ExecuteSelect("select * from posts where section='BLACKMIRROR.ASPX'");
            for (int i = 0; i < data.Rows.Count; i++)
            {
                html_string += "<a style=\"text-decoration:none;\" href=\"ViewPost.aspx?id=" + data.Rows[i]["id"] + "\"><div class=\"wall\">";
                html_string += "<div class=\"title\">" + data.Rows[i]["title"] + "</div>";
                html_string += "<div class=\"author\">" + data.Rows[i]["author"] + "</div>";
                html_string += "</div></a>";
            }
        }
    }
}