using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Додаються
using System.Web.SessionState;
using System.Web.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ElectroVehicleShop
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
                {
                    LBExit.Visible = true; 
                }
                else
                {
                    LBExit.Visible = false; 
                }
            }
            Registration();
        }

        protected void Registration()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "3":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = false;
                    LBExit.Visible = true;
                    Session["IsLoggedIn"] = true;
                    Label1ms.Text = "Статус: зареєстрований";
                    break;
                case "1":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = true;
                    LBExit.Visible = true;
                    Session["IsLoggedIn"] = true;
                    Label1ms.Text = "Статус: адмін";
                    break;
                case "2":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case "":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case null:
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
            }
        }

        // Головна (доступна всім)
        protected void LBMain_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/StartPage.aspx");
            Response.Redirect("StartPage.aspx");
        }
        // Реєстрація(доступна всім)
        protected void LBRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        // Кабінет(тільки зареєстр. корист.)
        protected void LBCabinet_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }

        // Пункт для адміністратора
        protected void LBAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
        // Вхід
        protected void BEnter_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "SELECT id_user, fk_role, surname, name, phone, address, login, password FROM [user] WHERE (login = N'"; sql = sql + TBLogin.Text.Trim() + "') AND (password = N'";
            sql = sql + TBPassword.Text.Trim() + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader drWebUser = cmd.ExecuteReader();
            if (drWebUser.HasRows)
            {
                drWebUser.Read();
                Session["id_user"] = drWebUser["id_user"].ToString();
                Session["login"] = drWebUser["login"].ToString();
                Session["password"] = drWebUser["password"].ToString();
                Session["surname"] = drWebUser["surname"].ToString();
                Session["name"] = drWebUser["name"].ToString().Trim();
                Session["phone"] = drWebUser["phone"].ToString();
                Session["address"] = drWebUser["address"].ToString();
                Session["status"] = drWebUser["fk_role"].ToString();
                Label1ms.Text = "";
                drWebUser.Close();
                con.Close();
                Registration();
                TBLogin.Text = " ";
                TBPassword.Text = " ";
            }
            else
            {
                drWebUser.Close();
                con.Close();
                Label1ms.Text = "Невірний логін або пароль";
                TBLogin.Text = " ";
                TBPassword.Text = " ";
            }
        }

        protected void TBLogin_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LBExit_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session["IsLoggedIn"] = false;
            LBExit.Visible = false;
            Response.Redirect("StartPage.aspx");
        }
        // Каталог
        protected void LBCatalog_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProducts.aspx");
        }
    }
}