<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dulichtravinh.Default2" %>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="shortcut icon" href="./Resources/img/favicon.png" type="image/png">  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Du lịch Trà Vinh</title>
        <style>
            html {
               scroll-behavior: smooth;
            }
            .travinh-carousel {
                position: relative;
            }
            .travinh__carousel--img {
                height: 100vh;
                object-fit: cover;
                object-position: center;
            }
            .travinh__header {
                position: absolute;
                top: 0;
                z-index: 999;
                left: 50%;
                transform: translateX(-50%);
            }
            .travinh__menu {
                list-style: none;
            }
            .travinh__menu--item {
                display: inline-block;
            }
            .travinh__menu--link {
                display: block;
                margin: 0 20px;
                color: #000;
                font-size: 20px;
            }
            .is-menu {
                border-bottom: 2px solid #fff;

            }
            
            .travinh__menu--link img {
                border-radius: 50%;
            }
        </style>
    </head>
    <body>
        <form runat="server" id="form">  
            <div class="carousel slide" data-ride="carousel" id="travinh-carousel">
                <header class="travinh__header">
                    <ul class="travinh__menu">
                        <li class="travinh__menu--item">
                            <a class="travinh__menu--link is-menu" href="#">Trang Chu</a>
                        </li>
                        <li class="travinh__menu--item">
                            <a class="travinh__menu--link is-menu"" href="#">Bài viết</a>
                        </li>
                        <li class="travinh__menu--item">
                            <a class="travinh__menu--link" href="#">
                                <img src="https://picsum.photos/100/100" alt="Alternate Text" />
                            </a>
                        </li>
                        <li class="travinh__menu--item">
                            <a class="travinh__menu--link is-menu"" href="#">Dịch vụ</a>
                        </li>
                        <li class="travinh__menu--item">
                            <a class="travinh__menu--link is-menu"" href="#">Liên hệ</a>
                        </li>
                    </ul>
                </header>
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <img src="https://picsum.photos/1920/1080" class="d-block w-100 travinh__carousel--img" alt="...">
                    </div>
                    <div class="carousel-item active" style="height: 100vh; background-color: #fff;">
                        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)">
                            <div class="row" style="">
                                <div class="col-6">
                                    <h3>Hello word</h3>
                                    <p>Lorem ipsum</p>
                                </div>
                                <div class="col-6">
                                    <img src="./Resources/img/homestay.jpg" alt="Alternate Text" />
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="https://picsum.photos/1920/1080" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev" style="z-index: 1000">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next" style="z-index: 1000">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </button>  
            </div>
            <div class="container my-4">
                <div class="row">
                    <div class="col-4">
                        <div class="card">
                            <div class="card-body">Hello </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-body">
                                Card 2
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-body">
                                Card 3
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col-6 d-flex align-items-center text-lg">
                        <p>
                            Carousels support swiping left/right on touchscreen devices to move between slides. This can be disabled using the data-touch attribute. The example below also does not include the data-ride attribute and has data-interval="false" so it doesn’t autoplay.
                        </p>
                    </div>
                    <div class="col-6"> 
                        <img class="w-100" src="https://picsum.photos/400/300" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </form>  
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    </body>
</html>