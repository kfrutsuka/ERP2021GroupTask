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
    public partial class Contribute : System.Web.UI.Page
    {
        //private string session = (string)Session["CTB_ID"];
        private int shopId = 1;
        private string shopName;
        private int categoryId;
        private int areaId;
        private string url;
        private string images;
        private string recommendPoint;
        private int postId = 8888;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ページ単位で検証する際はコメントアウト必須
            //if (!IsPostBack)
            //{
            //    if (Session["CTB_ID"] == null)
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //}
        }

        private bool CreateInsertCheck(string checkStr)
        {
            int cnt = 0;
            string connectString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectString);
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT");
            sb.Append(" SHOP_NAME");
            sb.Append(" FROM");
            sb.Append(" [ERP_2021].[dbo].[SHOP]");
            sb.Append(" WHERE");
            sb.Append(" SHOP_NAME = @shopName");

            SqlCommand cm = new SqlCommand(sb.ToString(), cn);

            cm.Parameters.Add("@shopName", SqlDbType.NVarChar).Value = checkStr;

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cm.Dispose();
            cn.Close();

            foreach (DataRow row in dt.Rows)
            {
                shopId = int.Parse(dt.Rows[0]["SHOP_ID"].ToString());
                return true;
            }

            return false;

        }

        private StringBuilder CreateInsertCommand()
        {
            string checkStr = TextBoxShopName.Text;

            StringBuilder sb = new StringBuilder();
            if (CreateInsertCheck(checkStr))
            {
                sb.Append("INSERT INTO [ERP_2021].[dbo].[COMMENT] ");
                sb.Append("VALUES ");
                sb.Append("((SELECT(MAX(COMMENT_ID) + 1) FROM COMMENT), @areaId, @categoryId, @images, @recommendPoint, @shopId, @url, @postId)");
            }
            else
            {
                sb.Append("INSERT INTO [ERP_2021].[dbo].[SHOP] ");
                sb.Append("VALUES ");
                sb.Append("((SELECT(MAX(SHOP_ID) + 1) FROM SHOP), @shopName, @categoryId, @areaId, @recommendPoint, @images, @url, @postId)");
                sb.Append("; ");
                sb.Append("INSERT INTO [ERP_2021].[dbo].[COMMENT] ");
                sb.Append("VALUES ");
                sb.Append("((SELECT(MAX(COMMENT_ID) + 1) FROM COMMENT), @areaId, @categoryId, @images, @recommendPoint, (SELECT(MAX(SHOP_ID)) FROM SHOP), @url, @postId)");
                sb.Append(";");
            }
            

            return sb;
        }

        protected void ButtonPost_Click(object sender, EventArgs e)
        {
            string FileName;
            string savedFileName = "";
            string FilePass = "";
            string Folder = Server.MapPath("./images");

            FileName = PictUpload.PostedFile.FileName;
            FileName = Path.GetFileName(FileName);
            string mimetype = MimeMapping.GetMimeMapping(FileName);

            //ファイル名の取得
            FileName = PictUpload.PostedFile.FileName;
            FileName = Path.GetFileName(FileName);

            //アップロードされるファイルの種類を確認
            mimetype = MimeMapping.GetMimeMapping(FileName);

            if (!mimetype.StartsWith("image"))
            {
                //画像以外のファイルがアップロードされようとしたらリターン
                LabelImage.Text = "画像ファイルを選択してください。";
                return;
            }

            if (PictUpload.Value != "")
            {
                FileName = PictUpload.PostedFile.FileName;
                FileName = Path.GetFileName(FileName);

                //string mimetype = MimeMapping.GetMimeMapping(FileName);

                if (!mimetype.StartsWith("image"))
                {
                    //画像以外のファイルがアップロードされようとした
                    return;
                }

                //ファイル名をランダムで生成して、元の拡張子を結合する
                savedFileName = Path.GetFileNameWithoutExtension(Path.GetRandomFileName()) + Path.GetExtension(FileName);

                FilePass = Folder + "\\" + savedFileName;

                if (!Directory.Exists(Folder))
                {
                    Directory.CreateDirectory(Folder);
                }

                if (!File.Exists(FilePass))
                {
                    PictUpload.PostedFile.SaveAs(FilePass);
                }
            }

            switch (DropDownListArea.SelectedValue)
            {
                case "埼玉":
                    areaId = 1;
                    break;
                case "大阪":
                    areaId = 2;
                    break;
            }

            switch (DropDownListCategory.SelectedValue)
            {
                case "和食":
                    categoryId = 1;
                    break;
                case "洋食":
                    categoryId = 2;
                    break;
            }

            images = savedFileName;
            recommendPoint = TextBoxPoint.Text;
            url = TextBoxURL.Text;
            shopName = TextBoxShopName.Text;

            //前画面から取得
            //postId = int.Parse(HttpUtility.HtmlEncode(Session["CTB_ID"]));

            string connectString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectString);

            StringBuilder sb = CreateInsertCommand();
            //コマンドオブジェクト生成
            SqlCommand cm = new SqlCommand(sb.ToString(), cn);
            //パラメータ
            cm.Parameters.Add("@areaId", SqlDbType.Int).Value = areaId;
            cm.Parameters.Add("@categoryId", SqlDbType.Int).Value = categoryId;
            cm.Parameters.Add("@images", SqlDbType.NVarChar, 500).Value = images;
            cm.Parameters.Add("@recommendPoint", SqlDbType.NVarChar, 500).Value = recommendPoint;
            cm.Parameters.Add("@shopId", SqlDbType.Int).Value = shopId;
            cm.Parameters.Add("@url", SqlDbType.NVarChar, 500).Value = url;
            cm.Parameters.Add("@postId", SqlDbType.Int).Value = postId;
            cm.Parameters.Add("@shopName", SqlDbType.NVarChar).Value = shopName;

            SqlDataAdapter da = new SqlDataAdapter(cm);

            cn.Open();
            cm.ExecuteNonQuery();
            cn.Close();

            Response.Redirect("TopPage.aspx");
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