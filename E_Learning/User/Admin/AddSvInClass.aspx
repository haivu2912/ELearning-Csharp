<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddSvInClass.aspx.cs" Inherits="E_Learning.User.Admin.AddSvInClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrapper{
            background-color:white;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <h2 class="text-center">Thêm sinh viên vào lớp</h2>
        <div class="row d-flex justify-content-end">
            <div class="col-6">

                <label for="exampleInputEmail1">Mã Lớp:</label>
                <asp:TextBox ID="txtMaLop" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống!" BorderColor="White" ControlToValidate="txtMaLop" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Mã Sinh Viên:</label>
                    <asp:TextBox ID="txtMaSv" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtMaSv" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="text-center">
                <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm" OnClick="btnThem_Click" />
            </div>
            <asp:Label ID="message" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
