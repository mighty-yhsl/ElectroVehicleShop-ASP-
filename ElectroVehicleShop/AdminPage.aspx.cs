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
using System.Reflection;

namespace ElectroVehicleShop
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    LBAllUsers.Visible = false;
                    Label1ms.Text = "Статус: зареєстрований";
                    break;
                case "1":
                    LBCabinet.Visible = true;
                    LBAdmin.Visible = true;
                    LBAllUsers.Visible = true;
                    Label1ms.Text = "Статус: адмін";
                    break;
                case "2":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    LBAllUsers.Visible = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case "":
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    LBAllUsers.Visible = false;
                    Label1ms.Text = "Статус: незареєстрований";
                    break;
                case null:
                    LBCabinet.Visible = false;
                    LBAdmin.Visible = false;
                    LBAllUsers.Visible = false;
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
            Response.Redirect("AdminPage.aspx");
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ButtonY")   
            {
                int index = Convert.ToInt32(e.CommandArgument);  //індекс обраного рядка 
                GridViewRow row = GridView1.Rows[index];         //обраний рядок 
                string id_order = row.Cells[0].Text;             //id_order в Cells[0]
                string fk_status_order = "7";   //ВІДПРАВЛЕНО
                ChangeOfStatus(id_order, fk_status_order, GridView1);
            }
            if (e.CommandName == "ButtonN")   
            {
                int index = Convert.ToInt32(e.CommandArgument);  //індекс обраного рядка 
                GridViewRow row = GridView1.Rows[index];         //обраний рядок 
                string id_order = row.Cells[0].Text;             //id_order в Cells[0]
                string fk_status_order = "2";   //ЗАВЕРШЕНО
                ChangeOfStatus(id_order, fk_status_order, GridView1);
            }
        }

        protected void ChangeOfStatus(string id_order, string fk_status_order, GridView obj)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "UPDATE [order] SET fk_status_order=" + fk_status_order + " WHERE(id_order=" + id_order + ")";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            obj.DataBind();  // перезавантажити GridView
        }

        protected void Button1_Click(object sender, EventArgs e)  //Відправлено
        {
            string st = Session["id_order"].ToString();
            if (st != null || st != "")
            {
                ChangeOfStatus(st, "7", GridView1);
            }
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)  //Завершено
        {
            string st = Session["id_order"].ToString();
            if (st != null || st != "")
            {
                ChangeOfStatus(st, "2", GridView1);
            }
            GridView1.DataBind();
        }

        protected void LBStatusInProcess_Click(object sender, EventArgs e)
        {
            string selectedStatus = "1"; 
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE o.fk_status_order = '" + selectedStatus + "' ORDER BY date DESC";
            GridView1.DataBind();
        }

        protected void LBStatusCompleted_Click(object sender, EventArgs e)
        {
            string selectedStatus = "2";
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE o.fk_status_order = '" + selectedStatus + "' ORDER BY date DESC";
            GridView1.DataBind();
        }

        protected void LBStatusSent_Click(object sender, EventArgs e)
        {
            string selectedStatus = "7";
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE o.fk_status_order = '" + selectedStatus + "' ORDER BY date DESC";
            GridView1.DataBind();
        }

        protected void LBStatusConfirmed_Click(object sender, EventArgs e)
        {
            string selectedStatus = "6";
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN [order] o ON od.id_orderod = o.id_order INNER JOIN [user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer WHERE o.fk_status_order = '" + selectedStatus + "' ORDER BY date DESC";
            GridView1.DataBind();
        }

        protected void LBSortByDateDesc_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN[order] o ON od.id_orderod = o.id_order INNER JOIN[user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer ORDER by date Desc";
            GridView1.DataBind();
        }

        protected void LBSortByDateAsce_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT u.id_user, o.id_order, o.[date], st.status_order_name, t.name AS transport_name, m.manufacturer_name AS manufacturer FROM order_details od INNER JOIN[order] o ON od.id_orderod = o.id_order INNER JOIN[user] u ON o.fk_user = u.id_user INNER JOIN status_order st ON o.fk_status_order = st.id_status_order INNER JOIN transport t ON od.fk_transport = t.id_transport INNER JOIN manufacturer m ON t.fk_manufacturer = m.id_manufacturer ORDER by date Asc";
            GridView1.DataBind();
        }

        protected void LBAllUsers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        protected void LBReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }
    }
}