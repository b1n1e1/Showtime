using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class ForgotPass : System.Web.UI.Page
{
    public string error, email;
    protected static string CreatePass()
    {
        char[] alphabet = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
        Random random = new Random();
        string pass = "";
        for (int i=0; i<8; i++)
        {
            int r = random.Next(alphabet.Length);
            pass += alphabet[r];
        }
        return pass;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            email = Request.Form["email"];

            if (MyAdoHelper.Exists("select * from signUp where email='" + email + "'"))
            {
                
                string password = MyAdoHelper.ExecuteSelect("select password from signUp where email='" + email + "'").Rows[0]["password"].ToString();
                string fname = MyAdoHelper.ExecuteSelect("select fname from signUp where email='" + email + "'").Rows[0]["fname"].ToString();
                string lname = MyAdoHelper.ExecuteSelect("select lname from signUp where email='" + email + "'").Rows[0]["lname"].ToString();
                string newpass = CreatePass();
                MyAdoHelper.DoQuery("UPDATE signUp SET password='" + newpass + "' WHERE email='" + email + "'");
                string name = fname + " " + lname;
                string subject = "Show Time Password Recovery";
                string body = "Hello " + name + ", it seems that you have forgotten your password to Show Time. Your old password was " + password + ". However, your password has been automatically changed to " + newpass + ". If you would like to restore your old password, click 'Change Password' on the Log In screen. <br /> ~ Ben from Show Time";
                var fromAddress = new MailAddress("showtime.donotreply@gmail.com", "Show Time");
                var fromPassword = "showtimesite";
                var toAddress = new MailAddress(email);

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential(fromAddress.Address, fromPassword)
                };

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    IsBodyHtml = true,
                    Subject = subject,
                    Body = body
                })

                smtp.Send(message);

                error = "Email sent to " + email + ".";
            }
            else
            {
                error = "The email you entered is not signed up. <a href=\"Signup.aspx\">Sign up here</a>.";
            }
        }
    }
}