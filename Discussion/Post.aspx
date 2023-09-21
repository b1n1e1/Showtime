<%@ Page Title="Post" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Discussion_Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        div #texteditor {
            margin: 0 auto;
            width:750px;
            height:350px;
        }
        div#theRibbon {
            border-bottom:none;
            padding:10px;
            background-color:red;
            color:white;
            border-radius: 8px 8px 0 0;
        }
        div#RichTextEditor {
            border:2px solid red;
            height:300px;
            width:746px;
        }
        iframe#wysiwyg {
            height:100%;
            width:100%;
        }
        div #theRibbon > button {
            background-color:transparent;
            color:white;
            cursor:pointer;
            border:0;
            outline:0;
            transition:0.3s;
            border-radius:5px;
        }
        div#theRibbon > button:hover {
            background-color:rgb(20,90,70);
        }
        input[type="color"] {
            border:none;
            outline:none;
            background-color:transparent;
            cursor:pointer;
        }
        #subbmit {
            font-size:30px;
            background-color:red; 
            border-radius:5px; 
            cursor:pointer; 
            width:80px; 
            height:50px;
            color:white;
            display:block;
            margin:7px auto; 
            border-width:0; 
            transition:0.5s;
        }
        #subbmit:hover {
            background-color:rgb(194, 0, 0)
        }
    </style>
    <script>
        window.addEventListener("load", function () {
            var editor = wysiwyg.document;
            editor.designMode = 'On';

            boldbutton.addEventListener("click", function () {
                editor.execCommand("Bold", false, null);
            }, false);

            italicbutton.addEventListener("click", function () {
                editor.execCommand("Italic", false, null);
            }, false);

            supButton.addEventListener("click", function () {
                editor.execCommand("Superscript", false, null);
            }, false);

            subButton.addEventListener("click", function () {
                editor.execCommand("Subscript", false, null);
            }, false);

            strikeButton.addEventListener("click", function () {
                editor.execCommand("Strikethrough", false, null);
            }, false);

            orderedButton.addEventListener("click", function () {
                editor.execCommand("InsertOrderedList", false, "newOl" + Math.round(Math.random() * 1000));
            }, false);

            unorderedButton.addEventListener("click", function () {
                editor.execCommand("InsertUnorderedList", false, "newOl" + Math.round(Math.random()*1000));
            }, false);

            font.addEventListener("change", function (e) {
                editor.execCommand("ForeColor", false, e.target.value);
            }, false);

            background.addEventListener("change", function (e) {
                editor.execCommand("BackColor", false, e.target.value);
            }, false);

            fontChanger.addEventListener("change", function (e) {
                editor.execCommand("FontName", false, e.target.value);
            }, false);

            fontSize.addEventListener("change", function (e) {
                editor.execCommand("FontSize", false, e.target.value);
            }, false);

            linkButton.addEventListener("click", function () {
                var url = prompt("Enter a URL", "http://");
                editor.execCommand("CreateLink", false, url);
            }, false);

            removeLink.addEventListener("click", function () {
                editor.execCommand("UnLink", false, null);
            }, false);

            undoButton.addEventListener("click", function () {
                editor.execCommand("undo", false, null);
            }, false);

            redoButton.addEventListener("click", function () {
                editor.execCommand("redo", false, null);
            }, false);

        }, false);

        function fillInput() {
            var a = wysiwyg.document.body.innerHTML;
            content.value = a;
        }

        window.addEventListener("mouseover", fillInput);

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Post
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <input id="title" name="title" type="text" placeholder="Title" style="background-color:transparent; border-radius:5px; border-color:black; border-width:1px; height:30px; margin-top:10px; margin-left:17px; padding-left:5px; width:400px; font-family:Ebrima; font-weight:bold;" form="post" maxlength="100" />
        <br />
        <br />
        <div id="texteditor">
            <div id="theRibbon">
                <button id="boldbutton" title="Bold"><b>B</b></button>
                <button id="italicbutton" title="Italic"><em>I</em></button>
                <button id="supButton" title="Superscript">X<sup>2</sup></button>
                <button id="subButton" title="Subscript">X<sub>2</sub></button>
                <button id="strikeButton" title="Strikethrough"><s>S</s></button>
                <button id="orderedButton" title="Number List">(i)</button>
                <button id="unorderedButton" title="Bullet List">&bull;</button>
                <input type="color" id="font" title="Font Color" />
                <input type="color" id="background" title="Background Color" />
                <select id="fontChanger">
                    <option style="font-family:'Times New Roman'">Times New Roman</option>
                    <option style="font-family:Consolas">Consolas</option>
                    <option style="font-family:Tahoma">Tahoma</option>
                    <option style="font-family:monospace">Monospace</option>
                    <option style="font-family:cursive">Cursive</option>
                    <option style="font-family:sans-serif">Sans Serif</option>
                    <option style="font-family:Calibri">Calibri</option>
                </select>
                <select id="fontSize">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                </select>
                <button id="linkButton" title="Link">Link</button>
                <button id="removeLink" title="Remove Link">Unlink</button>
                <button id="undoButton" title="Undo Button">&larr;</button>
                <button id="redoButton" title="Redo Button">&rarr;</button>
            </div>
            <div id="RichTextEditor">
                <iframe id="wysiwyg" name="wysiwyg" frameborder="0"></iframe>
            </div>
        </div>
    <input id="content" name="content" form="post" style="display:none;" />
    <form id="post" method="post" name="post" runat="server">
        <input id="subbmit" type="submit" value="Post" />
    </form>
</asp:Content>