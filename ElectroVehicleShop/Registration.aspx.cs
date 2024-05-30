using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectroVehicleShop
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Registration1();
        }

        protected void Registration1()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "3":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = false;
                    DropDownListRole.Enabled = false;
                    Label1ms.Text = "Статус: зареєстрований";
                    break;
                case "1":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = true;
                    DropDownListRole.Enabled = true;
                    Label1ms.Text = "Статус: адмін";
                    break;
                case "2":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    DropDownListRole.Enabled = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case "":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    DropDownListRole.Enabled = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case null:
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    DropDownListRole.Enabled = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
            }
        }

        // Головна (доступна всім)
        protected void LBMain_Click(object sender, EventArgs e)
        {
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
            Response.Redirect("PageAdmin.aspx");
        }

        public void LoginDB(ref int login)
        {
            login = 0;
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "SELECT id_user FROM [user] WHERE (login = N'" + TBLogin.Text + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader drWebUser = cmd.ExecuteReader();
            if (drWebUser.HasRows)
            {
                login = 1;
                TBLogin.Text = "";
                LabelCheck.Text = "Існує! Введіть інший логін.";
            }
            else
            {
                login = 0;
                LabelCheck.Text = "Login OK";
            }
            drWebUser.Close();
        }

        protected void BCheckLogin_Click(object sender, EventArgs e)
        //Перевірити логін
        {
            int login = 1;
            LoginDB(ref login);
        }

        protected void BRegister_Click(object sender, EventArgs e)
        {
            int login = 1;
            LoginDB(ref login);
            if (login == 1) { Response.Redirect("Registration.aspx"); }
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "INSERT INTO [user] (fk_role, surname, name, address, phone, login, password)";
            sql = sql + "VALUES (@fk_role, @surname,@name,@address,@phone,@login,@password)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;

            // Получаем id_role для роли "Registered" (зареєстрований)
            int registeredRoleId = GetRoleId("Registered");

            // Устанавливаем значение для параметра @fk_role
            cmd.Parameters.Add("@fk_role", SqlDbType.Int, 4);
            cmd.Parameters["@fk_role"].Value = registeredRoleId;

            cmd.Parameters.Add("@surname", SqlDbType.NVarChar, 45);
            cmd.Parameters["@surname"].Value = TBSurName.Text.Trim();
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 45);
            cmd.Parameters["@name"].Value = TBName.Text.Trim();
            cmd.Parameters.Add("@address", SqlDbType.NVarChar, 200);
            cmd.Parameters["@address"].Value = TBAddress.Text.Trim();
            cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 45);
            cmd.Parameters["@phone"].Value = TBPhone.Text.Trim();
            cmd.Parameters.Add("@login", SqlDbType.NVarChar, 45);
            cmd.Parameters["@login"].Value = TBLogin.Text.Trim();
            cmd.Parameters.Add("@password", SqlDbType.NVarChar, 45);
            cmd.Parameters["@password"].Value = TBPassword.Text.Trim();
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Session["login"] = TBLogin.Text.Trim();
                Session["password"] = TBPassword.Text.Trim();
                Session["surname"] = TBSurName.Text.Trim();
                Session["name"] = TBName.Text.Trim();
                Session["status"] = registeredRoleId.ToString();
            }
            finally
            {
                //SELECT id_student FROM Student
                //WHERE  (login = N'__') AND (password = N'__')
                sql = "";
                sql = "SELECT id_user FROM [user] WHERE (login = N'";
                sql = sql + Session["login"].ToString() + "') AND (password = N'" + Session["password"].ToString() + "')";
                cmd = new SqlCommand(sql, con);
                SqlDataReader drWebUser = cmd.ExecuteReader();
                drWebUser.Read();
                Session["id_user"] = drWebUser["id_user"].ToString().Trim();
                drWebUser.Close();
                con.Close();
                Response.Redirect("StartPage.aspx");
            }
        }

        private int GetRoleId(string roleName)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string sql = "SELECT id_role FROM [role] WHERE role_name = @roleName";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@roleName", roleName);
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }
                    Console.WriteLine("Роль не знайдена");
                    return -1; 
                }
            }
        }
    }
}