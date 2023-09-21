using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class Discussion_Post : System.Web.UI.Page
{
    public string title, content, date, name, email, section;
    public int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null) Response.Redirect("../Login.aspx");
        if (Page.IsPostBack)
        {
            Random rnd = new Random();
            if (Request.QueryString["from"] != null) section = Request.QueryString["from"];
            id = rnd.Next(10000000, 99999999);
            while (MyAdoHelper.Exists("select * from posts where id=" + id)) id = rnd.Next(10000000, 99999999);
            email = Session["email"].ToString();
            title = Request.Form["title"];
            content = Request.Form["content"];
            date = DateTime.Now.ToString();
            name = Session["name"].ToString();
            string sql_command = "INSERT INTO posts (author, cudate, title, content, id, email, section) VALUES('" + name + "', '" + date + "', '" + title + "', '" + content + "', "+ id +", '"+ email+"', '" + section + "')";
            MyAdoHelper.DoQuery(sql_command);
            Response.Redirect("../Discussion.aspx");
        }
    }
}