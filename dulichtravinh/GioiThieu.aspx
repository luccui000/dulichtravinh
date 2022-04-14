<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="GioiThieu.aspx.cs" Inherits="dulichtravinh.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Resources/css/fullpage.min.css" rel="stylesheet" />
    <link href="/Resources/css/gioithieu.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div id="fullpage">
        <section class="section s1">
            <h1>Home Decoration</h1>
        </section>
        <section class="section s2">
            <h1>Different Styles</h1>
            <div class="description">
                <p>
                    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Non nam
            inventore illum! Libero nisi optio consequuntur tenetur soluta
            debitis
                </p>
                <p>
                    saepe eligendi, dicta velit at quod dolores asperiores facilis
            nostrum eius molestias et maxime earum? Tenetur nam magni quae
            tempore beatae rerum impedit quasi id iste sapiente, amet asperiores
            maxime eius.
                </p>
            </div>
            <img src="/Resources/images/chair2.png" class="chair c2" />
            <img src="/Resources/images/chair3.png" class="chair c1" />
            <img src="/Resources/images/chair1.png" class="chair c3" />
        </section>
        <section class="section s3">
            <h1>Amazing Quality</h1>
        </section>
        <section class="section s4">
            <h1>Page4</h1>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TimelineMax.min.js" integrity="sha256-fIkQKQryItPqpaWZbtwG25Jp2p5ujqo/NwJrfqAB+Qk=" crossorigin="anonymous" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js" integrity="sha256-lPE3wjN2a7ABWHbGz7+MKBJaykyzqCbU96BJWjio86U=" crossorigin="anonymous" ></script>
    <script src="/Resources/js/fullpage.min.js"></script>
    <script src="/Resources/js/gioithieu.js"></script>
</asp:Content>
