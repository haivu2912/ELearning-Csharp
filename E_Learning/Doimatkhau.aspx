<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doimatkhau.aspx.cs" Inherits="E_Learning.Doimatkhau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="CSS/Login.css" />
    <title>Đổi mật khẩu</title>
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
    <h1>Đổi mật khẩu</h1>
    <form id="form1" runat="server">
        <div class="row">
            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <%--textbox tên đăng nhập--%>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên đăng nhập không được để trống!" ControlToValidate="txtUsername" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <label for="password">Mật khẩu cũ</label>
            <%--textbox mật khẩu--%>
            <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mật khẩu không được để trống!" ControlToValidate="txtOldPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="row">
            <label for="password">Mật khẩu mới</label>
            <%--textbox mật khẩu--%>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mật khẩu không được để trống!" ControlToValidate="txtNewPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>

        <div class="row">
            <label for="password">Nhập lại mật khẩu</label>
            <%--textbox mật khẩu--%>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Mật khẩu không được để trống!" ControlToValidate="txtConfirmPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Không khớp" ControlToValidate="txtNewPassword" ControlToCompare="txtConfirmPassword" ForeColor="Red">*</asp:CompareValidator>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Xin kiểm tra lại" ForeColor="Red"/>
        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="SUBMIT" OnClick="Button1_Click"/>
        <asp:Label ID="lbMsg" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Đăng nhập</asp:HyperLink>
    </form>
</body>
</html>
