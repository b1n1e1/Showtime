<%@ Page Title="Recover Password" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        #error {
            color:red;
            font-style:italic;
            text-align:center;
        }

        #logintable tbody, thead tr {
            display:block;
        }

        #logintable tbody {
            overflow-y:auto;
            overflow-x:hidden;
        }


        #logintable th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #logintable th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #logintable td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #logintable td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #logintable td,th {
            height: 80px;
        }
        #enter {
            border: 1px solid black;
            height:40px;
            width:90px;
            background-color: lightgray;
            font-size: large;
            text-align:center;
            margin: 0 auto;
            display:block;
            vertical-align:top;
            border-radius:4px;
            transition:0.5s;
        }
      
        #enter:hover {
            background-color: gray;
            width: 400px;
            color: white;
            cursor: pointer;
        }

        #password, #Fname, #Lname, #email {
            background-color:transparent;
            border-style:solid;
            border-width:1px;
            border-radius:5px;
            border-color:black;
            padding:0;
            height:40px;
            text-align:center;
            margin-left:4px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Recover Password
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="login" method="post" name="login" runat="server">
        <table id="logintable">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>User Information</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><p>Email:</p></td>
                    <td><input type="text" id="email" name="email" /></td>
                </tr>
                
            </tbody>
        </table>
        <br />
        <input type="submit" value="Recover" name="submit" id="enter" />
    </form>
    <p id="error" ><%=error %></p>
    
</asp:Content>

