<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        #submitError {
            color:red;
            font-style:italic;
            text-align:center;
        }

        #signup tbody, thead tr {
            display:block;
        }

        #signup tbody {
            overflow-y:auto;
            overflow-x:hidden;
            height:400px;
        }


        #signup th:nth-child(1) {
            background-color:red;
            width:180px;
        }

        #signup th:nth-child(2) {
            width:700px;
            background-color:gainsboro;
        }

        #signup td:nth-child(2n+1) {
            background-color:red;
            width:180px;
        }

        #signup td:nth-child(2n) {
            width:700px;
            background-color:gainsboro;
        }

        #signup td,th {
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

        #email, #password, #confirm, #Fname, #Lname, #age {
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">Sign Up</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" name="form1" method="post" action="Signup.aspx" Runat="server" onmouseover="checkPass(); submitPass();">
        <table id="signup">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Your Answer</th>
                </tr>
                </thead>
            <tbody>
            <tr>
                <td><p>First Name:</p></td>
                <td><input type="text" placeholder="eg. John" id="Fname" name="Fname" /></td>
            </tr>
            <tr>
                <td><p>Last Name:</p></td>
                <td><input type="text" placeholder="eg. John" id="Lname" name="Lname" /></td>
            </tr>
            
            <tr>
                <td><p>Email:</p></td>
                <td><input type="email" placeholder="eg. johndoe@doe.net" id="email" name="email" /></td>
            </tr>
            <tr>
                <td><p>Gender:</p></td>
                <td>
                    <input type="radio" name="gender" id="male" value="male" checked="checked" ><label for="male">     Male</label> 
                    <input type="radio" name="gender" id="female" value="female"><label for="female">   Female</label>
                    <input type="radio" name="gender" id="other" value="other"><label for="other">     Other</label>
            </tr>
            <tr>
                <td><p>Age:</p></td>
                <td><input type="number" name="age" id="age" /></td>
            </tr>

                <tr><td><p>Shows of Interest:</p></td>
                <td>
                    <input type="checkbox" name="show" id="blackMirror" value="Black Mirror" /><label for="blackMirror">    Black Mirror</label>
                    <input type="checkbox" name="show" id="bigMouth" value="Big Mouth" /><label for="bigMouth">    Big Mouth</label>
                    <input type="checkbox" name="show" id="rickMorty" value="Rick and Morty" /><label for="rickMorty">    Rick and Morty</label>
                    <input type="checkbox" name="show" id="finalSpace" value="Final Space" /><label for="finalSpace">    Final Space</label>
                </td>
            </tr>


                <tr>
                <td><p>Password:</p></td>
                <td><input type="password" placeholder="Enter Password" id="password" name="password" onkeyup="checkPass();" />
                    <br /><input type="password" placeholder="Confirm Password" id="confirm" name="confirm" onkeyup="checkPass();" /></td>
            </tr>
            
            </tbody>
        </table>
        <br />
        <div id="submit"">
            <input value="Submit" type="submit" id="enter" name="submit"/>
        </div>
    </form>
    <p id="submitError"><%=error %></p>
    <script>
        function checkPass() {
            var pa1 = document.getElementById("password");
            var pa2 = document.getElementById("confirm");
            var pa3 = document.getElementById("Fname");
            var pa4 = document.getElementById("Lname");
            var pa5 = document.getElementById("email")
            var submit = document.getElementById("enter");
            var goodcolor = "#66cc66";
            var badcolor = "#ff6666";
            if (pa1.value == pa2.value && pa1.value.localeCompare("") !=0 ) {
                pa2.style.backgroundColor = goodcolor;
                if (pa3.value.localeCompare("") != 0 && pa4.value.localeCompare("") != 0 && pa5.value.localeCompare("") != 0) {
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

