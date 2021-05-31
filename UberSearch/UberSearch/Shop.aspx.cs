using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using System.Text;
using System.Configuration;
using System.IO;

namespace UberSearch
{
    public partial class Shop : System.Web.UI.Page
    {
        //ショップIDは前画面から
        private int shopId = 1;
        private string shopName;
        private int categoryId;
        private int areaId;
        private string url;
        private string images;
        private string recommendPoint;
        private int postId;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ページ単位で検証する際はコメントアウト必須
            if (!IsPostBack)
            {
                if (Session["CTB_ID"] == null)
                {
                   Response.Redirect("Login.aspx");
                }
            }

            //初期化
            TextBoxShopName.Text = "";
            TextBoxArea.Text = "";
            TextBoxCategory.Text = "";
            TextBoxURL.Text = "";
            TextBoxPoint.Text = "";

            //非活性
            TextBoxShopName.Enabled = false;
            TextBoxArea.Enabled = false;
            TextBoxCategory.Enabled = false;
            TextBoxURL.Enabled = false;
            TextBoxPoint.Enabled = false;

            DataTable dt = new DataTable();
            dt = BindData();

            //DBから取得した1行目の値をそれぞれに代入
            TextBoxShopName.Text = (dt.Rows[0]["SHOP_NAME"]).ToString();
            //TextBoxArea.Text = (dt.Rows[0]["AREA_ID"]).ToString();
            //TextBoxCategory.Text = (dt.Rows[0]["CATEGORY_ID"]).ToString();
            TextBoxURL.Text = (dt.Rows[0]["SHOP_LINK"]).ToString();
            //TextBoxPoint.Text = (dt.Rows[0]["SHOP_RCM"]).ToString();

            switch ((dt.Rows[0]["AREA_ID"]).ToString())
            {
                case "1":
                    TextBoxArea.Text = "埼玉";
                    break;
                case "2":
                    TextBoxArea.Text = "大阪";
                    break;
            }

            switch ((dt.Rows[0]["CATEGORY_ID"]).ToString())
            {
                case "1":
                    TextBoxCategory.Text = "和食";
                    break;
                case "2":
                    TextBoxCategory.Text = "洋食";
                    break;
            }

            foreach (DataRow row in dt.Rows)
            {
                TextBoxPoint.Text = TextBoxPoint.Text + (row["COMMENT"].ToString()) + "\n";
            }

                string Folder = "./images";
            string ImagePass = Folder + "/" + dt.Rows[0]["SHOP_IMAGE"].ToString();
            ImageShop.ImageUrl = ImagePass;

        }

        public DataTable BindData()
        {
            string connectString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectString);
            cn.Open();

            StringBuilder sb = CreateSelectCommand();
            SqlCommand cm = new SqlCommand(sb.ToString(), cn);

            //前画面からのショップIDを取得
            shopId = int.Parse(Request.QueryString["SHOP_ID"]);

            cm.Parameters.Add("@shopId", SqlDbType.Int).Value = shopId;
            //SqlCommand cm = new SqlCommand(sb.ToString(), cn);
            //実行結果がdaに入る
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            //dtにdaの中身が入る
            da.Fill(dt);

            //dt型の1行を持ってこなくちゃならない

            /*
            DataGrid.DataSource = dt;
            DataGrid.PageSize = int.Parse(DisplayCountList.SelectedValue);
            DataGrid.DataBind();
            */

            cm.Dispose();
            cn.Close();

            return dt;
        }

        private StringBuilder CreateSelectCommand()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT ");
            sb.Append("S.SHOP_NAME AS SHOP_NAME");
            sb.Append(", S.CATEGORY_ID AS CATEGORY_ID");
            sb.Append(", S.AREA_ID AS AREA_ID");
            sb.Append(", C.COMMENT AS COMMENT");
            sb.Append(", C.IMAGES AS SHOP_IMAGE");
            sb.Append(", S.SHOP_LINK AS SHOP_LINK");
            sb.Append(", S.CTB_ID AS CTB_ID");
            sb.Append(" FROM [ERP_2021].[dbo].[COMMENT] AS C");
            sb.Append(" JOIN [ERP_2021].[dbo].[SHOP] AS S");
            sb.Append(" ON C.SHOP_ID = S.SHOP_ID");
            sb.Append(" WHERE S.SHOP_ID = @shopId");

            return sb;
        }

        protected void ImageButtonPost_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Contribute.aspx");
        }

        protected void ImageButtonTop_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TopPage.aspx");
        }

        protected void ImageButtonMy_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MyPage.aspx");
        }
    }
}