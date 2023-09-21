<%@ Page Title="Info" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>


        .selectt {
            position:relative;
            font-family: Arial;
            margin:auto;
            
        }

        .selectt select {
            display:none;
        }

        .select-selected {
            background-color:red;
            border-radius:5px;
            border-color:black;
            border-style:solid;
        }

        .select-selected:after {
            position: absolute;
            content: "";
            top: 14px;
            right: 10px;
            width: 0;
            height: 0;
            border: 6px solid transparent;
            border-color: #fff transparent transparent transparent;
        }

        .select-selected.select-arrow-active:after {
            border-color: transparent transparent #fff transparent;
            top: 7px;
        }
        .select-items div,.select-selected {
            color: #ffffff;
            padding: 8px 16px;
            border: 1px solid transparent;
            border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
            cursor: pointer;
        }

        .select-items {
            position: absolute;
            background-color: red;
            top: 100%;
            left: 0;
            right: 0;
            z-index: 1;
            border-radius:5px;
        }

        .select-hide {
            display: none;
        }

        .select-items div:hover, .same-as-selected {
            background-color: rgba(0, 0, 0, 0.1);
        }

        .nothing select {
            display:none;
        }

        #info {
            overflow-y: auto;
            height:350px;
            border-width:1px;
            border-style:ridge;
        }

        .cover {
            transition:0.5s;
            z-index: 100;
        }

        .cover:hover {
            transform:scale(1.2,1.2);
            transform-origin:center;
            z-index:100;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Info<span id="title"></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main2">
        <h2 id="Name" style="text-align:center;">This is the Info page. Here you can learn about what the shows are about and read the summaries of each episode.</h2>
        <div class="selectt" style="width:300px;">
             <select>
                <option value="1">- -  Select  - -</option>
                <option value="2">Big Mouth</option>
                <option value="3">Rick and Morty</option>
                <option value="4">Final Space</option>
                <option value="5">Black Mirror</option>
            </select>
        </div>
        <br />
        <div><img src="Icon.png" style="height:150px; width:150px; display:block; margin-left:auto; margin-right:auto; border:solid 2px black; " class="cover"/></div>
        <br />
        <div class="selectt" style="width:300px;">
            <select>
                <option value="1">- -  Select Show First  - -</option>
                <option value="2">Show Summary</option>
                <option value="3">Seasons</option>
                <option value="4">Links</option>
            </select>
        </div>
        <p id="info" style="font-size:large;"></p>
    </div>

    <script src="InfoSeasonst.js"></script>
    <script>
        var x = document.getElementsByClassName("selectt"); //x is an array with the length of 1, that contains only ):div.selectt (get elements by tag name is always an array)
        for (var i = 0; i < x.length; i++) {
            var selEl = x[i].getElementsByTagName("select")[0]; //selel is an array that contains only one thing: select (get elements by tag name is always an array). the [0] in the end makes selel a new array, an array with all of the options of the select
            var a = document.createElement("DIV"); // a is the selected option of the select, what you see when it's not open
            a.setAttribute("class", "select-selected");
            a.innerHTML = selEl.options[selEl.selectedIndex].innerHTML; //selel.options are the options that i offered
            a.style.textAlign = "center";
            x[i].appendChild(a); //the div a is inside the select
            var b = document.createElement("DIV"); //b is the div that contains all of the options, what opens when the select is clicked.
            b.setAttribute("class", "select-items select-hide");
            for (var j = 1; j < selEl.length; j++) {
                var c = document.createElement("DIV"); //new div 'c' for each new option.
                c.innerHTML = selEl.options[j].innerHTML; //c contains the same things that the original select contained
                c.addEventListener("click", function (e) { //when an option 'c' is selected, this function will happen

                    var s = this.parentNode.parentNode.getElementsByTagName("select")[0]; //s is the same as selEl
                    var h = this.parentNode.previousSibling; //this is what was written in the select before the new option
                    for (var i = 0; i < s.length; i++) { //i goes through every single option in s (selEl)
                        if (s.options[i].innerHTML == this.innerHTML) { //if the selected element is the same as the element that's in the for
                            s.selectedIndex = i; //change the selected index of the select (whats written inside a)
                            h.innerHTML = this.innerHTML; //change what was written in a
                            var y = this.parentNode.getElementsByClassName("same-as-select"); //y is what is written in 
                            for (var k = 0; k < y.length; k++) { //will delete previous selection
                                y[k].removeAttribute("class"); //the previous selected option will no longer be selected

                            }
                            this.setAttribute("class", "same-as-select"); //for the next select, this will be h 
                            break; //once the a is changed, we can break the loop
                        }
                    }
                    h.click(); //make event listener work
                    document.getElementById("Name").innerHTML = document.getElementsByClassName("select-selected")[0].innerHTML;
                    changeCover();
                    showSelect();
                    console.log(constructTable(finalspace));
                }); //end of event listener
                b.appendChild(c); //add the div c to the div b which is the container of all the options
            }
            x[i].appendChild(b); //b is part of the div selectt,  b is part of the select
            a.addEventListener("click", function (e) { //when this select is selected, all other selects will be closed
                e.stopPropagation(); // stop propogation makes it so that when we click on a, it doesnt affect x[0]
                closeAll(this); //will close all selects other than this one 
                this.nextSibling.classList.toggle("select-hide");//every time a is clicked, b will change from select hide to not hidden, and from not hidden to hidden
                this.classList.toggle("select-arrow-active"); //every time a is clicked, active arrow will change from up to down and from down to up
            });
        }
        function closeAll(elmnt) { //close all selects except for the one that u just opened
            var arrNo = [];
            var x = document.getElementsByClassName("select-items");
            var y = document.getElementsByClassName("select-selected");
            for (i = 0; i < y.length; i++) {
                if (elmnt == y[i]) { 
                    arrNo.push(i);
                }
                else {
                    y[i].classList.remove("select-arrow-active"); //for each make the arrow go down
                }
            }
            for (var i = 0; i < x.length; i++) {
                if (arrNo.indexOf(i)) {
                    x[i].classList.add("select-hide"); //for each select, close it
                }
            }
        }
        document.addEventListener("click", closeAll); //close all when clicking on document and not on select

        function changeCover() {
            var a = document.getElementsByClassName("select-selected")[0].innerHTML;
            var b = document.getElementsByClassName("select-selected")[1].innerHTML;
            if (b.localeCompare("- -  Select Show First  - -") == 0) { document.getElementsByClassName("select-selected")[1].innerHTML = "- -  Select  - -";}
            switch (a) {
                case ("Big Mouth"):
                    document.getElementsByClassName("cover")[0].src = "image/BigMouth1.jpg";
                    document.getElementsByClassName("cover")[0].alt = "Big Mouth";
                    document.getElementsByClassName("cover")[0].title = "Big Mouth Cover";
                    break;
                case ("Rick and Morty"):
                    document.getElementsByClassName("cover")[0].src = "image/rickandmorty1.png";
                    document.getElementsByClassName("cover")[0].alt = "Rick and Morty";
                    document.getElementsByClassName("cover")[0].title = "Rick and Morty Cover";
                    break;
                case ("Final Space"):
                    document.getElementsByClassName("cover")[0].src = "image/finalspace4.jpg";
                    document.getElementsByClassName("cover")[0].alt = "Final Space";
                    document.getElementsByClassName("cover")[0].title = "Final Space Cover";
                    break;
                case ("Black Mirror"):
                    document.getElementsByClassName("cover")[0].src = "image/blackmirror1.png";
                    document.getElementsByClassName("cover")[0].alt = "Black Mirror";
                    document.getElementsByClassName("cover")[0].title = "Black Mirror Cover";
                    break;
            }
            document.getElementById("title").innerHTML=": " + a;
        }

        function showSelect() {
            var a = document.getElementById("info");
            var sub1 = document.getElementsByClassName("select-selected")[0].innerHTML;
            var sub2 = document.getElementsByClassName("select-selected")[1].innerHTML;

            switch (sub1) {
                case ("Big Mouth"):
                    if (sub2.localeCompare("Show Summary") == 0) {
                        a.innerHTML = "<b>Big Mouth</b> is an American adult animated sitcom created by Nick Kroll, Andrew Goldberg, Mark Levin, and Jennifer Flackett featuring teens based on Kroll and Goldberg's upbringing in Westchester County, New York, with Kroll voicing his fictional self. The first season consisting of ten episodes premiered on Netflix on September 29, 2017, and the second season was released on October 5, 2018. In November 2018, Netflix announced that Big Mouth was renewed for a third season, which was preceded by a Valentine's Day special episode on February 8, 2019. The series follows a group of 7th graders, including best friends Nick Birch and Andrew Glouberman, as they navigate their way through puberty in the suburbs of New York City. Acting as shoulder angels are the hormone monsters: Maurice, who pesters Andrew and occasionally Nick and Jay; and Connie, who pesters Jessi and occasionally Missy. <br /><cite>Wikipedia</cite>";
                    }
                    else if (sub2.localeCompare("Seasons") == 0) {
                        a.innerHTML = constructTable(bigmouth);
                    }
                    else if (sub2.localeCompare("Links") == 0) {
                        a.innerHTML = "<a target=\"_blank\" href=\"https://en.wikipedia.org/wiki/Big_Mouth_(TV_series)\">Wikipedia</a><br /><a target=\"_blank\" href=\"https://bigmouth.fandom.com/wiki/Big_Mouth_Wiki\">Fandom</a>"
                    }
                    break;
                case ("Rick and Morty"):
                    if (sub2.localeCompare("Show Summary") == 0) {
                        a.innerHTML = "<b>Rick and Morty</b> is an American adult animated science fiction sitcom created by Justin Roiland and Dan Harmon for Cartoon Network's late-night programming block Adult Swim. The series follows the misadventures of cynical mad scientist Rick Sanchez and his good-hearted but fretful grandson Morty Smith, who split their time between domestic life and interdimensional adventures. The series premiered on December 2, 2013, and the third season concluded on October 1, 2017. In May 2018, the series was picked up for an additional 70 episodes over an unspecified number of seasons. The show revolves around the adventures of the members of the Smith household, which consists of parents Jerry and Beth, their children Summer and Morty, and Beth's father, Rick Sanchez, who lives with them as a guest. According to Justin Roiland, the family lives outside of Seattle in the U.S. state of Washington. The adventures of Rick and Morty, however, take place across an infinite number of realities, with the characters travelling to other planets and dimensions through portals and Rick's flying car. Rick is an eccentric and alcoholic mad scientist, who eschews many ordinary conventions such as school, marriage, love, and family. He frequently goes on adventures with his 14-year-old grandson, Morty, a kind-hearted but easily distressed boy, whose naïve but grounded moral compass plays counterpoint to Rick's Machiavellian ego. Morty's 17-year-old sister, Summer, is a more conventional teenager, who worries about improving her status among her peers and sometimes follows Rick and Morty on their adventures. The kids' mother, Beth, is a generally level-headed person and assertive force in the household, though self-conscious about her professional role as a horse surgeon. She is dissatisfied with her marriage to Jerry, a simple-minded and insecure person, who disapproves of Rick's influence over his family. <br /><cite>Wikipedia</cite>";
                    }
                    else if (sub2.localeCompare("Seasons") == 0) {
                        a.innerHTML = constructTable(rickandmorty);
                    }
                    else if (sub2.localeCompare("Links") == 0) {
                        a.innerHTML = "<a target=\"_blank\" href=\"https://en.wikipedia.org/wiki/Rick_and_Morty\">Wikipedia</a><br /><a target=\"_blank\" href=\"https://twitter.com/rickandmorty?lang=en\">Twitter</a>"
                    }
                    break;
                case ("Final Space"):
                    if (sub2.localeCompare("Show Summary") == 0) {
                        a.innerHTML = "<b>Final Space</b> is an American animated space opera comedy-drama television series developed for cable network TBS. The show was created by independent internet filmmaker Olan Rogers with David Sacks serving as showrunner. The series involves an astronaut named Gary and his alien friend, Mooncake, and focuses on their intergalactic adventures as they try to solve the mystery of the titular \"Final Space.\" Gary Goodspeed is a boisterous yet inept astronaut who, in the midst of working off the last few days of his five-year sentence aboard the prison spacecraft Galaxy One, encounters a mysterious planet-destroying alien. Soon, he befriends the alien, whom he names Mooncake, and discovers that Mooncake is wanted by the forces of a powerful telekinetic creature known as the Lord Commander. Together, with the ship's computer H.U.E, an army of similar but unfalteringly loyal robots, and a growing crew of new shipmates, Gary and Mooncake embark on a quest to save the universe, all while trying to uncover the mystery of what \"Final Space\" really is. <br /><cite>Wikipedia</cite>";
                    }
                    else if (sub2.localeCompare("Seasons") == 0) {
                        a.innerHTML = constructTable(finalspace);
                    }
                    else if (sub2.localeCompare("Links") == 0) {
                        a.innerHTML = "<a target=\"_blank\" href=\"https://en.wikipedia.org/wiki/Final_Space\">Wikipedia</a><br /><a target=\"_blank\" target=\"_blank\" href=\"https://final-space.fandom.com/wiki/Final_Space_(series)\">Fandom</a>"
                    }
                    break;
                case ("Black Mirror"):
                    if (sub2.localeCompare("Show Summary") == 0) {
                        a.innerHTML = "<b>Black Mirror</b> is a British science fiction anthology television series created by Charlie Brooker, with Brooker and Annabel Jones serving as the programme showrunners. It examines modern society, particularly with regard to the unanticipated consequences of new technologies. Episodes are standalone, usually set in an alternative present or the near future, often with a dark and satirical tone, though some are more experimental and lighter. Black Mirror was inspired by older anthology series like The Twilight Zone, which were able to deal with controversial, contemporary topics without fear of censorship. Brooker developed Black Mirror to highlight topics related to humanity's relationship to technology, creating stories that feature \"the way we live now – and the way we might be living in 10 minutes' time if we're clumsy.\" The series premiered for two series on the British television channel Channel 4 in December 2011 and February 2013, respectively. After its addition to the catalogue in December 2014, Netflix purchased the programme in September 2015. It commissioned a series of 12 episodes later divided into the third and fourth series, each six episodes; the former was released on 21 October 2016 and the latter on 29 December 2017. A fifth series was announced on 5 March 2018. A standalone interactive film titled Black Mirror: Bandersnatch was released on 28 December 2018.<br /> <cite>Wikipedia</cite>";
                    }
                    else if (sub2.localeCompare("Seasons") == 0) {
                        a.innerHTML = constructTable(blackmirror);
                    }
                    else if (sub2.localeCompare("Links") == 0) {
                        a.innerHTML = "<a target=\"_blank\" href=\"https://en.wikipedia.org/wiki/Black_Mirror\">Wikipedia</a><br /><a target=\"_blank\" href=\"https://twitter.com/blackmirror?lang=en\">Twitter</a>"
                    }
                    break;
            }
        }


        

    </script>
</asp:Content>

