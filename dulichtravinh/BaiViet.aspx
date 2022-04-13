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
            width: 100%;
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

        <p><asp:Label ID="lblMoTa" Text="" runat="server" /></p>  
        <div class="comment mt-3">
            <div class="form-group">
                <label>Nội dung</label>
                <asp:HiddenField ID="txtDiaDiemId" Value="" runat="server" />
                <asp:TextBox id="txtComment" runat="server" TextMode="MultiLine" />
            </div> 
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
