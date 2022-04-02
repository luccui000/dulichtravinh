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
                                <a class="btn btn-primary" href="#">Thêm mới</a>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <asp:GridView runat="server" ID="grvDiaDiem" CssClass="table table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="#" DataField="Id" />
                                        <asp:BoundField HeaderText="Hình bìa" DataField="HinhAnhId" />
                                        <asp:BoundField HeaderText="Tên địa điểm" DataField="TenDiaDiem" /> 
                                        <asp:BoundField HeaderText="Địa chỉ" DataField="DiaChi" /> 
                                        <asp:BoundField HeaderText="Ngày tạo" DataField="NgayTao" /> 
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
