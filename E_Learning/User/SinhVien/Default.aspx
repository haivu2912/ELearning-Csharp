<%@ Page Title="" Language="C#" MasterPageFile="~/User/SinhVien/SinhVien.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Learning.User.SinhVien.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Repeater ID="rptLophoc" runat="server">
            <ItemTemplate>
                <div class="col-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("sTenLop") %></h5>
                            <p class="card-text">Mã lớp: <%# Eval("sLopid") %></p>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# string.Concat("ChitietlophocSV.aspx?ID=", Eval("sLopid"))%>' CssClass="btn btn-success" runat="server">Xem chi tiết</asp:HyperLink>
                            <%--<asp:HyperLink ID="HyperLink2" NavigateUrl='<%# string.Concat("Thaoluanchung.aspx?ID=", Eval("sLopid"))%>' CssClass="btn btn-success" runat="server">Thảo luận</asp:HyperLink>--%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
