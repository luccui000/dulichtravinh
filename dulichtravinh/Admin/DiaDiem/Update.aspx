<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="dulichtravinh.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Resources/css/ckeditor.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-9"> 
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <h5 class="card-header">Thêm mới thông tin địa điểm</h5>
                            <div class="card-body p-2">
                                <asp:HiddenField ID="txtDiaDiemId" runat="server" />
                                <div class="form-group">
                                    <label for="txtTenDiaDiem">Tên địa điểm</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Tên địa điểm" ID="txtTenDiaDiem" name="TenDiaDiem" runat="server"></asp:TextBox> 
                                </div>
                                <div class="form-group">
                                    <label for="txtTenDiaDiemTiengAnh">Tên địa điểm (bản tiếng anh)</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Tên địa điểm (bản tiếng anh)" ID="txtTenDiaDiemTiengAnh" runat="server"></asp:TextBox> 
                                </div>
                                <div class="form-group">
                                    <label>Mô tả ngắn về địa điểm</label>
                                    <asp:TextBox ID="txtMoTaNgan" TextMode="MultiLine" placeholder="Mô tả ngắn về địa điểm" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Mô tả ngắn về địa điểm</label>
                                    <asp:TextBox ID="txtMoTaNganTiengAnh" TextMode="MultiLine" placeholder="Mô tả ngắn về địa điểm" CssClass="form-control" runat="server" />
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group position-relative">
                                            <asp:Label Text="Nhập link iframe" AssociatedControlID="txtIFrame" runat="server" />
                                            <asp:TextBox ID="txtIFrame" TextMode="MultiLine" placeholer="Nhập iframe" Rows="5" CssClass="form-control" placeholder="Nhập link iframe" runat="server" />
                                            <button type="button" class="btn position-absolute" style="top: 30px; right: 0px;" data-toggle="modal" data-target="#helpGetIframe" >
                                                <i class="fa fa-circle-question"></i>
                                            </button>
                                        </div> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <asp:Label Text="Kinh độ" runat="server" /> 
                                            <asp:TextBox CssClass="form-control" placeholder="Kinh độ" ID="txtKinhDo" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group"> 
                                            <asp:Label Text="Vĩ độ" runat="server" />
                                            <asp:TextBox CssClass="form-control" placeholder="Vĩ độ" ID="txtViDo" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <asp:Label Text="Địa chỉ" runat="server" />
                                            <asp:TextBox CssClass="form-control" placeholder="Địa chỉ" ID="txtDiaChiText" runat="server"></asp:TextBox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <asp:Label Text="Mô tả địa điểm" runat="server" />
                                            <asp:TextBox placeholder="Mô tả địa điểm" TextMode="MultiLine" ID="txtMoTa" Rows="10"  CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <asp:Label Text="Mô tả địa điểm (bản tiếng anh)" runat="server" />
                                            <asp:TextBox placeholder="Mô tả địa điểm (bản tiếng anh)" TextMode="MultiLine" ID="txtMoTaTiengAnh" Rows="10" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div id="googlemaps-iframe"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <h5 class="card-header">Hành động</h5>
                            <div class="card-body">
                                <asp:Button ID="btnGet" CssClass="btn btn-primary btnSource" Text="Dịch bài" OnClientClick="return false;" runat="server" /> 
                                <asp:Button type="button" ID="btnSaveAndContinue" Text="Lưu và tiếp tục" CssClass="btn btn-primary" runat="server" OnClick="btnSaveAndContinue_Click"/> 
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <div class="card">
                            <h5 class="card-header">Thêm ảnh bìa</h5>
                            <div class="card-body"> 
                                <div class="row">
                                    <div class="col-12">
                                        <button class="select-image" type="button" data-toggle="modal" data-target="#setImageThumbnail">  
                                            <i class="fa fa-plus"></i>
                                        </button> 
                                    </div>
                                </div>
                                <asp:HiddenField ID="txtHinhAnhId" runat="server" />
                                <div class="row">
                                    <div class="col-12">
                                        <asp:Button Text="Thêm mới" CssClass="btn btn-primary mt-2" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="setImageThumbnail" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Chọn ảnh thumbnail</h5> 
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"> 
                         <%--<% foreach (var parent in getHinhAnh) { %>
                            <div class="row">
                                <% foreach (var child in parent) { %> 
                                    <div class="col-3 mb-2">  
                                        <img 
                                            class="rounded w-100 h-100 hinhanh" 
                                            data-id="<% Response.Write(child.Id); %>" 
                                            src="<% Response.Write(child.DuongDan); %>" 
                                            alt="<% Response.Write(child.TenHinhAnh); %>" />
                                    </div> 
                                <% } %>
                            </div> 
                        <% } %> --%>
                    </div> 
                </div> 
            </div>
        </div> 
        <div class="modal fade" id="helpGetIframe" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Hướng dẫn lấy iframe địa điểm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <p><b>Bước 1: </b>Vào <a href="https://www.google.com/maps">Google Maps</a> tìm kiếm địa điểm</p> 
                                <img class="w-100" src="../../Resources/img/NhapDiaDiem.png" alt="Alternate Text" /> 
                                <p class="mt-2"><b>Bước 2: </b>Ấn vào địa điểm hiển thị trên bản đồ, sau đó chọn nút share bên trái</p> 
                                <img class="w-100" src="../../Resources/img/NhanVaoNutShare.png" alt="Alternate Text" /> 
                                <p class="mt-2"><b>Bước 3: </b>Hộp thoại xuất hiện, bạn chọn Embed a map, sau đó nhấn vào chữ Copy Link để sao chép iframe</p> 
                                <img class="w-100" src="../../Resources/img/LayIFrame.png" alt="Alternate Text" /> 
                            </div>
                        </div>
                    </div> 
                </div> 
            </div>
        </div> 
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script> 
    <script>
        function initMap() {
            const latLog = { lat: 21.0168864, lng: 105.7855574 };
            const geoCoder = google.maps.Geocoder;
            const infoWindow = google.maps.InfoWindow();

            geoCoder.geocode({
                "location": latLog
            }, function (result, status) {
                console.log(result)
            }) 
        }
    </script>
    <%--<script async defer src="https://maps.googleapis.com/maps/api/js?key=<% Response.Write(getGoogleMapAPIKey); %>&callback=initMap"></script>--%>
    <script> 
        // Upload hinh anh: https://stackoverflow.com/questions/46765197/how-to-enable-image-upload-support-in-ckeditor-5
        $(document).ready(function () {
            const PREFIX = "content";
            const images = document.querySelectorAll(".hinhanh"); 
            const DEBOUND_AJAX_TIMER = 500;
            var editors = [];

            createEditor('txtMoTa', '<% Response.Write(txtMoTa.Text); %>')
            createEditor('txtMoTaTiengAnh', '<% Response.Write(txtMoTaTiengAnh.Text); %>')
            images.forEach(image => image.addEventListener("click", handleSetImageThumbnail)); 
            $(`#${PREFIX}_btnGet`).click(translateDiaDiem)
            $(`#${PREFIX}_txtIFrame`).keyup(window.deboundAjax(handleGetGeoGraphicIframe, DEBOUND_AJAX_TIMER))
             
            function createEditor(elementId, data) {
                return ClassicEditor
                    .create(document.querySelector(`#${PREFIX}_${elementId}`))
                    .then(editor => {
                        editors[elementId] = editor;
                        editor.setData(data); 
                        editors[elementId].model.document.on('change:data', function () {   
                            $(`#${PREFIX}_${elementId}`).text(editors[elementId].getData())
                        })
                    })
                    .catch(err => console.error(err));
            }
            
            function translateDiaDiem() {
                const inputTenDiaDiem = $(`#${PREFIX}_txtTenDiaDiem`).val() || "";
                const inputMota = $(`#${PREFIX}_txtMoTa`).val() || "";
                const translateTenDiaDiem = $.ajax({
                    url: "/Services/DichVanBan.asmx/Dich",
                    type: "POST",
                    data: '{ input: "' + inputTenDiaDiem + '" }',
                    contentType: "application/json; charset=UTF-8",
                    processData: false,
                    dataType: "json"
                })
                const translateMoTa = $.ajax({
                    url: "/Services/DichVanBan.asmx/Dich",
                    type: "POST",
                    data: '{ input: "' + inputMota + '" }',
                    contentType: "application/json; charset=UTF-8",
                    processData: false,
                    dataType: "json"
                }) 
                $.when(translateTenDiaDiem, translateMoTa).done(function (res1, res2) {
                    if (res1[0].d !== "") { 
                        $(`#${PREFIX}_txtTenDiaDiemTiengAnh`).val(JSON.parse(res1[0].d).Text); 
                    }
                    if (res2[0].d !== "") {
                        $(`#${PREFIX}_txtMoTaTiengAnh`).text(JSON.parse(res2[0].d).Text);
                        editors['txtMoTaTiengAnh'].setData(JSON.parse(res2[0].d).Text)
                    }
                })
            } 
            function handleGetGeoGraphicIframe() {
                const iframeVal = $(`#${PREFIX}_txtIFrame`).val();   
                const pattern = /2d\d{1,10}.\d{1,20}!3d\d{1,10}.\d{1,20}/;
                const reg = new RegExp(pattern);
                if (iframeVal !== null || iframeVal !== "") {
                    const matches = reg.exec(iframeVal); 
                    const splited = matches[0].split('!'); 
                    if (splited.length > 1) {
                        const longtitude = splited[0].replace('2d', '');
                        const latitude = splited[1].replace('3d', ''); 
                        $(`#${PREFIX}_txtKinhDo`).val(latitude);
                        $(`#${PREFIX}_txtViDo`).val(longtitude); 
                    }
                }
            }
            function handleSetImageThumbnail(e) {
                let imageSelected = {
                    id: e.target.dataset.id,
                    src: e.target.src
                };
                $("#setImageThumbnail").modal("hide");
                $(".select-image").css({
                    "background-image": `url(${imageSelected.src})`,
                    'background-size': "100% auto"
                })
                $(".select-image i").css("color", "#fff");
                $(`#${PREFIX}_txtHinhAnhId`).val(imageSelected.id);
            }
        }) 
    </script>
</asp:Content>
