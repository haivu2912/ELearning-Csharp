<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Learning.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/Login.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        body{
            font-family: 'Open Sans', sans-serif;
            background: #f9faff;
            color: #3a3c47;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <h1>Đăng nhập</h1>
    <form id="form1" runat="server">
        <div class="row">
            <label>Tài khoản</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            <%--textbox tên đăng nhập--%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên đăng nhập không được để trống!" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <label for="password">Mật khẩu</label>
            <%--textbox mật khẩu--%>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mật khẩu không được để trống!" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>


        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
        <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doimatkhau.aspx" CssClass="link">Đổi mật khẩu</asp:HyperLink>
    </form>
</body>
</html>

