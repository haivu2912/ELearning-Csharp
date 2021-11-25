<%@ Page Title="" Language="C#" MasterPageFile="~/User/SinhVien/SinhVien.Master" AutoEventWireup="true" CodeBehind="ChitietbuoihocSV.aspx.cs" Inherits="E_Learning.User.SinhVien.ChitietbuoihocSV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrapper {
            width: 100%;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            padding: 20px;
            box-sizing: border-box;
        }

        .title {
            font-size: 20px;
            width: 100%;
            background-color: #14A9FE;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper d-flex flex-column">
        <div class="title d-flex flex-row pb-4 pt-4 text-center">
            <%--<p class="pr-2"><b>Tiêu đề</b></p>--%>
            <asp:Label ID="lbTitle" runat="server"></asp:Label>
        </div>
        <div class="date d-flex flex-row">
            <p class="pr-2"><b>Ngày:</b></p>
            <asp:Label ID="lbDate" runat="server"></asp:Label>
        </div>
        <div class="content pb-4">
            <p class="pr-2"><b>Nội dung:</b></p>
            <asp:Label ID="lbContent" runat="server"></asp:Label>
        </div>
        <div class="start d-flex flex-row">
            <p class="pr-2"><b>Thời gian bắt đầu:</b></p>
            <asp:Label ID="lbTimeStart" runat="server"></asp:Label>
        </div>
        <div class="end  d-flex flex-row">
            <p class="pr-2"><b>Thời gian kết thúc:</b></p>
            <asp:Label ID="lbTimeEnd" runat="server"> </asp:Label>
        </div>
        <div class="end  d-flex flex-row">
            <p class="pr-2"><b>Tệp đính kèm</b></p>
            <asp:Label ID="lbTepdinhkem" runat="server"></asp:Label>
        </div>
        <div class="status  d-flex flex-row">
            <p class="pr-2"><b>Trạng thái: </b></p>
            <asp:Label ID="lbTrangThai" runat="server"></asp:Label>
        </div>
        <div class="diemdanh ">
            <p><b>Điểm danh</b></p>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lbDiemdanh" runat="server"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnDiemdanh" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <asp:Button ID="btnDiemdanh" CssClass="btn btn-primary btn-sm" runat="server" Text="SUBMIT" OnClick="btnDiemdanh_Click" />
        </div>

    </div>
</asp:Content>
