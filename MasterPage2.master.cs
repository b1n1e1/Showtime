using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 :  System.Web.UI.MasterPage
{
    public string html_string, update_string;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            update_string = "<a href=\"../UpdateUser.aspx?email=" + Session["email"].ToString() + "\">Update User</a>  -  <a href=\"../Logout.aspx\">Log Out</a>";
        }
        


        if (Convert.ToBoolean(Session["manage"]))
        {
            html_string = "<a href=\"../DeleteUser.aspx\">Delete Users</a>  -  <a href=\"../AdminManage.aspx\">User List</a>  -  <a href=\"../Select.aspx\">Search User</a>";
            
        }
    }
}
