using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Discussion_ViewPost : System.Web.UI.Page
{
    public int id;
    public string title, content, author, date, comment, html_string, link;
    public string[] comments;
    public System.Data.DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["email"] == null) Response.Redirect("../Login.aspx");
        if (Request.QueryString["id"] == null) Response.Redirect("../Main1.aspx");
        
        id = Convert.ToInt32(Request.QueryString["id"]);
        link = MyAdoHelper.ExecuteSelect("select section from posts where id=" + id).Rows[0][0].ToString();

        dt = MyAdoHelper.ExecuteSelect("select * from posts where id=" + id);
        title = dt.Rows[0]["title"].ToString();
        content = dt.Rows[0]["content"].ToString();
        date = dt.Rows[0]["cudate"].ToString();
        author = dt.Rows[0]["author"].ToString();
        string[] seperator = { "//@//" };
        comments = dt.Rows[0]["comments"].ToString().Split(seperator, StringSplitOptions.RemoveEmptyEntries);
        html_string = "";

        foreach (string ct in comments)
        {
            html_string += ct;
            
        }
        


        if (Page.IsPostBack)
        {
            string dateTime = DateTime.Now.ToString();
            comment = MyAdoHelper.ExecuteSelect("select comments from posts where id=" + id).Rows[0][0].ToString();
            comment += "<div class=\"comment\"><span style=\"color:rgb(100,100,100); font-size:smaller;\">" + Session["name"] + ", " + dateTime + "</span><br />" + Request.Form["Comment"] + "</div>";
            comment += "  //@//  ";
            string lastcomment = MyAdoHelper.ExecuteSelect("select comments from posts where id=" + id).Rows[0][0].ToString();
            
            MyAdoHelper.DoQuery("update posts set comments='" + comment + "' where id=" + id);
            Response.Redirect(Request.RawUrl);
        }
    }

    protected string isAdmin()
    {
        
        string email = MyAdoHelper.ExecuteSelect("select * from posts where id=" + id).Rows[0]["email"].ToString();
        if (Convert.ToBoolean(Session["manage"])) return "block";
        else if (email.CompareTo(Session["email"]) == 0) return "block";
        return "none";
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        MyAdoHelper.DoQuery("DELETE FROM posts WHERE id=" + id);
        Response.Redirect("../Discussion.aspx");
    }
}