<%@ Page Title="About" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #pics {
            border:2px solid black;
            margin: 0 auto;
        }

        #pics img {
            height:200px;
            width:275px;
        }

        #pics td {
            width: 275px;
            height: 200px;
            transition: 0.25s;
        }

        #pics td:hover {
            background-size: 100% 100%;
            transform: scale(1.4545,1.34);
            transform-origin: center;
        }
        #intro {
            font-size:smaller;
            font-style:oblique;
            font-family:'Malgun Gothic';
        }
        #main3 {
            height:600px;
            overflow:auto;
        }

        .linkdiv a {
            color:red;
            transition:1s;
            transition-delay:0.5s;
            margin:auto;
            font-style:oblique;
        }

        .linkdiv a:hover {
            color:black;
            font-size:larger;
            background-color:red;
            border-radius:5px;
            border-width:2px;
            border-style:solid;
            border-color:black;
        }



    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">About</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main3">
        <p id="intro"> This is the 'About Me' page where I write about myself. I am a student in 10th grade in Ostrovsky High School.
            This is a project that I was asked to create in Cyber class. In the 'About Me' page, I was asked to write why
            I chose this subject and details about myself. I was also asked to film a video of myself explaining why I
            chose my subject.
        </p>
        <ol>
            <li><b>Why I selected this subject:</b> 
                <blockquote>I selected this subject because I like watching TV and think that it is a good subject to do
                this project about because I knew from the beginning what I'd want to do. I also thought that it would be a good kind of challenge
                because I wanted to add a forum that users can use to post things. 
                </blockquote>
            </li>
            <li><b>Details About Me:</b>
                <br /><br />
                <ul>
                    <li>I am 15 years old.</li>
                    <li>I learn at Ostrovsky High School.</li>
                    <li>I live on Moshe Dayan street in Ra'anana.</li>
                    <li>I like watching TV and running.</li>
                    <li>I'm currently learning a course about deep learning.</li>
                </ul>
                <br />
            </li>
            <li>
                <b>Video Explaining The Website:</b>
                <br /><br />
                <video src="image/infovid.mp4" controls="controls" height="300" width="400"  />
            </li>
        </ol>
        <hr style="border:2px solid black; border-radius:7px;" />
        <table id="pics">
            <tr>
                <td>
                    <img src="image/IMG_5620.JPG" />
                </td>
                <td>
                    <img src="image/IMG_5692.JPG" />
                </td>

            </tr>
            <tr>
                <td>
                    <img src="image/IMG_5752.JPG" />
                </td>
                <td>
                    <img src="image/IMG_5907.JPG" />
                </td>
            </tr>
        </table>
        <br />
        <div class="linkdiv" style="text-align:center;">
            <a href="#intro" style="text-align:center;">Back To Top</a>
        </div>
        <br />
    </div>

</asp:Content>

