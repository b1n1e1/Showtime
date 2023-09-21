<%@ Page Title="Discussion" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Discussion.aspx.cs" Inherits="Discussion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .forum {
            width:90%;
            background-color:red;
            color:white;
            border-radius:10px;
            padding-bottom:10px;
            margin: 0 auto 8px;
            cursor:pointer;
            font-family:'Lucida Bright'
        }
        .forum .forumName {
            margin-left:10px;
            font-size:40px;
            padding-bottom:5px;
        }
        .forum .forumDescription {
            margin-left:10px;
            font-size:20px;
            font-style:oblique;
        }
        a {
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Discussion
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main58">
            <br />
        <a href="Discussion/BigMouth.aspx">
            <div class="forum">
                <div class="forumName">Big Mouth</div>
                <div class="forumDescription">Discuss Big Mouth episodes, theories and more</div>
            </div>
        </a>
        <a href="Discussion/RickAndMorty.aspx">
            <div class="forum">
                <div class="forumName">Rick and Morty</div>
                <div class="forumDescription">Discuss Rick and Morty episodes, theories and more</div>
            </div>
        </a>
        <a href="Discussion/FinalSpace.aspx">
            <div class="forum">
                <div class="forumName">Final Space</div>
                <div class="forumDescription">Discuss Final Space episodes, theories and more</div>
            </div>
        </a>
        <a href="Discussion/BlackMirror.aspx">
            <div class="forum">
                <div class="forumName">Black Mirror</div>
                <div class="forumDescription">Discuss Black Mirror episodes, theories and more</div>
            </div>
        </a>
        <a href="Discussion/Misc.aspx">
            <div class="forum">
                <div class="forumName">Misc</div>
                <div class="forumDescription">Discuss other TV shows or chat about anything</div>
            </div>
        </a>
    </div>

</asp:Content>

