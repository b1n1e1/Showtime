<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #error {
            color:red;
            font-style:italic;
            text-align:center;
        }

        #changePassword tbody, thead tr {
            display:block;
        }

        #changePassword tbody {
            overflow-y:auto;
            overflow-x:hidden;
        }


        #changePassword th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #changePassword th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #changePassword td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #changePassword td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #changePassword td,th {
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
            width:400px;
            color:white;
            cursor:pointer;
        }

        #email, #oldpassword, #newpassword, #confirm {
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
    Change Password
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="changepass" method="post" name="changepass" runat="server" onmouseover="checkPass(); submitPass();">
        <table id="changePassword">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>User Information</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><p>Email:</p></td>
                    <td><input type="text" id="email" name="email"/></td>
                </tr>
                <tr>
                    <td><p>Old Password:</p></td>
                    <td><input type="password" id="oldpassword" name="oldpassword"></td>
                </tr>
                <tr>
                    <td><p>New Password:</p></td>
                    <td><input type="password" id="newpassword" name="newpassword" onkeyup="checkPass()"></td>
                </tr>
                <tr>
                    <td><p>Confirm New Password:</p></td>
                    <td><input type="password" id="confirm" name="confirm" onkeyup="checkPass()"></td>
                </tr>
            </tbody>
        </table>
        <br />
        <input type="submit" value="Submit" name="submit" id="enter" />
    </form>
    <p id="error" ><%=error %></p>
    <script>
        function checkPass() {
            var pa1 = document.getElementById("newpassword");
            var pa2 = document.getElementById("confirm");
            var pa3 = document.getElementById("email");
            var pa4 = document.getElementById("oldpassword");
            var goodcolor = "#66cc66";
            var badcolor = "#ff6666";
            var submit = document.getElementById("enter");
            if (pa1.value == pa2.value && pa1.value.localeCompare("") !=0 ) {
                pa2.style.backgroundColor = goodcolor;
                if (pa3.value.localeCompare("") != 0 && pa4.value.localeCompare("") != 0) {
                    submit.disabled = false;
                }
            }
            else {
                pa2.style.backgroundColor = badcolor;
                submit.disabled = true;
            }
        }
        function submitPass() {
            var submit = document.getElementById("enter");
            if (submit.disabled) {
                submit.style.cursor = "not-allowed";
            }
            else {
                submit.style.cursor = "pointer";
            }
        }

    </script>
</asp:Content>

