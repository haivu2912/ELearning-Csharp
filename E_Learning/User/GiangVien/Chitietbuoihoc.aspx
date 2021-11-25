<%@ Page Title="" Language="C#" MasterPageFile="~/User/GiangVien/GiangVien.Master" AutoEventWireup="true" CodeBehind="Chitietbuoihoc.aspx.cs" Inherits="E_Learning.User.GiangVien.Chitietbuoihoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="card card-body">

                <div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Tiêu đề</label>
                        <asp:TextBox ID="txtTieude" CssClass="form-control" runat="server" OnTextChanged="txtTieude_OnTextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống!" ControlToValidate="txtTieude" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nội dung</label>
                        <asp:TextBox ID="txtNoidung" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được để trống!" BorderColor="Red" ControlToValidate="txtNoidung" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Tệp đính kèm:</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Trạng thái:</label>
                        <asp:DropDownList ID="ddlTrangthai" runat="server" OnSelectedIndexChanged="ddlTrangthai_SelectedIndexChanged">
                            <asp:ListItem>Học</asp:ListItem>
                            <asp:ListItem>Nghỉ</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Button ID="btnCapnhat" CssClass="btn btn-primary" runat="server" Text="Cập nhật" OnClick="btnCapnhat_Click" />
                </div>
            </div>
            <%--    </div>--%>
            <div class="content p-2">
                <asp:Label ID="txtBuoihoc" runat="server" Text="Buổi học số 1"></asp:Label>
                <table class="table table-hover table-bordered" style="width: 100%">
                    <tbody>
                        <tr>
                            <th>Tiêu đề</th>
                            <th>
                                <asp:Label ID="lbTieude" runat="server" Text="Bài học đầu tiên"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>Ngày</th>
                            <th>
                                <asp:Label ID="lbNgay" runat="server" Text="12/12/2021"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>Nội dung</th>

                            <th>
                                <asp:Label ID="lbNoidung" runat="server" Text="Bài học đầu tiên sẽ là ví dụ...."></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>Tệp đính kèm</th>
                            <th>
                                <asp:Label ID="lbTepdinhkem" runat="server" Text=""></asp:Label>
                            </th>

                        </tr>
                        <tr>
                            <th>Thời gian bắt đầu</th>
                            <th>
                                <asp:Label ID="lbThoigianbatdau" runat="server" Text="7h30"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>Thời gian kết thúc</th>
                            <th>
                                <asp:Label ID="lbThoigianketthuc" runat="server" Text="11h30"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th>Trạng thái: </th>
                            <th>
                                <asp:Label ID="lbTrangthai" runat="server" Text="Học"></asp:Label>
                            </th>
                        </tr>
                    </tbody>

                </table>
            </div>
        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="btnCapnhat" />
        </Triggers>
    </asp:UpdatePanel>

    <%-- <asp:HyperLink ID="HyperLink1" CssClass="pt-2" NavigateUrl='<%# string.Concat("danhsachdiemdanh.aspx?ID=", Eval("iBuoihocid"))%>'  runat="server">Xem chi tiết</asp:HyperLink>--%>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <%--  </div>--%>
</asp:Content>
