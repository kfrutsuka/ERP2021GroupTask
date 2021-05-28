<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UberSearch.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
        <div  style="background-color: #00ACEE; color: #FFFFFF;text-align:center;padding:10px;">
                &nbsp;<asp:Label ID="LabelTitle" runat="server" Text="ログイン"></asp:Label>
        </div>

        <br />
    
    
        <asp:Label ID="LabelId" runat="server" Text="ID"></asp:Label>
&nbsp;&nbsp; 　　 
        <asp:TextBox ID="TextBoxId" runat="server"></asp:TextBox>
&nbsp;
        <br />
        <br />
        <asp:Label ID="LabelPassword" runat="server" Text="パスワード"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LabelMessage" runat="server" Text="LabelMessage"></asp:Label>
        <br />
        <br />
        <asp:Button ID="ButtonLogin" runat="server" Text="ログイン" 
         style="background-color:#e3f1fc" OnClick="ButtonLogin_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonRegistration" runat="server" Text="アカウント作成"  
         style="background-color:#e3f1fc" OnClick="ButtonRegistration_Click" />
    
    
    </form>
    <p>
        &nbsp;</p>
</body>
</html>