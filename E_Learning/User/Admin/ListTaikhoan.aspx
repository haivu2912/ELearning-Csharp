<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListTaikhoan.aspx.cs" Inherits="E_Learning.User.Admin.ListTaikhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th scope="col">Tài khoản</th>
                <th scope="col">Quyền</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptTaikhoan" runat="server">
                <ItemTemplate>
                    <tr>
                        <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("sAccount") %>' />
                        <td><%# Eval("sAccount") %> </td>
                        <td><%# Eval("iMaQuyen") %> </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>

        </tbody>
    </table>
</asp:Content>
