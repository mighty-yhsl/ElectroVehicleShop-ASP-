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
    public partial class EditingOrderCart : System.Web.UI.Page
    {
        // // Оголошення відкритого (public) об'єкта objCart класу-колекції Cart
        public Cart objCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id_user"] != null)
                {
                    Literal1.Text = Session["surname"].ToString();
                    Literal2.Text = Session["name"].ToString();
                    Literal4.Text = Session["id_user"].ToString();
                    Literal7.Visible = false;  //Інформація про замовлення з БД
                    Literal8.Visible = false;  //Сума замовлення 
                    GridView2.Visible = false;
                }
                else
                {
                    Response.Redirect("ViewProducts.aspx");
                }
            }
         
            if (Session["CountUnit"] == null || Session["CountUnit"].ToString() == "-1" ||
                Session["CountUnit"].ToString() == "0")
            {
                GridView1.Visible = false;
                Literal5.Text = "У Вашому кошику замовлення немає товарів";
                BCreateOrder.Visible = false;
                Literal6.Visible = false;
            }
            else
            {
                objCart = (Cart)Session["Cart"];
                GridView1.DataSource = objCart;
                GridView1.DataBind();
                Literal5.Text = "Ваш кошик замовлення";
                BCreateOrder.Visible = true;
                Literal6.Visible = true;  //Сума кошику замовлення
                decimal cost = 0.00m;
                foreach (CartUnit obj in objCart)
                {
                    cost = cost + Convert.ToDecimal(obj.cost);
                }
                Literal6.Text = "Сума замовлення: " + cost.ToString("0.00");
            }
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
        protected void LBPersonalCabinet_Click(object sender, EventArgs e)  //Особистий кабінет
        {
            Response.Redirect("PersonalOffice.aspx");
        }
        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            objCart = (Cart)Session["Cart"];
            int Count = Convert.ToUInt16(objCart.Count);
            decimal cost = 1.00m;
            if (e.CommandName == "ButtonGr1")   //збільшити
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int k = Convert.ToInt16(objCart[index].total_amount) + 1;
                objCart[index].total_amount = Convert.ToString(k);
                cost = cost * Convert.ToDecimal(objCart[index].price);
                cost = (decimal)(cost * k);
                cost = Math.Round(cost, 2);
                objCart[index].cost = cost.ToString("0.00");
                cost = 0.00m;
                foreach (CartUnit obj in objCart)
                {
                    cost = cost + Convert.ToDecimal(obj.cost);
                }
                Literal6.Text = "Сума замовлення: " + cost.ToString("0.00");
            }
            if (e.CommandName == "ButtonGr2")  //зменшити
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int k = Convert.ToInt16(objCart[index].total_amount);
                if (k > 1)
                {
                    k = k - 1;
                    objCart[index].total_amount = Convert.ToString(k);
                    cost = cost * Convert.ToDecimal(objCart[index].price);
                    cost = (decimal)(cost * k);
                    cost = Math.Round(cost, 2);
                    objCart[index].cost = cost.ToString("0.00");
                    cost = 0.00m;
                    foreach (CartUnit obj in objCart)
                    {
                        cost = cost + Convert.ToDecimal(obj.cost);
                    }
                    Literal6.Text = "Сума замовлення: " + cost.ToString("0.00");
                }
            }
            if (e.CommandName == "ButtonGr3")  //видалити
            {
                int index = Convert.ToInt32(e.CommandArgument);
                objCart.RemoveAt(index);
                Count = Convert.ToUInt16(objCart.Count);
                Session["CountUnit"] = Count.ToString();
                if (Count <= 0)
                {
                    Literal5.Text = "У Вашому кошику замовлення немає товарів";
                    BCreateOrder.Visible = false;
                    GridView1.Visible = false;
                }
            }
            GridView1.DataSource = objCart;
            GridView1.DataBind();
            Session["Cart"] = objCart;
        }

        protected void BCreateOrder_Click(object sender, EventArgs e) //Оформити замовлення
        {
            Literal7.Visible = true;
            Literal8.Visible = true;
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            //id_zakaz не указываем, т.к. этот ключ имееет свойство AutoIncrement
            string sql = "INSERT INTO [order] (fk_user, date, price) VALUES (@fk_user, @date, @price)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            //id  клиента хранится в сесии, это id_student
            cmd.Parameters.Add("@fk_user", SqlDbType.Int, 4);
            cmd.Parameters["@fk_user"].Value = Convert.ToInt16(Session["id_user"]);
            cmd.Parameters.Add("@date", SqlDbType.DateTime);
            cmd.Parameters["@date"].Value = DateTime.Today.ToShortDateString(); //поточна  дата;
            cmd.Parameters.Add("@price", SqlDbType.Decimal);
            cmd.Parameters["@price"].Value = Convert.ToDecimal(Literal6.Text.Replace("Сума замовлення: ", ""));
            con.Open();
            //заносим запись в таблицу order
            cmd.ExecuteNonQuery();
            //Получаем id заказа
            sql = "SELECT TOP (1) id_order,price FROM [order] WHERE (fk_user = ";
            sql = sql + Session["id_user"].ToString() + ")";
            sql = sql + " ORDER BY id_order DESC";
            cmd = new SqlCommand(sql, con);
            //создаем объект SqlDataReader и читаем в него значение ключа id_zakaz
            SqlDataReader drOrderID = cmd.ExecuteReader();
            drOrderID.Read();
            //сохраняем значение ключа id_zakaz в сессии
            Session["id_order"] = drOrderID["id_order"].ToString();
            decimal orderPrice = Convert.ToDecimal(drOrderID["price"]);
            drOrderID.Close();
            //Заносим данные корзины в таблицу Shopping_Cart, зная значение id_zakaz
            sql = "INSERT INTO order_details (id_orderod, fk_transport, total_amount, total_price) VALUES (@id_orderod,@fk_transport,@total_amount,@total_price)";
            //Данные в таблицу Shopping_Cart заносим с помощью цикла foreach
            //итератор цикла foreach - объект obj класса CartUnit
            //объекты класса CartUnit находятся в объекте objCart класса-коллекции Cart
            //цикл foreach последовательно проссматиривает все объекты obj коллекции objCart
            foreach (CartUnit obj in objCart)
            {
                int transportId = Convert.ToInt32(obj.id_transport);
                string transportName = GetTransportName(transportId);
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@id_orderod", SqlDbType.Int, 4);
                cmd.Parameters["@id_orderod"].Value = Convert.ToInt16(Session["id_order"]);
                cmd.Parameters.Add("@fk_transport", SqlDbType.Int, 4);
                cmd.Parameters["@fk_transport"].Value = transportId;
                cmd.Parameters.Add("@total_amount", SqlDbType.Int, 4);
                cmd.Parameters["@total_amount"].Value = Convert.ToInt16(obj.total_amount);
                cmd.Parameters.Add("@total_price", SqlDbType.Decimal);
                cmd.Parameters["@total_price"].Value = orderPrice;
                cmd.ExecuteNonQuery();
            }
            con.Close();
            GridView2.Visible = true;
            GridView2.DataBind();
            decimal cost = 0.00m;
            foreach (CartUnit obj in objCart)
            {
                cost = cost + Convert.ToDecimal(obj.cost);
            }
            Session["date"] = DateTime.Today.ToString("dd/MM/yyyy");
            Literal7.Text = "Ваше замовлення оформлене. Дата замовлення:" + Session["date"].ToString() +
                "   Номер замовлення:" + Session["id_order"].ToString();
            Literal8.Text = "Сума замовлення: " + cost.ToString("0.00");
        }

        public string GetTransportName(int transportId)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT name FROM transport WHERE id_transport = @transportId";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@transportId", transportId);
                con.Open();
                string transportName = cmd.ExecuteScalar()?.ToString();
                return transportName;
            }
        }
    }

}