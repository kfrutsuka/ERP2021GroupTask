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

namespace UberSearch
{
    public partial class Login : System.Web.UI.Page
    {
        const bool DB_INVISIBLE = false;
        const int COOKIE_DAY = 1;
        public DataTable SelectBindData()
        {
            // コネクションオブジェクト生成
            string connectString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectString);
            cn.Open();

            // SQLコマンドインスタンス生成
            //StringBuilder sb = new StringBuilder();
            //sb.Append("SELECT * FROM [ERP_2021].[dbo].[CTB_MST]");
            StringBuilder sb = CreateSelectCommand();
            sb.Append(CreateWhereCommand());

            SqlCommand cm = new SqlCommand(sb.ToString(), cn);

            // データアダプターインスタンス生成
            SqlDataAdapter da = new SqlDataAdapter(cm);

            // データテーブル生成
            DataTable dt = new DataTable();
            // Fill(DataTable dt)メソッドを呼び出し、Select文を発行
            da.Fill(dt);

            cm.Dispose();
            cn.Close();

            return dt;
        }

        /// <summary>
        /// Select句作成
        /// </summary>
        /// <returns></returns>
        private StringBuilder CreateSelectCommand()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("SELECT ");
            sb.Append("[CTB_ID] ");      // 投稿者ID
            sb.Append("FROM [ERP_2021].[dbo].[CTB_MST] ");

            return sb;
        }

        private string CreateWhereCommand()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("WHERE ");
            sb.Append("[CTB_ID] = ");      // 投稿者ID
            sb.Append(TextBoxId.Text.Trim());
            sb.Append(" AND ");
            sb.Append("[CTB_PASS] = '");   // 投稿者パスワード
            sb.Append(TextBoxPassword.Text);
            sb.Append("'");

            return sb.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelMessage.Text = "";

            if (Response.Cookies["CTB_ID"] != null)
            {
                if (Response.Cookies["CTB_ID"].Value != null)
                {
                    Session["CTB_ID"] = Response.Cookies["CTB_ID"].Value;
                    Response.Redirect("TopPage.aspx");
                }

            }

            if (Session["Account_Create"] != null)
            {
                Session["Account_Create"] = null;
                LabelMessage.Text = "アカウントを作成しました。";
            }

            TextBoxId.Focus();
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (DB_INVISIBLE)
            {
                Session["CTB_ID"] = TextBoxId.Text;
                Response.Redirect("TopPage.aspx");
            }
            else
            {
                if (TextBoxId.Text != "" && TextBoxPassword.Text != "")
                {
                    DataTable dt = SelectBindData();

                    if (dt.Rows.Count > 0)
                    {
                        string id = dt.Rows[0]["CTB_ID"].ToString();
                        Session["CTB_ID"] = id;
                        Response.Cookies["CTB_ID"].Value = id;
                        Response.Cookies["CTB_ID"].Expires = DateTime.Now.AddDays(COOKIE_DAY);
                        Response.Redirect("TopPage.aspx");
                    }
                    else
                    {
                        LabelMessage.Text = "IDかパスワードが正しくありません。";
                        LabelMessage.Font.Bold = true;
                        TextBoxId.BackColor = System.Drawing.Color.Pink;
                        TextBoxPassword.BackColor = System.Drawing.Color.Pink;
                    }
                }
                else
                {
                    LabelMessage.Text = "IDかパスワードが入力されていません。";
                    LabelMessage.Font.Bold = true;
                    TextBoxId.BackColor = System.Drawing.Color.Pink;
                    TextBoxPassword.BackColor = System.Drawing.Color.Pink;
                }
            }
        }

        protected void ButtonRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}