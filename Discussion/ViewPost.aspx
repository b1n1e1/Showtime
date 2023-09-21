<%@ Page Title="View Post" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewPost.aspx.cs" Inherits="Discussion_ViewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .DeletePost {
            font-size:larger;
            width:120px;
            height:30px;
            color:black;
            background-color:red;
            border:0.5px groove black;
            cursor:pointer;
            transition:0.5s;
            margin-left:7px;
            border-radius:6px;
            font-size:small;

            display: <%=isAdmin() %>;
        }
        .DeletePost:hover {
            background-color: rgb(217, 0, 0);

        }

        .PostComment {
            margin-left:7px;
            font-family:Arial;
            border:1px dotted black;
        }

        .comment {
            margin-left:10px;
            margin-bottom:10px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    View Post
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="myform" runat="server" method="post" style="height:653.88px; overflow-y:auto;">
        <a href="<%=link %>" style="color:black; margin-left:5px;">← Back</a>
        <h1 style="text-align:left; margin-left:7px; margin-bottom:5px;"><%=title %></h1>
        <div style="color:rgb(100,100,100); font-size:small; margin-left:7px; margin-bottom:20px; text-align:left;"><%=author %>, <%=date %></div>
        <div style="margin-left:7px; margin-right:12px;"><%=content %></div>
        <br />
        
    
        <asp:Button runat="server" Text="Delete Post" OnClick="Delete_Click" ID="Delete" CssClass="DeletePost" UseSubmitBehavior="false" />
        <br />

        <hr style="width:75%;" />
        
        <textarea class="PostComment" name="Comment" Rows="5" Cols="40" placeholder="Comment" ></textarea>
        
        <input type="submit" value="Comment" class="DeletePost" style="display:block;" />

        <hr style="width:75%;" />

        <b style="font-size:large; margin-left:7px;">Comments: (<%=comments.Length - Math.Sign(comments.Length) %>)</b>

        <%=html_string %>
    </form>

</asp:Content>

