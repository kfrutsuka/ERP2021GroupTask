<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPage.aspx.cs" Inherits="UberSearch.TopPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelShopName" runat="server" Text="店舗名"></asp:Label>
        <asp:TextBox ID="TextBoxShopName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelContributor" runat="server" Text="投稿者"></asp:Label>
        <asp:TextBox ID="TextBoxContributor" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="ButtonToppage" runat="server" Text="トップページ" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelRegion" runat="server" Text="地域"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListRegion" runat="server">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelCategory" runat="server" Text="カテゴリ"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListCategory" runat="server">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonSearch" runat="server" Text="検索" />
        <br />
        <br />
        <asp:Button ID="ButtonMypage" runat="server" Text="マイページ" />
        <br />
        <br />
        <asp:Button ID="ButtonPostsList" runat="server" Text="投稿一覧" />
    </form>
</body>
</html>