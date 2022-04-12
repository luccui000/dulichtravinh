<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dulichtravinh.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header class = "flex">
            <div class = "container">
                <div class = "header-title">
                    <h1>Leave Your Footprints</h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus rerum maxime enim odit illum in molestias beatae doloremque, ratione optio.</p>
                </div> 
            </div>
        </header> 
        <section id = "featured" class = "py-4">
            <div class = "container">
                <div class = "title-wrap">
                    <span class = "sm-title">Những địa điểm bạn nên biết trước khi ghé thăm</span>
                    <h2 class = "lg-title">Top những địa điểm nổi bật</h2>
                </div>
                <div class = "featured-row">
                    <% foreach (var diadiem in getTopDiaDiemNoiBat) {%> 
                        <div class = "featured-item my-2 shadow">
                            <img src = "<% Response.Write(diadiem.DuongDan); %>" alt = "featured place">
                            <div class = "featured-item-content">
                                <a href="/BaiViet.aspx?Id=<% Response.Write(diadiem.Id); %>">
                                    <span class="featured-item-title">
                                        <i class = "fas fa-map-marker-alt"></i>
                                         <% Response.Write(diadiem.TenDiaDiem); %>
                                    </span>
                                    <div>
                                        <p class = "text"><% Response.Write(diadiem.MoTaNgan); %></p>
                                    </div> 
                                </a>
                            </div>
                        </div>
                    <% } %> 
                </div>
            </div>
        </section> 
        <section id = "services" class = "py-4">
            <div class = "container">
                <div class = "title-wrap">
                    <span class = "sm-title">know about services that we offer</span>
                    <h2 class = "lg-title">Our services</h2>
                </div>

                <div class = "services-row">
                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-hotel"></i>
                        </span>
                        <h3>Luxurious Hotel</h3>
                        <p class = "text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem quo, totam repellat velit, dignissimos sequi error a minima architecto fugit nisi dolorum repellendus?</p>
                        <a href = "#" class = "btn">Read more</a>
                    </div>

                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-map-marked-alt"></i>
                        </span>
                        <h3>Trave Guide</h3>
                        <p class = "text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem quo, totam repellat velit, dignissimos sequi error a minima architecto fugit nisi dolorum repellendus?</p>
                        <a href = "#" class = "btn">Read more</a>
                    </div>

                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-money-bill"></i>
                        </span>
                        <h3>Suitable Price</h3>
                        <p class = "text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem quo, totam repellat velit, dignissimos sequi error a minima architecto fugit nisi dolorum repellendus?</p>
                        <a href = "#" class = "btn">Read more</a>
                    </div>
                </div>
            </div>
        </section> 
        <section id = "testimonials" class = "py-4">
            <div class = "container">
                <div class = "title-wrap">
                    <span class = "sm-title">what our clients say about us</span>
                    <h2 class = "lg-title">testimonials</h2>
                </div>

                <div class = "test-row">
                    <div class = "test-item">
                        <p class = "text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda blanditiis, asperiores, velit iste eos officiis tempora magni quaerat quo consectetur expedita cum recusandae facere nam voluptate minus iusto eum. Delectus!</p>
                        <div class = "test-item-info">
                            <img src = "/Resources/images/test-1.jpg" alt = "testimonial">
                            <div>
                                <h3>Kevin Wilson</h3>
                                <p class = "text">Trip to Brazil</p>
                            </div>
                        </div>
                    </div>

                    <div class = "test-item">
                        <p class = "text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed ut dolores tenetur harum deserunt. Maxime tenetur consectetur recusandae nobis fugit iusto natus quibusdam nulla!</p>
                        <div class = "test-item-info">
                            <img src = "/Resources/images/test-2.jpg" alt = "testimonial">
                            <div>
                                <h3>Ben Davis</h3>
                                <p class = "text">Trip to Maldives</p>
                            </div>
                        </div>
                    </div>

                    <div class = "test-item">
                        <p class = "text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quidem sapiente amet expedita quae autem deleniti quo magni numquam facilis soluta dicta, praesentium ipsum, quos optio sed quibusdam! Reprehenderit recusandae provident id nemo!</p>
                        <div class = "test-item-info">
                            <img src = "/Resources/images/test-3.jpg" alt = "testimonial">
                            <div>
                                <h3>Jaura Jones</h3>
                                <p class = "text">Trip to Thailand</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> 
        <section id = "video">
            <div class = "video-wrapper flex">
                <video loop>
                    <source src = "/Resources/videos/video-section.mp4" type = "video/mp4">
                </video>
                <button type = "button" id = "play-btn">
                    <i class = "fas fa-play"></i>
                </button>
            </div>
        </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
     <script>
        // play/pause video
        let video = document.querySelector('.video-wrapper video');
        document.getElementById('play-btn').addEventListener('click', () => {
            if(video.paused){
                video.play();
            } else {
                video.pause();
            }
        });
    </script>
</asp:Content>
