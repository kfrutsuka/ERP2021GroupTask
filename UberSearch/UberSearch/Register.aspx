<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UberSearch.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="LabelAccount" runat="server" Text="アカウント作成"></asp:Label>
    
    </div>
        <br />
        <br />
        <asp:Label ID="LabelId" runat="server" Text="ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxId" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelPassword" runat="server" Text="パスワード"></asp:Label>
        　<asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelNickname" runat="server" Text="ニックネーム"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxNickname" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonRegistration" runat="server" Text="登録" />
    </form>
</body>
</html>