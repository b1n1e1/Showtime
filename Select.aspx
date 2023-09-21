<%@ Page Title="Search" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="Select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #main9 {
            height:600px;
            overflow-y:auto;
        }
        #users {
            width:800px;
            
        }
        #users tr td {
            background-color:gainsboro;
        }
        #users tr:first-child td {
           font-weight:700;
           background-color:red;
        }

        #users td, th {
            width:100px;
            text-align:center;
            text-wrap:normal;

        }
        #users thead, tbody {
            display:block;
                      
        }

        #users tr {
            height:90px;
        }
        #searchTable tbody, thead tr {
            display:block;
        }

        #searchTable th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #searchTable th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #searchTable td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #searchTable td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #searchTable td,th {
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

        #Fname, #Lname, #show {
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
    Search
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main9">
        <form id="search" name="search" runat="server" method="post">
            <table id="searchTable">
                <thead>
                    <tr>
                        <th>Field</th>
                        <th>User Information</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><p>First Name:</p></td>
                        <td><input type="text" id="Fname" name="Fname"/></td>
                    </tr>
                    <tr>
                        <td><p>Last Name:</p></td>
                        <td><input type="text" id="Lname" name="Lname"/></td>
                    </tr>
                    <tr>
                        <td><p>Shows of interest:</p></td>
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
                <input value="Search Users" type="submit" id="enter" name="submit"/>
            </div>
            <br />
        </form>
        <%=x %>
        </table>
    </div>
</asp:Content>

