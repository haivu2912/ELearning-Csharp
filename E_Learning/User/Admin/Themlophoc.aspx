<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Themlophoc.aspx.cs" Inherits="E_Learning.User.Admin.Themlophoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <h2 class="text-center">Thêm Lớp học</h2>
        <div class="row d-flex justify-content-end">
            <div class="col-6">

                <label for="exampleInputEmail1">Mã lớp:</label>
                <asp:TextBox ID="txtMalop" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống!" BorderColor="White" ControlToValidate="txtMalop" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Tên lớp:</label>
                    <asp:TextBox ID="txtTenlop" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtTenlop" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Mã giảng viên:</label>
                    <asp:TextBox ID="txtGiangvien" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtGiangvien" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Mã môn học:</label>
                    <asp:TextBox ID="txtMonhoc" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtMonhoc" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div class="text-center">
            <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm" OnClick="btnThem_Click" />
        </div>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
