<%@ Page Title="" Language="C#" MasterPageFile="~/User/GiangVien/GiangVien.Master" AutoEventWireup="true" CodeBehind="Danhsachdiemdanh.aspx.cs" Inherits="E_Learning.User.GiangVien.Danhsachdiemdanh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Danh sách ghi danh </h2>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Mã sinh viên</th>
                <th scope="col">Họ ten</th>
                <th scope="col">Ngày sinh</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptdiemdanh" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("sSinhvienid") %></td>
                        <td><%# Eval("sTen") %></td>
                        <td><%#Eval("dNgaysinh", "{0:dd/M/yyyy}")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</asp:Content>
