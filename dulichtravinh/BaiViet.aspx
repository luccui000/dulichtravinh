<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="BaiViet.aspx.cs" Inherits="dulichtravinh.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        #post {
            display: flex;
        } 
        .form-group {
            margin-bottom: 10px;
        }
        #content_txtComment { 
            width: 100%;
            max-width: 1320px;
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
    <div id="post"> 
        <p><asp:Label ID="lblMoTa" Text="" runat="server" /></p> 
        <div class="container"> 
            <div class="comment mt-3">
                <div class="form-group">
                    <label>Nội dung</label>
                    <asp:TextBox id="txtComment" runat="server" TextMode="MultiLine" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
