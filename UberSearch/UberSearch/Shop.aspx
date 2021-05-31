<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="UberSearch.Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row mainCenter">
            <div class="col-sm-2 col-md-2">
                <div class="sub leftSide">
                    <asp:ImageButton ID="ImageButtonPost" runat="server" ImageUrl="~/images/post_button.png" OnClick="ImageButtonPost_Click" />
                    <br />
                    <asp:ImageButton ID="ImageButtonTop" runat="server" ImageUrl="~/images/top_button.png" OnClick="ImageButtonTop_Click" />
                    <br />
                    <div class="my">
                        <asp:ImageButton ID="ImageButtonMy" runat="server" ImageUrl="~/images/mypage_button.png" OnClick="ImageButtonMy_Click" />
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="subCenter">
                    店舗名
                    <asp:TextBox ID="TextBoxShopName" runat="server"></asp:TextBox>
                    <br />
                    地域
                    <asp:TextBox ID="TextBoxArea" runat="server"></asp:TextBox>
                    <br />
                    カテゴリ
                    <asp:TextBox ID="TextBoxCategory" runat="server"></asp:TextBox>
                    <br />
                    URL
                    <asp:TextBox ID="TextBoxURL" runat="server"></asp:TextBox>
                    <br />
                    おすすめポイント
                    <asp:TextBox ID="TextBoxPoint" runat="server" Height="90px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    <br />
                </div>
            </div>
            <div class="col-sm-4 col-md-4 box-image">
                <asp:Image ID="ImageShop" runat="server" BorderColor="White" Height="250px" Width="250px" />
            </div>
        </div>
    </form>
    <style>
        .my{
            margin-top: 30px;
        }
        .leftSide{
            padding-left: 15px;
        }
        .subCenter{
            margin-left: auto;
            margin-right: auto;
        }
        .mainCenter{
            margin-top: 5%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</body>
</html>