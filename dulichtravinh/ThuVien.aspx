﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="ThuVien.aspx.cs" Inherits="dulichtravinh.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header class = "flex header-sm">
        <div class = "container">
            <div class = "header-title">
                <h1>Gallery</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus rerum maxime enim odit illum in molestias beatae doloremque, ratione optio.</p>
            </div>
        </div>
    </header>
    <!-- header -->

    <!-- gallery section -->
    <div id = "gallery" class = "py-4">
        <div class = "container">
            <div class = "gallery-row">
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-1.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-2.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-3.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-4.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-5.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-6.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-7.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-8.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
                <div class = "gallery-item shadow">
                    <img src = "/Resources/images/gallery-9.jpg" alt = "gallery img">
                    <span class = "zoom-icon">
                        <i class = "fas fa-search-plus"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <!-- end of gallery section -->

    <!-- img modal -->
    <div id = "img-modal-box">
        <div id = "img-modal">
            <button type = "button" id = "modal-close-btn" class = "flex">
                <i class = "fas fa-times"></i>
            </button>
            <button type = "button" id = "prev-btn" class = "flex">
                <i class = "fas fa-chevron-left"></i>
            </button>
            <button type = "button" id = "next-btn" class = "flex">
                <i class = "fas fa-chevron-right"></i>
            </button>
            <img src = "/Resources/images/gallery-1.jpg">
        </div>
    </div>
    <!-- end of img modal -->

    <!-- popular places section -->
    <section id = "popular" class = "py-4">
        <div class = "title-wrap">
            <span class = "sm-title">know about some coo destination</span>
            <h2 class = "lg-title">Popular Places</h2>
        </div>

        <div class = "popular-row">
            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-1.jpg" alt = "">
                <div>
                    <span>Eiffel Tower, Paris</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-2.jpg" alt = "">
                <div>
                    <span>Machu Picchu, Peru</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-3.jpg" alt = "">
                <div>
                    <span>Acropolis, Athens</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-4.jpg" alt = "">
                <div>
                    <span>Bali, Indonesia</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-5.jpg" alt = "">
                <div>
                    <span>Dubai, United Arab Emirates</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-6.jpg" alt = "">
                <div>
                    <span>Bhutan</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-7.jpg" alt = "">
                <div>
                    <span>Havana, Cuba</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>

            <div class = "popular-item shadow">
                <img src = "/Resources/images/popular-8.jpg" alt = "">
                <div>
                    <span>Moskva, Russia</span>
                    <ul class = "rating flex">
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star"></i></li>
                        <li><i class = "fas fa-star-half-alt"></i></li>
                        <li>&nbsp;400 reviews</li>
                    </ul>
                    <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, quia!</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        // image modal
        const allGalleryItem = document.querySelectorAll('.gallery-item');
        const imgModalDiv = document.getElementById('img-modal-box');
        const modalCloseBtn = document.getElementById('modal-close-btn');
        const nextBtn = document.getElementById('next-btn');
        const prevBtn = document.getElementById('prev-btn');
        let imgIndex = 0;

        allGalleryItem.forEach((galleryItem) => {
            galleryItem.addEventListener('click', () => {
                imgModalDiv.style.display = "block";
                let imgSrc = galleryItem.querySelector('img').src;
                imgIndex = parseInt(imgSrc.split("-")[1].substring(0, 1));
                showImageContent(imgIndex);
            })
        });

        // next click
        nextBtn.addEventListener('click', () => {
            imgIndex++;
            if(imgIndex > allGalleryItem.length){
                imgIndex = 1;
            }
            showImageContent(imgIndex);
        });

        // previous click
        prevBtn.addEventListener('click', () => {
            imgIndex--;
            if(imgIndex <= 0){
                imgIndex = allGalleryItem.length;
            }
            showImageContent(imgIndex);
        });

        function showImageContent(index){
            imgModalDiv.querySelector('#img-modal img').src = `/Resources/images/gallery-${index}.jpg`;
        }

        modalCloseBtn.addEventListener('click', () => {
            imgModalDiv.style.display = "none";
        })
    </script>
</asp:Content>
