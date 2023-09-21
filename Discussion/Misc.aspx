<%@ Page Title="Misc" Language="C#" MasterPageFile="~/Discussion/Discussions.master" AutoEventWireup="true" CodeFile="Misc.aspx.cs" Inherits="Discussion_Misc" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>
        .wall .title {
            font-size:larger;
            font-weight:bold;
            margin-top:20px;
            display:inline-block;
            color:black;
        }
        .wall .author {
            font-size:smaller;
            color:rgb(180,180,180);
        }
        .wall {
            height:75px;
            /*border-bottom: solid 1px #c6dcff;*/
            margin-bottom:5px;
            cursor:pointer;
            display:block;
            padding-left:6px;
        }
        .wall:hover {
            background-color:#c6dcff
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Posts" Runat="Server">
    <%=html_string %>
</asp:Content>

