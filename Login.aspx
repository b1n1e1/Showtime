<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
            width:75px;
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">Login</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="login" method="post" name="login" runat="server">
        <table id="logintable">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Your Answer</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><p>Email:</p></td>
                    <td><input type="text" id="email" name="email" value="<%=x %>" /></td>
                </tr>
                <tr>
                    <td><p>Password:</p></td>
                    <td><input type="password" id="password" name="password"></td>
                </tr>
                
            </tbody>
        </table>
        <br />
        <input type="submit" value="Submit" name="submit" id="enter" />
    </form>
    <p id="error" ><%=error %></p>
    <br />
    <div style="float:left; font-size:smaller; display:inline; margin-left:10px;"><a href="ChangePassword.aspx">Change Password</a></div>
    <div style="display:inline; float:right; font-size:smaller; margin-right:10px;"><a href="ForgotPass.aspx">Forgot Your Password?</a></div>

</asp:Content>

