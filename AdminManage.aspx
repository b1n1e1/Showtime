<%@ Page Title="AdminManage" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="AdminManage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #main7 {
            height:600px;
            overflow-y:auto;
        }
        #users {
            width:800px;
            
        }
       #users tr:first-child {
           font-weight:700;
       }
        #users td, th {
            width:90px;
            text-align:center;
            text-wrap:normal;

        }
        #users thead, tbody {
            display:block;
                      
        }

        #users tr {
            height:90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    AdminManage
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main7">
        <h1 style="text-align:center">Users</h1>
        <p>(or instead, <a href="Select.aspx">select</a>.)</p>
        <%=x %>
    </div>
</asp:Content>

