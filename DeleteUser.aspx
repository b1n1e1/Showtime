<%@ Page Title="Delete User" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #submitError {
            color:red;
            font-style:italic;
            text-align:center;
        }

        #deleteUser tbody, thead tr {
            display:block;
        }

        #deleteUser th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #deleteUser th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #deleteUser td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #deleteUser td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #deleteUser td,th {
            height: 80px;
        }

        #enter {
            border: 1px solid black;
            height:40px;
            width:120px;
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
            width:400px;
            color:white;
            cursor:pointer;
        }

        #email, #Fname, #Lname, #password {
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
    Delete User
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="delete" name="delete" method="post" Runat="server">
        <table id="deleteUser">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Your Answer</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><p>First Name:</p></td>
                    <td><input type="text" placeholder="eg. John" id="Fname" name="Fname" value="<%=a %>" /></td>
                </tr>
                <tr>
                    <td><p>Last Name:</p></td>
                    <td><input type="text" placeholder="eg. John" id="Lname" name="Lname" value="<%=b %>" /></td>
                </tr>
            
                <tr>
                    <td><p>Email:</p></td>
                    <td><input type="email" placeholder="eg. johndoe@doe.net" id="email" name="email" value="<%=x %>" /></td>
                </tr>
                <tr>
                    <td><p>Password:</p></td>
                    <td><input type="password" placeholder="Enter Password" id="password" name="password" value="<%=c %>" />
                </tr>
            </tbody>
        </table>
        <br />
        <div id="submit"">
            <input value="Delete User" type="submit" id="enter" name="submit"/>
        </div>

    </form>
    <p id="submitError"><%=error %></p>
</asp:Content>

