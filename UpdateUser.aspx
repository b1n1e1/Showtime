<%@ Page Title="Update User" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="UpdateUser.aspx.cs" Inherits="UpdateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #submitError {
            color:red;
            font-style:italic;
            text-align:center;
        }

        #updateUser tbody, thead tr {
            display:block;
        }

        #updateUser th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #updateUser th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #updateUser td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #updateUser td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #updateUser td,th {
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

        #email, #Fname, #Lname, #age {
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
    Update User
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="update" name="update" runat="server" method="post">
        <table id="updateUser">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Your Answer</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><p>Email:</p></td>
                    <td><input type="email" placeholder="eg. johndoe@doe.net" id="email" name="email" value="<%=x %>" /></td>
                </tr>
                <tr>
                    <td><p>New First Name:</p></td>
                    <td><input type="text" placeholder="eg. John" id="Fname" name="Fname" value="<%=a %>" /></td>
                </tr>
                <tr>
                    <td><p>New Last Name:</p></td>
                    <td><input type="text" placeholder="eg. John" id="Lname" name="Lname" value="<%=b %>" /></td>
                </tr>
            
                
                <tr>
                    <td><p>New Age:</p></td>
                    <td><input type="number" id="age" name="age" value="<%=c %>" />
                </tr>

                <tr>
                    <td><p>New Shows Of Interest</p></td>
                    <td> 
                        <input type="checkbox" name="show" id="blackMirror" value="Black Mirror" /><label for="blackMirror">    Black Mirror</label>
                        <input type="checkbox" name="show" id="bigMouth" value="Big Mouth" /><label for="bigMouth">    Big Mouth</label>
                        <input type="checkbox" name="show" id="rickMorty" value="Rick and Morty" /><label for="rickMorty">    Rick and Morty</label>
                        <input type="checkbox" name="show" id="finalSpace" value="Final Space" /><label for="finalSpace">    Final Space</label>

                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <div id="submit"">
            <input value="Update User" type="submit" id="enter" name="submit"/>
        </div>

    </form>
    <p id="submitError"><%=error %></p>
</asp:Content>

