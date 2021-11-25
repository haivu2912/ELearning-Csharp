<%@ Page Title="" Language="C#" MasterPageFile="~/User/SinhVien/SinhVien.Master" AutoEventWireup="true" CodeBehind="Thaoluanchung.aspx.cs" Inherits="E_Learning.User.SinhVien.Thaoluanchung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center">Thảo luận chung</h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="wrapper">
                <asp:Repeater ID="rptThaoluan" runat="server">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-8 d-flex ">
                                <p class="pr-5"><%# Eval("sAccount") %>:</p>
                                <p class="pr-5"><%# Eval("sNoidung") %></p>
                                <p class="pr-5"><i><%# Eval("dNgay","{0:dd/M/yyyy}") %></i></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSend" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="form-group pt-5">
        <asp:TextBox ID="txtNoidung" CssClass="form-control" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Gửi" OnClick="btnSend_Click" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtNoidung" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
