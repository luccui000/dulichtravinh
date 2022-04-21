<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="dulichtravinh.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table tbody tr td {
            border-top: 1px solid transparent;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab">Chưa duyệt</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab">Đã duyệt</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="noibat-tab" data-toggle="tab" href="#noibat" role="tab" >Nổi bật</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" >Tất cả</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <%--  Chưa duyệt --%>
                            <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <asp:GridView ID="grvBinhLuanChuaDuyet"  CssClass="table table-bordered" runat="server" AutoGenerateColumns="false" >
                                    <Columns>
                                        <asp:BoundField HeaderText="Tên người bình luận" DataField="TenHienThi" />
                                        <asp:TemplateField HeaderText="Bài viết">
                                            <ItemTemplate>
                                                <a href="#"><%# Eval("TenDiaDiem") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Nội dung bình luận" DataField="NoiDungBinhLuan" />
                                        <asp:BoundField HeaderText="Ngày bình luận" DataField="NgayTao" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Eval("Id") %>' runat="server" OnClick="lnkEdit_Click" CssClass="btn btn-primary btn-sm">
                                                    Duyệt
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="lnkDelete" CommandArgument='<%# Eval("Id") %>' runat="server" CssClass="btn btn-danger btn-sm">
                                                    Xóa 
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%-- Đã duyệt --%>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                <asp:GridView ID="grvBinhLuanDaDuyet"  CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Tên người bình luận" DataField="TenHienThi" />
                                        <asp:TemplateField HeaderText="Bài viết">
                                            <ItemTemplate>
                                                <a href="#"><%# Eval("TenDiaDiem") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Nội dung bình luận" DataField="NoiDungBinhLuan" />
                                        <asp:BoundField HeaderText="Ngày bình luận" DataField="NgayTao" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="tab-pane fade" id="noibat" role="tabpanel" >
                                <asp:GridView ID="grvNoiBat"  CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Tên người bình luận" DataField="TenHienThi" />
                                        <asp:TemplateField HeaderText="Bài viết">
                                            <ItemTemplate>
                                                <a href="#"><%# Eval("TenDiaDiem") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Nội dung bình luận" DataField="NoiDungBinhLuan" />
                                        <asp:BoundField HeaderText="Ngày bình luận" DataField="NgayTao" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%-- Tất cả --%>
                            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <asp:GridView ID="grvBinhLuan"  CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Tên người bình luận" DataField="TenHienThi" />
                                        <asp:TemplateField HeaderText="Bài viết">
                                            <ItemTemplate>
                                                <a href="#"><%# Eval("TenDiaDiem") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Nội dung bình luận" DataField="NoiDungBinhLuan" />
                                        <asp:BoundField HeaderText="Ngày bình luận" DataField="NgayTao" />
                                        <asp:TemplateField>
                                            <ItemTemplate> 
                                                <asp:LinkButton ID="btnThemBLNoiBat" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="btnThemBLNoiBat_Click" CssClass="btn btn-primary" >Thêm vào bình luận nổi bật</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
