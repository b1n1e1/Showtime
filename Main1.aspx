<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Main1.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #pics img {
            height:200px;
            width:200px;
        }

        #pics {
            text-align:center;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">Home</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="top:50%; font-size:40px;">
        <%=x %> 
    </h1>
    <pre style="font-family:Calibri;">
    "Show time" is a website where you can read about, watch and share your opinions about your favorite TV shows. 
    The shows that this website focuses on are Big Mouth, Rick and Morty, Final Space and Black Mirror.
    This website consists of several different tabs, including a gallery, info tab and a discussion.
    In order to post posts on the forum you must sign up or if you're already signed up, you must log in.
    Read the 'About Me' page to learn about me, the creator of this website.
    Click on the menu button on the top right to navigate through the website.
    Have a good time and remember to look at the inner code and see how much it took to create this site :)
    </pre>
    
    <!--<div id="pics"><img src="image/arcticmonkeys.jpg" alt="Arctic Monkeys" title="Arctic Monkeys"/><img src="image/avicii.jpg" alt="Avicii" title="Avicii"/><br />
    <img src="image/beerbongsandbentleys.jpg" alt="Beerbongs and Bentleys: Post Malone" title="Beerbongs and Bentleys: Post Malone"/>
    <img src="image/Two_Feet_-_Momentum.jpg" alt="Momentum: Two Feet" title="Momentum: Two Feet"/></div>-->
</asp:Content>
