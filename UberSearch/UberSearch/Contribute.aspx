<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contribute.aspx.cs" Inherits="UberSearch.Contribute" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-2 col-md-2">
               <div class="sub leftSide">
                    <asp:ImageButton ID="ImageButtonPost" runat="server" ImageUrl="~/images/post_button.png" />
                    <br />
                    <asp:ImageButton ID="ImageButtonTop" runat="server" ImageUrl="~/images/top_button.png" />
                    <br />
                    <div class="my">
                        <asp:ImageButton ID="ImageButtonMy" runat="server" ImageUrl="~/images/mypage_button.png" />
                    </div>
                </div>
            </div>
            <div class="col-sm-10 col-md-10">
                <div class="sub">
                    店舗名
                    <asp:TextBox ID="TextBoxShopName" runat="server"></asp:TextBox>
                    <br />
                    地域
                    <asp:DropDownList ID="DropDownListArea" runat="server">
                        <asp:ListItem>埼玉</asp:ListItem>
                        <asp:ListItem>大阪</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    カテゴリ
                    <asp:DropDownList ID="DropDownListCategory" runat="server">
                        <asp:ListItem>和食</asp:ListItem>
                        <asp:ListItem>洋食</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    URL
                    <asp:TextBox ID="TextBoxURL" runat="server"></asp:TextBox>
                    <br />
                    画像
                    <input id="PictUpload" type="file"  runat="server" />
                    <asp:Label ID="LabelImage" runat="server" Text="Label"></asp:Label>
                    <br />
                    おすすめポイント
                    <asp:TextBox ID="TextBoxPoint" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="ButtonPost" runat="server" Text="投稿" OnClick="ButtonPost_Click" />
                </div>
            </div>
        </div>
    </form>
    <style>
        .my{
            margin-top: 30px;
        }
        .leftSide{
            padding-left: 15%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>

