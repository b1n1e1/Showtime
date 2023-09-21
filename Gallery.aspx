<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #vids {
            border:2px solid black;
            margin: 0 auto;
        }

        #vids td {
            width: 275px;
            height: 200px;
            transition: 0.25s;
        }

        #vids td:hover {
            background-size: 100% 100%;
            transform: scale(1.4545,1.34);
            transform-origin: center;
        }

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

        .vid {
            width:275px;
            height:220px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">Gallery<span id="title"></span> 
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>This is the gallery: this page contains trailers, pictures and highlights from the TV shows.
    </p>
    <form id="options" method="post" runat="server">
        <div class="selectt" style="width:300px;">
            <select>
                <option value="1">- -  Select  - -</option>
                <option value="2">Big Mouth Highlights</option>
                <option value="3">Rick and Morty Highlights</option>
                <option value="4">Final Space Highlights</option>
                <option value="5">Black Mirror Highlights</option>
                <option value="6">Big Mouth Pictures</option>
                <option value="7">Rick and Morty Pictures</option>
                <option value="8">Final Space Pictures</option>
                <option value="9">Black Mirror Pictures</option>
                <option value="10">Trailers</option>
            </select>
        </div>
    </form>
        <script>
            var x = document.getElementsByClassName("selectt"); //x is an array with the length of 1, that contains only ):div.selectt (get elements by tag name is always an array)
            var selEl = x[0].getElementsByTagName("select")[0]; //selel is an array that contains only one thing: select (get elements by tag name is always an array). the [0] in the end makes selel a new array, an array with all of the options of the select
            var a = document.createElement("DIV"); // a is the selected option of the select, what you see when it's not open
            a.setAttribute("class", "select-selected");
            a.innerHTML = selEl.options[selEl.selectedIndex].innerHTML; //selel.options are the 10 options that i offered
            a.style.textAlign = "center";
            x[0].appendChild(a); //the div a is inside the select
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
                    changeVid();
                }); //end of event listener
                b.appendChild(c); //add the div c to the div b which is the container of all the options
            }
            x[0].appendChild(b); //b is part of the div selectt,  b is part of the select
            a.addEventListener("click", function (e) { //when this select is selected, all other selects will be closed
                e.stopPropagation(); // stop propogation makes it so that when we click on a, it doesnt affect x[0]
                closeAll(this); //will close all selects other than this one 
                this.nextSibling.classList.toggle("select-hide");//every time a is clicked, b will change from select hide to not hidden, and from not hidden to hidden
                this.classList.toggle("select-arrow-active"); //every time a is clicked, active arrow will change from up to down and from down to up
            });
            
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
        </script>
    <br />
    <table id="vids">
        <tr>
            <td id="one">
                <iframe class="vid" style="width:275px; height:220px;" src="https://www.youtube.com/embed/hk_BoK0OwZs"></iframe>
            </td>
            <td id="two">
                <iframe class="vid" style="width:275px; height:220px;" src="https://www.youtube.com/embed/wh10k2LPZiI"></iframe>
            </td>
        </tr>
        <tr>
            <td id="three">
                <iframe class="vid" style="width:275px; height:220px;" src="https://www.youtube.com/embed/4EHbt_kSkG8"></iframe>
            </td>
            <td id="four">
                <iframe class="vid" style="width:275px; height:220px;" src="https://www.youtube.com/embed/jDiYGjp5iFg"></iframe>
            </td>
        </tr>
    </table>
    <script>
        function changeVid() {

            var a = document.getElementsByClassName("select-selected")[0].innerHTML;
            var one = document.getElementById("one");
            var two = document.getElementById("two");
            var three = document.getElementById("three");
            var four = document.getElementById("four");


            switch (a) {
                default:
                    one.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\"  src=\"https://www.youtube.com/embed/hk_BoK0OwZs\"></iframe>";
                    two.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/wh10k2LPZiI\"></iframe>";
                    three.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/4EHbt_kSkG8\"></iframe>";
                    four.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/jDiYGjp5iFg\"></iframe>";
                    break;
                case ("Big Mouth Highlights"):
                    one.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/yRL4QyyJe4U\"></iframe>";
                    two.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/XEEOkYUJ-EA\"></iframe>";
                    three.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/r51e2CwIH8M\"></iframe>";
                    four.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/39SASyZVcBE\"></iframe>";
                    break;
                case ("Rick and Morty Highlights"):
                    one.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/XbvI7FpxwAU\"></iframe>";
                    two.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/wh10k2LPZiI\"></iframe>";
                    three.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/duJKvDndclQ\"></iframe>";
                    four.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/PHCx4Wmj-_A\"></iframe>";
                    break;
                case ("Final Space Highlights"):
                    one.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/zQUOwyEowOA\"></iframe>";
                    two.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/K7ko4m1D5EI\"></iframe>";
                    three.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/mSBCnO_L9KU\"></iframe>";
                    four.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/R17KxhiLQjE\"></iframe>";
                    break;
                case ("Black Mirror Highlights"):
                    one.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/XM0xWpBYlNM\"></iframe>";
                    two.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/z2spS4Lc3CM\"></iframe>";
                    three.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/VqKY9o5igAI\"></iframe>";
                    four.innerHTML = "<iframe class=\"vid\" style=\"width:275px; height:220px;\" src=\"https://www.youtube.com/embed/ZJdJdJUhaIc\"></iframe>";
                    break;
                case ("Big Mouth Pictures"):
                    one.innerHTML = "<img class=\"vid\" alt=\"Big Mouth Cover Art\" title=\"Big Mouth Cover Art\" style=\"width:275px; height:200px;\" src=\"image/BigMouth1.jpg\" />";
                    two.innerHTML = "<img class=\"vid\" alt=\"Jessie Furious\" title=\"Furious Jessie and Connie\" style=\"width:275px; height:200px;\" src=\"image/BigMouth2.jpg\" />";
                    three.innerHTML = "<img class=\"vid\" alt=\"Awkward Double Date\" title=\"Awkward Double Date\" style=\"width:275px; height:200px;\" src=\"image/BigMouth3.jpg\" />";
                    four.innerHTML = "<img class=\"vid\" alt=\"Smooch or Share\" title=\"Smooch or Share\" style=\"width:275px; height:200px;\" src=\"image/BigMouth4.jpeg\" />";
                    break;
                case ("Rick and Morty Pictures"):
                    one.innerHTML = "<img class=\"vid\" alt=\"Rick and Morty Cover Art\" title=\"Rick and Morty Cover Art\" style=\"width:275px; height:200px;\" src=\"image/rickandmorty1.png\" />";
                    two.innerHTML = "<img class=\"vid\" alt=\"Rick and Unity\" title=\"Rick and Unity\" style=\"width:275px; height:200px;\" src=\"image/rickandmorty2.png\" />";
                    three.innerHTML = "<img class=\"vid\" alt=\"Evil Morty\" title=\"Evil Morty\" style=\"width:275px; height:200px;\" src=\"image/rickandmorty3.jpg\" />";
                    four.innerHTML = "<img class=\"vid\" alt=\"Sanchez Family\" title=\"Sanchez Family\" style=\"width:275px; height:200px;\" src=\"image/rickandmorty4.png\" />";
                    break;
                case ("Final Space Pictures"):
                    one.innerHTML = "<img class=\"vid\" alt=\"Final Space Cover Art\" title=\"Final Space Cover Art\" style=\"width:275px; height:200px;\" src=\"image/finalspace4.jpg\" />";
                    two.innerHTML = "<img class=\"vid\" alt=\"Mooncake Saves Gary\" title=\"Mooncake Saves Gary\" style=\"width:275px; height:200px;\" src=\"image/finalspace2.jpg\" />";
                    three.innerHTML = "<img class=\"vid\" alt=\"Avocato\" title=\"Avocato\" style=\"width:275px; height:200px;\" src=\"image/finalspace3.png\" />";
                    four.innerHTML = "<img class=\"vid\" alt=\"Final Space Characters\" title=\"Final Space Characters\" style=\"width:275px; height:200px;\" src=\"image/finalspace1.png\" />";
                    break;
                case ("Black Mirror Pictures"):
                    one.innerHTML = "<img class=\"vid\" alt=\"Black Mirror Cover Art\" title=\"Black Mirror Cover Art\" style=\"width:275px; height:200px;\" src=\"image/blackmirror1.png\" />";
                    two.innerHTML = "<img class=\"vid\" alt=\"The Entire History Of You\" title=\"The Entire History Of You\" style=\"width:275px; height:200px;\" src=\"image/blackmirror2.jpg\" />";
                    three.innerHTML = "<img class=\"vid\" alt=\"USS Callister\" title=\"USS Callister\" style=\"width:275px; height:200px;\" src=\"image/blackmirror3.jpg\" />";
                    four.innerHTML = "<img class=\"vid\" alt=\"15 Million Merits\" title=\"15 Million Merits\" style=\"width:275px; height:200px;\" src=\"image/blackmirror4.jpg\" />";
                    break;
            }
            var a = document.getElementsByClassName("select-selected")[0].innerHTML;
            document.getElementById("title").innerHTML=": " + a; 
        }
    </script>
</asp:Content>

