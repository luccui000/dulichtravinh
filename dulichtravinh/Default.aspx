﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="dulichtravinh.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Resources/css/fullpage.min.css" rel="stylesheet" />
    <link href="/Resources/css/gioithieu.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header class = "flex">
            <div class = "container">
                <div class = "header-title">
                    <h1>Cùng rời thành phố</h1>
                    <p>"Cùng rời thành phố", đến thăm địa điểm du lịch tỉnh Trà Vinh. Gần gủi, dễ thương, dễ xao xuyến nói lên tất cả về vùng đất và con người nơi đây!</p>
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
                    <% foreach (var diadiem in topDiaDiemNoiBat) {%> 
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
        <section id="services" class = "py-4">
            <div class = "container">
                <div class = "title-wrap">
                    <span class = "sm-title">Hiểu biết thêm về bản sắc của người dân Trà Vinh</span>
                    <h2 class = "lg-title">Được tóm gọn dưới đây</h2>
                </div>

                <div class = "services-row">
                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-hotel"></i>
                        </span>
                        <h3>Mang đậm bản sắc dân tộc</h3>
                        <p class = "text">Là du lịch khám phá bản sắc văn hóa của vùng đất gắn bó lâu đời của ba dân tộc Kinh, Khmer, Hoa với 142 ngôi chùa Khmer có kiến trúc độc đáo trãi khắp các huyện, thị xã, thành phố .</p>
                        <a href = "#" class = "btn">Xem thêm</a>
                    </div>

                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-map-marked-alt"></i>
                        </span>
                        <h3>Người dân nhiệt tình hiếu khách</h3>
                        <p class = "text">Khách đến nhà dù có công việc quan trọng hay chỉ thăm hỏi thì việc trước hết là chủ nhà trịnh trọng mời khách vào nhà ngồi vào ghế hoặc ngồi vào chỗ lịch sự nhất.</p>
                        <a href = "#" class = "btn">Xem thêm</a>
                    </div>

                    <div class = "services-item">
                        <span class = "services-icon">
                            <i class = "fas fa-money-bill"></i>
                        </span>
                        <h3>Chi phí hợp lý</h3>
                        <p class = "text">Các hàng quán bên đường xung quanh khu du lịch đa số họ là nông dân chất phác thật thà, các dịch vụ hầu như rất rẻ so với mặt bằng chung so với những địa điểm du lịch khác</p>
                        <a href = "#" class = "btn">Xem thêm</a>
                    </div>
                </div>
            </div>
        </section> 
        <section id = "testimonials" class = "py-4">
            <div class = "container">
                <div class = "title-wrap">
                    <span class = "sm-title">Những gì mà khách du lịch họ nói về các địa điểm du lịch Trà Vinh</span> 
                </div>

                <div class = "test-row">
                    <div class = "test-item">
                        <p class = "text">Người dân ở đây thân thiện, vui tươi, đặc biệt rất là hiếu khách luôn nha mọi người!</p>
                        <div class = "test-item-info">
                            <img src = "https://luccui000.github.io/luccui/user.jpeg" alt = "testimonial">
                            <div>
                                <h3>Minh Lực</h3> 
                            </div>
                        </div>
                    </div>

                    <div class = "test-item">
                        <p class = "text">Nghe sơ sơ thấy người ta bảo người Trà Vinh dễ thương lắm, những cũng chỉ nghĩ rằng bình thường thôi. Vậy mà đến miền Tây và ghé qua Trà Vinh rồi ta mới thấy con người nơi đây cưng quá à! Dễ gần quá luôn!!</p>
                        <div class = "test-item-info">
                            <img src = "/Resources/images/lam.jpg" alt = "testimonial">
                            <div>
                                <h3>Kim Lam</h3> 
                            </div>
                        </div>
                    </div>

                    <div class = "test-item">
                        <p class = "text">Người miền Tây nổi tiếng phóng khoáng, rộng rãi, ân cần chu đáo cực luôn, bụng dạ thật lòng muốn nói điều gì là nói ra điều ấy, không nói vòng vo tam quốc đâu nha!</p>
                        <div class = "test-item-info">
                            <img src = "/Resources/images/thinh.jpg" alt = "testimonial">
                            <div>
                                <h3>Phước Thịnh</h3> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>           
        <section id = "video">
            <div class = "video-wrapper flex">
                <video loop>
                    <source src = "/Resources/videos/DienGioDuyenHai.mp4" type = "video/mp4">
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
