<%@ Page Title="" Language="C#" MasterPageFile="~/User/GiangVien/GiangVien.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Learning.User.GiangVien.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="list__room d-flex"">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th scope="col">Mã lớp</th>
                    <th scope="col">Tên lớp</th>
                    <th scope="col">Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptLophoc" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("sLopId") %> </td>
                            <td><%# Eval("sTenLop") %> </td>
                            <td>
                                 <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# string.Concat("Chitietlophoc.aspx?ID=", Eval("sLopid"))%>' CssClass="btn btn-success" runat="server">Xem chi tiết</asp:HyperLink>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
