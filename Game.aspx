<%@ Page Title="Snake" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Game.aspx.cs" Inherits="Game" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            align-items:center;
            justify-content:center;
            overflow-y:hidden;
            
        }
        canvas {
            border:1px solid black;
            padding-left:0;
            padding-right:0;
            margin-left:auto;
            margin-right:auto;
            display:block;
            margin-top:10px;
        }

        #thescore {
            font-size:larger;
            font-style:italic;
            text-align:center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    Snake
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <canvas width="400" height="400" id="game"></canvas>


    <script>
        var canvas = document.getElementById("game");
        var context = canvas.getContext('2d');
        var grid = 16;
        var count = 0;

        var snake = {
            x: 160,
            y: 160,
            dx: grid,
            dy: 0,
            cells: [],
            maxCells: 4
        };

        var apple = {
            x: 320,
            y: 320,
        };

        function randint(min, max) {
            return Math.floor(Math.random() * (max - min)) + min;
        }

        function loop() {
            requestAnimationFrame(loop);
            if (++count < 4) {
                return;
            }
            count = 0;
            context.clearRect(0, 0, canvas.width, canvas.height);
            snake.x += snake.dx;
            snake.y += snake.dy;

            if (snake.x < 0) snake.x = canvas.width - grid;
            else if (snake.x >= canvas.width) snake.x = 0;
            if (snake.y < 0) snake.y = canvas.height - grid;
            else if (snake.y >= canvas.height) snake.y = 0;

            snake.cells.unshift({ x: snake.x, y: snake.y });
            if (snake.cells.length > snake.maxCells) snake.cells.pop();

            context.fillStyle = 'red';
            context.fillRect(apple.x, apple.y, grid - 1, grid - 1);

            context.fillStyle = 'black';
            snake.cells.forEach(function (cell, index) {
                context.fillRect(cell.x, cell.y, grid - 1, grid - 1);
                if (cell.x == apple.x && cell.y == apple.y) {
                    snake.maxCells += 4;
                    document.getElementById("score").innerHTML = "" + snake.maxCells;
                    apple.x = randint(0, 25) * grid;
                    apple.y = randint(0, 25) * grid;

                }
                for (var i = index + 1; i < snake.cells.length; i++) {
                    if (cell.x === snake.cells[i].x && cell.y === snake.cells[i].y) {
                        snake.x = 160;
                        snake.y = 160;
                        snake.cells = [];
                        snake.maxCells = 4;
                        snake.dx = grid;
                        snake.dy = 0;
                        apple.x = randint(0, 25) * grid;
                        apple.y = randint(0, 25) * grid;
                        document.getElementById("score").innerHTML = 4;
                    }
                }
            });

        }

        document.addEventListener('keydown', function (e) {
            if (e.which === 37 && snake.dx === 0) {
                snake.dx = -grid;
                snake.dy = 0;
            }
            else if (e.which === 39 && snake.dx === 0) {
                snake.dx = grid;
                snake.dy = 0;
            }
            else if (e.which === 38 && snake.dy === 0) {
                snake.dy = -grid;
                snake.dx = 0;
            }
            else if (e.which === 40 && snake.dy === 0) {
                snake.dy = grid;
                snake.dx = 0;
            }
        });

        requestAnimationFrame(loop);

    </script>
    <br />
    <b><div id="thescore">Score: <span id="score">4</span> </div></b>

</asp:Content>

