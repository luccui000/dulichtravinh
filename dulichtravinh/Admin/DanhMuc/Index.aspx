<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="dulichtravinh.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <ul class="list-group">
                            <% foreach (var danhMuc in GetDanhMucs) {%> 
                                <a class="list-group-item" href="/Admin/DanhMuc/Index.aspx?Id=<% Response.Write(danhMuc.Id); %>"><% Response.Write(danhMuc.TenDanhMuc); %></a>
                            <% } %> 
                        </ul> 
                    </div>
                </div>
            </div>
            <div class="col-9"> 
                <div class="card">
                    <div class="card-body p-2">
                        <div class="form-group">
                            <asp:Label AssociatedControlID="txtTenDanhMuc" Text="Tên danh mục" runat="server" />
                            <asp:TextBox ID="txtTenDanhMuc" CssClass="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Danh mục cha" runat="server" />
                            <asp:DropDownList runat="server" ID="ddDanhMucChaId" CssClass="form-control custom-select">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label Text="Mô tả ngắn" runat="server" />
                            <asp:TextBox ID="txtMoTa" CssClass="form-control" TextMode="MultiLine" runat="server" ></asp:TextBox>
                        </div>
                        <div class="form-group ml-1"> 
                            <asp:CheckBox ID="chbTrangThai" runat="server" CssClass="" />   
                            <label class="" for="content_chbTrangThai">Hiển thị</label>
                        </div> 
                        <div class="card mt-2">
                            <h5 class="card-header">Công bố</h5>
                            <div class="card-body py-2">
                                <asp:HiddenField runat="server" ID="txtDanhMucId" />
                                <asp:Button ID="btnSave" Text="Lưu" CssClass="btn btn-primary" runat="server" />
                                <asp:Button ID="btnSaveAndEdit" Text="Lưu và tiếp tục" CssClass="btn btn-success" runat="server" OnClick="btnSaveAndEdit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script> 
    <script>
        $(document).ready(function () {
            $("#btnToast").click(function () {
                showToast();
            })
        })
        function showToast() {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": true,
                "preventDuplicates": false,
                "positionClass": "toast-top-right",
                "showDuration": "400",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr["success"]("This is a message"); 
        }
    </script>
</asp:Content>
