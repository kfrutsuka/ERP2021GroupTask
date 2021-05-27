<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="UberSearch.Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div>
    
        　　　　　　　　　　　　　　　　<asp:Label ID="LabelShopName" runat="server" Text="店舗名"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxShopName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonToppage" runat="server" Text="トップページ" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelRegion" runat="server" Text="地域"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxRegion" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonMypage" runat="server" Text="マイページ" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelCategory" runat="server" Text="カテゴリ"></asp:Label>
        <asp:TextBox ID="TextBoxCategory" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Image ID="ImagePhoto" runat="server" Height="16px" Width="185px" />
        <br />
        <br />
        <asp:Button ID="ButtonPostsList" runat="server" Text="投稿一覧" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelURL" runat="server" Text="URL"></asp:Label>
        <asp:TextBox ID="TextBoxURL" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelRecommendation" runat="server" Text="おすすめポイント"></asp:Label>
        <asp:TextBox ID="TextBoxRecommendation" runat="server" OnTextChanged="TextBoxShopName2_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    
    </div>
    
    </div>
    </form>
</body>
</html>