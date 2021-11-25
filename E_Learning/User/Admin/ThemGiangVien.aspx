<%@ Page Title="" Language="C#" MasterPageFile="~/User/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThemGiangVien.aspx.cs" Inherits="E_Learning.User.Admin.ThemGiangVien" %>
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
        <h2 class="text-center">Thêm Giảng Viên</h2>
        <div class="row d-flex justify-content-end">
            <div class="col-6">

                <label for="exampleInputEmail1">Mã giảng viên:</label>
                <asp:TextBox ID="txtMagiangvien" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống!" BorderColor="White" ControlToValidate="txtMagiangvien" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Họ và tên:</label>
                    <asp:TextBox ID="txtHoten" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtHoten" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">

                <label for="exampleInputEmail1">Giới tính:</label><br />
                <asp:RadioButtonList ID="rdoPriceRange" runat="server" RepeatLayout="Flow">
                    <asp:ListItem Value="Nam">Nam</asp:ListItem>
                    <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                </asp:RadioButtonList>

            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Ngày sinh:</label>
                    <asp:TextBox ID="txtNgaysinh" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtNgaysinh" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Địa chỉ:</label>
                    <asp:TextBox ID="txtDiachi" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtDiachi" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email:</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Chứng minh nhân dân hoặc thẻ căn cước:</label>
                    <asp:TextBox ID="txtCmnd" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtCmnd" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="exampleInputEmail1">Số điện thoại:</label>
                    <asp:TextBox ID="txtSodienthoai" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtSodienthoai" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label>Bằng cấp:</label>
                    <asp:DropDownList ID="ddlBangcap" runat="server">
                        <asp:ListItem>Thạc sĩ</asp:ListItem>
                        <asp:ListItem>Tiến sĩ</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="text-center">
            <asp:Button ID="btnThem" CssClass="btn btn-primary" runat="server" Text="Thêm" OnClick="btnThem_Click" />
        </div>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
