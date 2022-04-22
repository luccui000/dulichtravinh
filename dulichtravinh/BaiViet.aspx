<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="BaiViet.aspx.cs" Inherits="dulichtravinh.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>  
        .post-container {
            width: 100%;
            max-width: 1320px;
            min-height: 100%;
            margin: 0 auto;
            padding: 10px 20px;
        }
        .form-group {
            margin-bottom: 10px;
            display: flex;
            flex-direction: column; 
        }
        .form-group label {
            margin-bottom: 10px;
        }
        .form-group input,
        .form-group textarea {
            width: 500px;
            max-width: 1320px;
            border: 2px solid #ccc;
            padding: 10px;
            border-radius: 4px;
            transition: border-color .2s linear;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--green); 
        } 
        .line {
            width: 522px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
            position: relative;
        } 
        .post-comments { 
            width: 523px;
            list-style: none;
            margin: 0;
            padding: 0;
            margin-bottom: 20px;
        }
        .post-comment-item {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin: 10px 0;  
            padding: 5px; 
        }
        .post-comment-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            object-position: center;
            margin-right: 30px;
        }
        .post-comment-content {
            width: 100%;
            border-bottom: 1px dashed #ccc;
        }
        .post-comment-content p {
            font-size: 10px;
        }
        .iframe iframe {
            width: 100%;
        }
        .hashtag {
            margin: 10px 0;
            padding: 0;
        }
        .hashtag-item {
            display: inline-block;
        }
        .hashtag-link {
            color: var(--green);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header class = "flex header-sm">
        <div class = "container">
            <div class = "header-title">
                <h1>
                    <asp:Label ID="lblTenDiaDiem" Text="" runat="server" />
                </h1>
                <p>
                    <asp:Label ID="lblMoTaNgan" Text="" runat="server" />
                </p>
            </div>
        </div>
    </header>
    <div class="post-container">  
        <ul class="hashtag">
            <% foreach (var tag in danhSachHashTag) { %>
                <li class="hashtag-item"><a class="hashtag-link" href="#">#<% Response.Write(tag.TenTag); %></a></li>
            <% } %>  
        </ul>
        
        <p><asp:Label ID="lblMoTa" Text="" runat="server" /></p>  
        <p><asp:Label ID="lblIframe" CssClass="iframe" runat="server" /></p>
        <div class="line"></div>
        <h3>Bình luận</h3>
        <ul class="post-comments"> 
            <% foreach (var binhluan in danhSachBinhLuan) {%>
                <li class="post-comment-item">
                    <div>
                        <img class="post-comment-img" src="/Resources/images/blog-2.jpg" alt="Alternate Text" />
                    </div>
                    <div class="post-comment-content">
                        <span><% Response.Write(binhluan.NoiDungBinhLuan); %></span>
                        <p><% Response.Write(binhluan.NgayTao); %></p>
                    </div>
                </li> 
            <% } %>
        </ul>
        <div class="comment mt-3">
            <div class="form-group">
                <label>Nội dung</label>
                <asp:HiddenField ID="txtDiaDiemId" Value="" runat="server" />
                <asp:TextBox id="txtComment" runat="server" TextMode="MultiLine" />
            </div> 
            <div>
                <% if (Session["access_token"] == null) {%>  
                    <asp:LinkButton ID="loginWithGoogle" runat="server" CssClass="btn btn-danger btn-sm" Width="240px" OnClick="loginWithGoogle_click">
                        <i class="fab fa-google"></i> 
                        <span style="margin-left: 10px">Đăng nhập bằng Google</span> 
                    </asp:LinkButton> 
                
                <% } else { %>
                    <asp:Button ID="btnComment" CssClass="btn btn-primary btn-sm" Text="Gửi" runat="server" OnClick="btnComment_Click" />
                <% } %>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
