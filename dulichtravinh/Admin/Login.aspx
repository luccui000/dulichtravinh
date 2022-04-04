<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="dulichtravinh.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link  rel="stylesheet" href="Resources/css/root.css"/>
    <link  rel="stylesheet" href="Resources/css/custom.bootstrap.css"/>
    <link  rel="stylesheet" href="Resources/css/app.css"/>
    <style> 
        * {
            margin: 0;
            padding: 0;
        } 
        .main-form {
            background-color: rgba(255, 255, 255, 0.8);
            height: 100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
        <div class="w-50 mx-auto mt-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-uppercase">Đăng nhập quản trị viên</h3>
                    <div class="form-group">
                        <label >Tên đăng nhập</label>
                        <asp:TextBox ID="txtTenDangNhap" CssClass="form-control" runat="server" />
                    </div>
                    <div class="form-group">
                        <label >Mật khẩu</label>
                        <asp:TextBox ID="txtMatKhau" type="password" CssClass="form-control" runat="server" />
                    </div>
                    <asp:Button ID="btnDangNhap" CssClass="btn btn-primary btn-block" Text="Đăng nhập" runat="server" OnClick="btnDangNhap_Click"/> 
                </div>
            </div> 
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
</body>
</html>
