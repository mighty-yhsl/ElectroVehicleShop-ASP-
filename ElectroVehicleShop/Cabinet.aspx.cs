using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ElectroVehicleShop
{
    public partial class Cabinet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int fk_role = GetRoleId();

            SqlDataSource1.InsertParameters["fk_role"].DefaultValue = fk_role.ToString();
            SqlDataSource1.UpdateParameters["fk_role"].DefaultValue = fk_role.ToString();

            if (!IsPostBack)
            {
                Registration();
                OpenCabinet();
            }
        }

        protected void OpenCabinet()
        {
            Literal1.Text = Session["surname"].ToString();
            Literal2.Text = Session["name"].ToString();
            Literal4.Text = Session["id_user"].ToString();
        }

        protected void Registration()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "3":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = false;
                    Session["IsLoggedIn"] = true;
                    Label1ms.Text = "Статус: зареєстрований";
                    break;
                case "1":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = true;
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
        protected int GetRoleId()
        {

                return 1; // Например, значение по умолчанию
        }
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
            Response.Redirect("AdminPage.aspx");
        }
    }
}