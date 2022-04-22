<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="dulichtravinh.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard {
            display: flex; 
            justify-content: flex-end;
            text-align: right;
            flex-direction: column;
        }
        .dashboard-page {
            background-color: #32c5d2 !important;
            color: #fff;
        }
        .dashboard-post{
            background-color: #8e44ad !important;
            color: #fff;
        }
        .dashboard-user {
            background-color: #e7505a !important;
            color: #fff;
        }
        .dashboard-visitor {
            background-color: #3598dc !important;
            color: #fff;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <div class="dashboard card p-3 dashboard-page">
                    <h2><asp:Label ID="lblBinhLuan" runat="server"></asp:Label></h2>
                    <p>Bình luận</p>
                </div>
            </div>
            <div class="col-3">
                <div class="dashboard card p-3 dashboard-post">
                    <h2><asp:Label ID="lblBaiViet" runat="server"></asp:Label></h2>
                    <p>Bài viết</p>
                </div>
            </div>
            <div class="col-3">
                <div class="dashboard card p-3 dashboard-user">
                    <h2><asp:Label ID="lblKhachHang" runat="server"></asp:Label></h2>
                    <p>Người dùng</p>
                </div>
            </div>
            <div class="col-3">
                <div class="dashboard card p-3 dashboard-visitor">
                    <h2><asp:Label ID="lblKhachGheTham" runat="server"></asp:Label></h2>
                    <p>Khách ghé trong ngày</p>
                </div>
            </div> 
        </div>
        <div class="row mt-4">
            <div class="col-12">
                <div class="card">
                    <h4 class="card-header">Lưu lượng truy cập</h4> 
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <canvas id="myChart" style="width:100%;"></canvas> 
                            </div> 
                            <div class="col-6">

                            </div> 
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-6">
                <div class="card">
                    <h4 class="card-header">Bài viết gần đây</h4>
                    <div class="card-body">

                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <h4 class="card-header">Top bài viết được xem nhiều nhất</h4>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>URL</th>
                                    <th>Lượt xem</th>
                                </tr> 
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        1
                                    </td>
                                    <td>
                                        <a href="#">Lễ hội Ok om bok</a>
                                    </td>
                                    <td>
                                        880 lượt
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        2
                                    </td>
                                    <td>
                                        <a href="#">Ba Động - Bãi biển đẹp nhất xứ Trà Vinh</a>
                                    </td>
                                    <td>
                                        612 lượt
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        3
                                    </td>
                                    <td>
                                        <a href="#">Lễ hội Đua Ghe Ngo</a>
                                    </td>
                                    <td>
                                        99 lượt
                                    </td> 
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                </div>
                <asp:GridView runat="server" ID="grTop"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"> </script>
    <script>
        $(document).ready(function () {
            var xValues = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
            new Chart("myChart", {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                        data: [860, 1140, 1060, 1060, 1070, 1110, 1330, 2210, 7830, 2478],
                        borderColor: "red",
                        fill: false,
                        label: 'Khách ghé thăm'
                    }, {
                        data: [1600, 1700, 1700, 1900, 2000, 2700, 4000, 5000, 6000, 7000],
                        borderColor: "green",
                        fill: false,
                        label: 'Lượt xem'
                        }
                    ]
                },
                options: {
                    legend: {display: false}
                }
            });
        })
    </script>
</asp:Content>
