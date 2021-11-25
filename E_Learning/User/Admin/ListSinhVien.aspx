<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ListSinhVien.aspx.cs" Inherits="E_Learning.User.Admin.ListSinhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
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
                        <th scope="col">Account</th>

                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptSinhvien" runat="server">
                        <ItemTemplate>
                            <tr>
                                <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("sSinhvienId") %>' />
                                <td><%# Eval("sSinhvienId") %> </td>
                                <td><%# Eval("sTen") %> </td>
                                <td><%# Eval("sGioitinh") %></td>
                                <td><%# Eval("dNgaysinh") %></td>
                                <td><%# Eval("sDiachi") %></td>
                                <td><%# Eval("sEmail") %></td>
                                <td><%# Eval("sCmnd") %></td>
                                <td><%# Eval("sSodienthoai") %></td>
                                <td><%# Eval("sAccount") %></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" Tagkey1='<%#Eval("sSinhvienId")%>' Tagkey2='<%#Eval("sAccount")%>' OnCommand="LinkButton1_Command">Xóa</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <asp:Label ID="lbMsg" runat="server" Text="Label" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
