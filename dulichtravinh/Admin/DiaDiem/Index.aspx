<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="dulichtravinh.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <h5 class="card-header">Danh sách địa điểm</h5>  
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 d-flex justify-content-end">
                                <a class="btn btn-primary" href="/Admin/DiaDiem/Create.aspx">Thêm mới</a>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <asp:GridView runat="server" AutoGenerateColumns="false" ID="grvDiaDiem" CssClass="table table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="#" DataField="Id" /> 
                                        <asp:TemplateField HeaderText="Hình bìa" ControlStyle-CssClass="d-flex align-items-center">
                                            <ItemTemplate>
                                                <asp:Image Width="100" Height="100" ImageUrl='<%# Eval("DuongDan") %>' CssClass="img-thumbnail" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Tên địa điểm" DataField="TenDiaDiem" /> 
                                        <asp:BoundField HeaderText="Địa chỉ" DataField="DiaChi" />  
                                        <asp:TemplateField HeaderText="Ngày tạo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDOB" runat="server" Text='<%# Bind("NgayTao","{0:d}") %>'></asp:Label> 
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate> 
                                                <a class="btn btn-primary btn-sm" href='/Admin/DiaDiem/Update.aspx?Id=<%# Eval("Id") %>'>
                                                    <i class="fa fa-edit"></i>
                                                    <span>Sửa</span>
                                                </a> 
                                                <a class="btn btn-danger" href='/Admin/DiaDiem/Delete.aspx?Id=<%# Eval("Id") %>'>
                                                    <i class="fa fa-trash-alt"></i>
                                                    <span>Xóa</span>
                                                </a>
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
