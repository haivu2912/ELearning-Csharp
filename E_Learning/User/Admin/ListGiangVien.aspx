<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListGiangVien.aspx.cs" Inherits="E_Learning.User.Admin.ListGiangVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th scope="col">Mã GV</th>
                <th scope="col">Họ tên</th>
                <th scope="col">Giới tính</th>
                <th scope="col">Ngày sinh</th>
                <th scope="col">Địa chỉ</th>
                <th scope="col">Email</th>
                <th scope="col">CMND</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Bằng cấp</th>
                <th scope="col">Account</th>
                <%--<th scope="col">Remove</th>--%>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptGiangvien" runat="server">
                <ItemTemplate>
                    <tr>
                        <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("sGiangvienId") %>' />
                        <td><%# Eval("sGiangvienId") %> </td>
                        <td><%# Eval("sTen") %> </td>
                        <td><%# Eval("sGioitinh") %></td>
                        <td><%# Eval("dNgaysinh") %></td>
                        <td><%# Eval("sDiachi") %></td>
                        <td><%# Eval("sEmail") %></td>
                        <td><%# Eval("sCmnd") %></td>
                        <td><%# Eval("sSodienthoai") %></td>
                        <td><%# Eval("sBangcap") %></td>
                        <td><%# Eval("sAccount") %></td>
                        <td>
                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-info" NavigateUrl='<%# string.Concat("suathongtinGV.aspx?ID=", Eval("sGiangVienId"))%>'  runat="server">Xem chi tiết</asp:HyperLink>
                            <%--<asp:Button ID="Button2" CssClass="btn btn-info" runat="server" Text="Sửa" OnClick="Button2_Click"/>--%>
                            <%--<asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="Xóa" />--%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>

        </tbody>
    </table>
</asp:Content>
