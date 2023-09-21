<%@ Page Title="Black Mirror" Language="C#" MasterPageFile="~/Discussion/Discussions.master" AutoEventWireup="true" CodeFile="BlackMirror.aspx.cs" Inherits="Discussion_BlackMirror" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="Posts" Runat="Server">
    <%=html_string %>
</asp:Content>

