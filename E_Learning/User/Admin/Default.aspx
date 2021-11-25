<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Learning.User.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1"  runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="list__room d-flex"">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Mã Lớp</th>
                            <th scope="col">Tên Lớp</th>
                            <th scope="col">Tên Giảng Viên</th>
                            <th scope="col">Mã Giảng Viên</th>
                            <th scope="col">Số lượng sinh viên</th>
                            <%--<th scope="col">Xem chi tiết</th>--%>
                            <%--<th scope="col">Xóa</th>--%>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptLophoc" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("sLopId") %> </td>
                                    <td><%# Eval("sTenLop") %> </td>
                                    <td><%#Eval("sTen") %></td>
                                    <td><%# Eval("sGiangvienId") %></td>
                                    <td><%#Eval("Số lượng sinh viên") %></td>
                                    <%--<td>Xem chi tết lớp học</td>--%>
                                    <%--<td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" Tagkey='<%#Eval("sLopId")%>' OnCommand="LinkButton1_Command">Xóa</asp:LinkButton>
                                    </td>--%>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:Label ID="message" runat="server" Text=""></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
