﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="dulichtravinh.Default2" %>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="shortcut icon" href="./Resources/img/favicon.png" type="image/png"> 
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet"> 
        <link rel="stylesheet" href="./Resources/css/swiper-bundle.min.css"> 
        <link rel="stylesheet" href="./Resources/css/styles.css"> 
        <title>Du lịch Trà Vinh</title>
    </head>
    <body>
        <form runat="server" id="form"> 
            <header class="header" id="header">
                <nav class="nav container">
                    <a href="#" class="nav__logo">.TRA VINH</a> 
                    <div class="nav__menu" id="nav-menu">
                        <ul class="nav__list">
                            <li class="nav__item">
                                <a href="#home" class="nav__link active-link">Trang chủ</a>
                            </li>
                            <li class="nav__item">
                                <a href="#about" class="nav__link">Địa điểm</a>
                            </li>
                            <li class="nav__item">
                                <a href="#discover" class="nav__link">Dịch vụ</a>
                            </li>
                            <li class="nav__item">
                                <a href="#contact" class="nav__link">Liên hệ</a>
                            </li>
                        </ul>

                        <div class="nav__dark"> 
                            <span class="change-theme-name">Dark mode</span>
                            <i class="ri-moon-line change-theme" id="theme-button"></i>
                        </div>

                        <i class="ri-close-line nav__close" id="nav-close"></i>
                    </div>

                    <div class="nav__toggle" id="nav-toggle">
                        <i class="ri-function-line"></i>
                    </div>
                </nav>
            </header>

            <main class="main"> 
                <section class="home" id="home">
                    <img src="./Resources/img/home1.jpg" alt="" class="home__img">

                    <div class="home__container container grid">
                        <div class="home__data">
                            <span class="home__data-subtitle">Vòng quanh Trà Vinh</span>
                            <h1 class="home__data-title">Khám phá<br> <b>Cảnh đẹp<br></b></h1>
                            <a href="#" class="button">Khám phá ngay</a> 
                        </div>  
                        <div class="home__info">
                            <div>
                                <span class="home__info-title">5 địa điểm nổi bật bạn nên ghé thăm</span>
                                <a href="" class="button button--flex button--link home__info-button">
                                    Thêm <i class="ri-arrow-right-line"></i>
                                </a>
                            </div>

                            <div class="home__info-overlay">
                                <img src="./Resources/img/home2.jpg" alt="" class="home__info-img">
                            </div>
                        </div>
                    </div>
                </section>

                <!--==================== ABOUT ====================-->
                <section class="about section" id="about">
                    <div class="about__container container grid">
                        <div class="about__data">
                            <h2 class="section__title about__title">Thông tin về<br> Bãi biển Ba Động</h2>
                            <p class="about__description">Biển Ba Động là danh thắng và địa điểm du lịch Trà Vinh nổi tiếng thuộc địa phận xã Trường Long Hoà, huyện Duyên Hải. 
                                Bãi biển Ba Động mang vẻ đẹp hoang sơ với triền cát trải dài bên hàng dương rì rào theo gió, được mệnh danh là bãi biển đẹp nhất xứ Trà Vinh
                            </p>
                            <a href="#" class="button">Tìm hiểu thêm</a>
                        </div>

                        <div class="about__img">
                            <div class="about__img-overlay">
                                <img src="./Resources/img/about1.jpg" alt="" class="about__img-one">
                            </div>

                            <div class="about__img-overlay">
                                <img src="./Resources/img/about2.jpg" alt="" class="about__img-two">
                            </div>
                        </div>
                    </div>
                </section>
             
                <section class="discover section" id="discover">
                    <h2 class="section__title">Xem ngay địa điểm <br> nổi bật nhất</h2>    
                    <div class="discover__container container swiper-container">
                        <div class="swiper-wrapper"> 
                            <div class="discover__card swiper-slide">
                                <img src="./Resources/img/discover1.jpg" alt="" class="discover__img">
                                <div class="discover__data">
                                    <h2 class="discover__title">Biển ba động</h2>
                                    <span class="discover__description">240 lượt thăm</span>
                                </div>
                            </div> 
                            <div class="discover__card swiper-slide">
                                <img src="./Resources/img/discover2.jpg" alt="" class="discover__img">
                                <div class="discover__data">
                                    <h2 class="discover__title">Ao bà om</h2>
                                    <span class="discover__description">150 lượt thăm</span>
                                </div>
                            </div> 
                            <div class="discover__card swiper-slide">
                                <img src="./Resources/img/discover3.jpg" alt="" class="discover__img">
                                <div class="discover__data">
                                    <h2 class="discover__title">Điện gió Duyên Hải</h2>
                                    <span class="discover__description">180 lượt thăm</span>
                                </div>
                            </div> 
                            <div class="discover__card swiper-slide">
                                <img src="./Resources/img/discover4.jpg" alt="" class="discover__img">
                                <div class="discover__data">
                                    <h2 class="discover__title">Chùa cò</h2>
                                    <span class="discover__description">32 lượt ghé</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section> 
                <section class="experience section">
                    <h2 class="section__title">With Our Experience <br> We Will Serve You</h2>

                    <div class="experience__container container grid">
                        <div class="experience__content grid">
                            <div class="experience__data">
                                <h2 class="experience__number">20</h2>
                                <span class="experience__description">Year <br> Experience</span>
                            </div>

                            <div class="experience__data">
                                <h2 class="experience__number">75</h2>
                                <span class="experience__description">Complete <br> tours</span>
                            </div>

                            <div class="experience__data">
                                <h2 class="experience__number">650+</h2>
                                <span class="experience__description">Tourist <br> Destination</span>
                            </div>
                        </div>

                        <div class="experience__img grid">
                            <div class="experience__overlay">
                                <img src="./Resources/img/experience1.jpg" alt="" class="experience__img-one">
                            </div>
                        
                            <div class="experience__overlay">
                                <img src="./Resources/img/experience2.jpg" alt="" class="experience__img-two">
                            </div>
                        </div>
                    </div>
                </section> 
                <section class="video section">
                    <h2 class="section__title">Video Tour</h2>

                    <div class="video__container container">
                        <p class="video__description">Find out more with our video of the most beautiful and 
                            pleasant places for you and your family.
                        </p>

                        <div class="video__content">
                            <video id="video-file">
                                <source src="./Resources/video/video.mp4" type="video/mp4">
                            </video>

                            <button class="button button--flex video__button" id="video-button">
                                <i class="ri-play-line video__button-icon" id="video-icon"></i>
                            </button>
                        </div>
                    </div>
                </section>
                 
                <section class="place section" id="place">
                    <h2 class="section__title">Choose Your Place</h2>

                    <div class="place__container container grid">
                        <!--==================== PLACES CARD 1 ====================-->
                        <div class="place__card">
                            <img src="./Resources/img/place1.jpg" alt="" class="place__img">
                        
                            <div class="place__content">
                                <span class="place__rating">
                                    <i class="ri-star-line place__rating-icon"></i>
                                    <span class="place__rating-number">4,8</span>
                                </span>

                                <div class="place__data">
                                    <h3 class="place__title">Bali</h3>
                                    <span class="place__subtitle">Indonesia</span>
                                    <span class="place__price">$2499</span>
                                </div>
                            </div>

                            <button class="button button--flex place__button">
                                <i class="ri-arrow-right-line"></i>
                            </button>
                        </div>
                         
                        <div class="place__card">
                            <img src="./Resources/img/place2.jpg" alt="" class="place__img">
                        
                            <div class="place__content">
                                <span class="place__rating">
                                    <i class="ri-star-line place__rating-icon"></i>
                                    <span class="place__rating-number">5,0</span>
                                </span>

                                <div class="place__data">
                                    <h3 class="place__title">Bora Bora</h3>
                                    <span class="place__subtitle">Polinesia</span>
                                    <span class="place__price">$1599</span>
                                </div>
                            </div>

                            <button class="button button--flex place__button">
                                <i class="ri-arrow-right-line"></i>
                            </button>
                        </div>

                        <!--==================== PLACES CARD 3 ====================-->
                        <div class="place__card">
                            <img src="./Resources/img/place3.jpg" alt="" class="place__img">
                        
                            <div class="place__content">
                                <span class="place__rating">
                                    <i class="ri-star-line place__rating-icon"></i>
                                    <span class="place__rating-number">4,9</span>
                                </span>

                                <div class="place__data">
                                    <h3 class="place__title">Hawaii</h3>
                                    <span class="place__subtitle">EE.UU</span>
                                    <span class="place__price">$3499</span>
                                </div>
                            </div>

                            <button class="button button--flex place__button">
                                <i class="ri-arrow-right-line"></i>
                            </button>
                        </div>

                        <!--==================== PLACES CARD 4 ====================-->
                        <div class="place__card">
                            <img src="./Resources/img/place4.jpg" alt="" class="place__img">
                        
                            <div class="place__content">
                                <span class="place__rating">
                                    <i class="ri-star-line place__rating-icon"></i>
                                    <span class="place__rating-number">4,8</span>
                                </span>

                                <div class="place__data">
                                    <h3 class="place__title">Whitehaven</h3>
                                    <span class="place__subtitle">Australia</span>
                                    <span class="place__price">$2499</span>
                                </div>
                            </div>

                            <button class="button button--flex place__button">
                                <i class="ri-arrow-right-line"></i>
                            </button>
                        </div>

                        <!--==================== PLACES CARD 5 ====================-->
                        <div class="place__card">
                            <img src="./Resources/img/place5.jpg" alt="" class="place__img">
                        
                            <div class="place__content">
                                <span class="place__rating">
                                    <i class="ri-star-line place__rating-icon"></i>
                                    <span class="place__rating-number">4,8</span>
                                </span>

                                <div class="place__data">
                                    <h3 class="place__title">Hvar</h3>
                                    <span class="place__subtitle">Croacia</span>
                                    <span class="place__price">$1999</span>
                                </div>
                            </div>

                            <button class="button button--flex place__button">
                                <i class="ri-arrow-right-line"></i>
                            </button>
                        </div>
                    </div>
                </section>

                <!--==================== SUBSCRIBE ====================-->
                <section class="subscribe section" id="contact">
                    <div class="subscribe__bg">
                        <div class="subscribe__container container">
                            <h2 class="section__title subscribe__title">Subscribe Our <br> Newsletter</h2>
                            <p class="subscribe__description">Subscribe to our newsletter and get a 
                                special 30% discount.
                            </p>
    
                            <form action="" class="subscribe__form">
                                <input type="text" placeholder="Enter email" class="subscribe__input">
    
                                <button class="button">
                                    Subscribe
                                </button>
                            </form>
                        </div>
                    </div>
                </section>
            
                <!--==================== SPONSORS ====================-->
                <section class="sponsor section">
                    <div class="sponsor__container container grid">
                        <div class="sponsor__content">
                            <img src="./Resources/img/sponsors1.png" alt="" class="sponsor__img">
                        </div>
                        <div class="sponsor__content">
                            <img src="./Resources/img/sponsors2.png" alt="" class="sponsor__img">
                        </div>
                        <div class="sponsor__content">
                            <img src="./Resources/img/sponsors3.png" alt="" class="sponsor__img">
                        </div>
                        <div class="sponsor__content">
                            <img src="./Resources/img/sponsors4.png" alt="" class="sponsor__img">
                        </div>
                        <div class="sponsor__content">
                            <img src="./Resources/img/sponsors5.png" alt="" class="sponsor__img">
                        </div>
                    </div>
                </section>
            </main>

            <!--==================== FOOTER ====================-->
            <footer class="footer section">
                <div class="footer__container container grid">
                    <div class="footer__content grid">
                        <div class="footer__data">
                            <h3 class="footer__title">Travel</h3>
                            <p class="footer__description">Travel you choose the <br> destination, 
                                we offer you the <br> experience.
                            </p>
                            <div>
                                <a href="https://www.facebook.com/" target="_blank" class="footer__social">
                                    <i class="ri-facebook-box-fill"></i>
                                </a>
                                <a href="https://twitter.com/" target="_blank" class="footer__social">
                                    <i class="ri-twitter-fill"></i>
                                </a>
                                <a href="https://www.instagram.com/" target="_blank" class="footer__social">
                                    <i class="ri-instagram-fill"></i>
                                </a>
                                <a href="https://www.youtube.com/" target="_blank" class="footer__social">
                                    <i class="ri-youtube-fill"></i>
                                </a>
                            </div>
                        </div>
    
                        <div class="footer__data">
                            <h3 class="footer__subtitle">About</h3>
                            <ul>
                                <li class="footer__item">
                                    <a href="" class="footer__link">About Us</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Features</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">New & Blog</a>
                                </li>
                            </ul>
                        </div>
    
                        <div class="footer__data">
                            <h3 class="footer__subtitle">Company</h3>
                            <ul>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Team</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Plan y Pricing</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Become a member</a>
                                </li>
                            </ul>
                        </div>
    
                        <div class="footer__data">
                            <h3 class="footer__subtitle">Support</h3>
                            <ul>
                                <li class="footer__item">
                                    <a href="" class="footer__link">FAQs</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Support Center</a>
                                </li>
                                <li class="footer__item">
                                    <a href="" class="footer__link">Contact Us</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="footer__rights">
                        <p class="footer__copy">&#169; 2021 Bedimcode. All rigths reserved.</p>
                        <div class="footer__terms">
                            <a href="#" class="footer__terms-link">Terms & Agreements</a>
                            <a href="#" class="footer__terms-link">Privacy Policy</a>
                        </div>
                    </div>
                </div>
            </footer> 
        </form> 
        <a href="#" class="scrollup" id="scroll-up"> <i class="ri-arrow-up-line scrollup__icon"></i> </a> 
        <script src="./Resources/js/scrollreveal.min.js"></script> 
        <script src="./Resources/js/swiper-bundle.min.js"></script> 
        <script src="./Resources/js/main.js"></script>
    </body>
</html>