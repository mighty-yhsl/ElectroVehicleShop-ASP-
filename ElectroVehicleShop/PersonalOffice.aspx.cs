using System;
using System.Collections;
using System.Collections.ObjectModel;
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


namespace ElectroVehicleShop
{
    public partial class PersonalOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string st = Session["id_order"]?.ToString(); 
            if (!string.IsNullOrEmpty(st))
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
            }
            Literal5.Text = Session["surname"].ToString();
            Literal6.Text = Session["name"].ToString();
            Literal8.Text = Session["id_user"].ToString();
            Session["date"] = DateTime.Today.ToString("dd/MM/yyyy");
            Literal9.Text = Session["date"].ToString();
        }

        protected void LBView_Click(object sender, EventArgs e)  //Стислий перегляд
        {
            Response.Redirect("ViewProducts.aspx");
        }

        protected void LBShortView_Click(object sender, EventArgs e)  //Детальний перегляд
        {
            Response.Redirect("ProductDescription.aspx");
        }

        protected void LBCreateOrder_Click(object sender, EventArgs e)  //Оформити замовлення
        {
            Response.Redirect("EditingOrderCart.aspx");
        }

        protected void LBCurretnOrder_Click(object sender, EventArgs e) //Поточне замовлення
        {
            string st = Session["id_order"].ToString();
            if (st != null || st != "")
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
            }
        }

        protected void LBHistoryOrders_Click(object sender, EventArgs e)  //Історія замовлень
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ButtonY")   //ПІДВЕРДИТИ
            {
                int index = Convert.ToInt32(e.CommandArgument);  //індекс обраного рядка 
                GridViewRow row = GridView2.Rows[index];         //обраний рядок 
                string id_order = row.Cells[0].Text;             //id_order в Cells[0]
                string fk_status_order = "6";   //ПІДВЕРДЖЕНИЙ
                ChangeOfStatus(id_order, fk_status_order, GridView2);
            }
            if (e.CommandName == "ButtonN")   //ВІДМОВИТИСЯ
            {
                int index = Convert.ToInt32(e.CommandArgument);  //індекс обраного рядка 
                GridViewRow row = GridView2.Rows[index];         //обраний рядок 
                string id_order = row.Cells[0].Text;             //id_order в Cells[0]
                string fk_status_order = "3";   //ВІДМОВА
                ChangeOfStatus(id_order, fk_status_order, GridView2);
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

        protected void Button1_Click(object sender, EventArgs e)  //Підтвердити замовлення
        {
            string st = Session["id_order"].ToString();
            if (st != null || st != "")
            {
                ChangeOfStatus(st, "6", GridView1);
            }
            GridView2.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)  //Відмовитися від замовлення
        {
            string st = Session["id_order"].ToString();
            if (st != null || st != "")
            {
                ChangeOfStatus(st, "3", GridView1);
            }
            GridView2.DataBind();
        }
    }
}