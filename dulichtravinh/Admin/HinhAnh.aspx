<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HinhAnh.aspx.cs" Inherits="dulichtravinh.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row mb-2">  
            <div class="col-9 d-flex justify-content-end">
                <a href="#" class="btn btn-default" data-toggle="modal" data-target="#uploadHinhAnh">
                    <i class="fa fa-upload"></i>
                    <span>Tải lên</span>
                </a>
                <a href="#" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                    <span>Xóa ảnh</span>
                </a>
            </div>
            <div class="col-3"></div>
        </div>
        <div class="row">
            <div class="col-9">
                <div class="card">
                    <h5 class="card-header">Danh sach hinh anh</h5>
                    <div class="card-body">  
                        <% foreach (var parent in getHinhAnh) { %>
                            <div class="row">
                                <% foreach (var child in parent) { %>
                                    <div class="col-3 mb-2">
                                        <img class="rounded hinhanh" src="<% Response.Write(child.DuongDan); %>" alt="<% Response.Write(child.TenHinhAnh); %>" />
                                    </div> 
                                <% } %>
                            </div> 
                        <% } %> 
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card">
                    <h5 class="card-header">Thong tin ve hinh anh</h5>
                    <div class="card-body"></div>
                </div>
            </div>
        </div>
        <div class="modal fade bd-example-modal-lg" id="uploadHinhAnh" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm hình ảnh</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txtTenHinhAnh">Tên hình ảnh</label>
                        <asp:TextBox ID="txtTenHinhAnh" CssClass="form-control" runat="server"></asp:TextBox> 
                    </div>
                    <div class="form-group">
                        <label for="txtTenHinhAnhTiengAnh">Tên hình ảnh(bản tiếng anh)</label>
                        <asp:TextBox ID="txtTenHinhAnhTiengAnh" CssClass="form-control" runat="server"></asp:TextBox> 
                    </div>
                    <div class="row">
                        <div class="col-5">
                            <div class="form-group">
                                <label for="MoTa">Mô tả hình ảnh</label>
                                <asp:TextBox TextMode="MultiLine" ID="txtMoTa" CssClass="form-control" runat="server"></asp:TextBox> 
                            </div>  
                        </div>
                        <div class="col-2 d-flex align-items-center justify-content-center"> 
                            <asp:Button CssClass="btn btn-primary" Text="Dịch" runat="server" ID="btnTranslate" OnClientClick="return false;" /> 
                        </div>
                        <div class="col-5">
                            <div class="form-group">
                                <label for="txtMoTaTiengAnh">Mô tả hình ảnh (bản tiếng anh)</label>
                                <asp:TextBox TextMode="MultiLine" ID="txtMoTaTiengAnh" CssClass="form-control" runat="server"></asp:TextBox> 
                            </div>  
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="fuDuongDan">Hình ảnh</label>
                        <div class="custom-file">
                            <asp:FileUpload CssClass="custom-file-input" ID="fuDuongDan" runat="server"/>
                            <label class="custom-file-label" for="fuDuongDan">Chọn hình ảnh</label>
                        </div>
                    </div>
                    <img class="preview" src="" alt="" />
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <asp:Button ID="btnLuuHinhAnh" CssClass="btn btn-primary" runat="server" Text="Lưu" OnClick="btnLuuHinhAnh_Click" />
                </div>
            </div>
            </div>
        </div>
    </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="script" ID="script">
    <script>
        const prefix = "content";
        $(document).ready(function () {
            $(`#${prefix}_fuDuongDan`).change(function () {
                const [file] = $(`#${prefix}_fuDuongDan`).prop("files"); 
                if (file) {
                    $(".preview").attr("src", URL.createObjectURL(file));
                }
            })
            $(`#${prefix}_btnTranslate`).click(function () {
                const inputMoTa = $(`#${prefix}_txtMoTa`).val(); 
                const inputTenHinhAnh = $(`#${prefix}_txtTenHinhAnh`).val(); 
                $.ajax({
                    url: "/Services/HinhAnh.asmx/ThemMoi", 
                    type: "POST",
                    data: '{ TenHinhAnh: "' + inputTenHinhAnh + '", MoTa: "' + inputMoTa + '" }',
                    contentType: "application/json; charset=UTF-8",
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        const { MoTa, TenHinhAnh } = JSON.parse(response.d);
                         
                        $(`#${prefix}_txtTenHinhAnhTiengAnh`).val(TenHinhAnh);
                        $(`#${prefix}_txtMoTaTiengAnh`).val(MoTa);
                    }
                })
            })
        })
    </script>
</asp:Content>