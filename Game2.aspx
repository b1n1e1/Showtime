<%@ Page Title="Game" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Game2.aspx.cs" Inherits="Game2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #game {
            top:0;
            height:500px;
            width:620px;
            background-color:black;
            border:5px solid black;
            border-radius:5px;
            padding-left:0;
            padding-right:0;
            margin-left:auto;
            margin-right:auto;
            display:block;
            margin-top:10px;
            position:relative;

        }
        .show {
            width:140px;
            margin-left:10px;
            background-color:red;
            height:50px;
            display:inline;
            float:left;
            margin-top:440px;
            border-radius:5px;
            vertical-align:central;
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Game
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="game">
        <span class="show"><br />Black Mirror</span>
        <span class="show"><br />Final Space</span>
        <span class="show"><br />Big Mouth</span>
        <span class="show"><br />Rick and Morty</span>

    </div>
</asp:Content>

