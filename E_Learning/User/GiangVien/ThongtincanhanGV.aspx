<%@ Page Title="" Language="C#" MasterPageFile="~/User/GiangVien/GiangVien.Master" AutoEventWireup="true" CodeBehind="ThongtincanhanGV.aspx.cs" Inherits="E_Learning.User.GiangVien.ThongtincanhanGV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thông tin của tôi</h2>
    <br />
    <asp:Repeater ID="rptGVInfor" runat="server">
        <ItemTemplate>
            <p>Mã cá nhân: <%#Eval("sGiangVienId") %></p>
            <p>Tên: <%#Eval("sTen") %></p>
            <p>Giới tính: <%#Eval("sGioitinh") %></p>
            <p>Ngày sinh: <%#Eval("dNgaysinh") %></p>
            <p>Địa chỉ: <%#Eval("sDiachi") %></p>
            <p>Email: <%#Eval("sEmail") %></p>
            <p>CMND: <%#Eval("sCMND") %></p>
            <p>SĐT: <%#Eval("sSodienthoai") %></p>
            <p>Bằng cấp: <%#Eval("sBangcap") %></p>
            <p>Tài khoản: <%#Eval("sAccount") %></p>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>
