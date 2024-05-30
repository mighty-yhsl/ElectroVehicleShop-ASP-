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
    public partial class ProductDescription : System.Web.UI.Page
    {
        // Оголошення відкритого (public) об'єкта objCart класу-колекції Cart
        public Cart objCart;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Першою завантажується ViewProducts.aspx
            // це вказано в настроюваннях властивостей проекту PlacingAnOrder 

            //Можна контролювати інакше, наприклад:
            // Якщо першими завантажувати ProductDescription.aspx чи EditingOrderCart.aspx
            // значення змінної сесії id дорівнюватиме null
            // і відбудеться перехід до стартової ViewProducts.aspx
            // Якщо першою була завантажена ViewProducts.aspx
            // то змінні сесії не дорівнюють null, завантаження відбувається із заповненням літералів           
            /*string id = Convert.ToString(Session["id_client"]);
            if (id == null || id == "") {
                Response.Redirect("ViewProducts.aspx"); } */

            if (Session["CountUnit"] == null)
            {
                Cart objCart = new Cart();
                Session["Cart"] = objCart;
                Session["CountUnit"] = "0";
            }
            Check();
            // Один із способів контролю вибору товару
            /*if (Session["id_product"] == null){
                DetailsView1.Visible = false; }*/

            if (!IsPostBack)
            {
                if (Session["id_user"] != null)
                {
                    Literal1.Text = Session["surname"].ToString();
                    Literal2.Text = Session["name"].ToString();
                    Literal4.Text = Session["id_user"].ToString();
                    Literal5.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    Literal6.Text = Session["CountUnit"].ToString();
             
                }
                else
                {
                    Literal5.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    LBCreateOrder.Visible = false;
                    BAddToCartUp.Visible = false;
                    BCreateOrderUp.Visible = false;
                    BAddToCartDown.Visible = false;
                    BCreateOrderDown.Visible = false;
                    BEditProduct.Visible = false;
                }
            }
        }

        protected void Check()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "3":
                    BEditProduct.Visible = false;
                    BDeleteProduct.Visible = false;
                    break;
                case "1":
                    BEditProduct.Visible = true;
                    BDeleteProduct.Visible = true;
                    break;
                case "2":
                    BEditProduct.Visible = false;
                    BDeleteProduct.Visible = false;
                    break;
                case "":
                    BEditProduct.Visible = false;
                    BDeleteProduct.Visible = false;
                    break;
                case null:
                    BEditProduct.Visible = false;
                    BDeleteProduct.Visible = false;
                    break;
            }
        }
        protected void LBView_Click(object sender, EventArgs e) //Стислий перегляд
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

        protected void BAddToCartUp_Click(object sender, EventArgs e)  //Додати до кошику
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string sql = "SELECT id_transport, name, price FROM transport WHERE(id_transport =" + Session["id_transport"].ToString() + ")";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader drWebUser = cmd.ExecuteReader();
            drWebUser.Read();
            objCart = (Cart)Session["Cart"];
            CartUnit objCartUnit = new CartUnit();
            objCartUnit.id_transport = drWebUser["id_transport"].ToString();
            objCartUnit.total_amount = "1";
            objCartUnit.name = drWebUser["name"].ToString();
            objCartUnit.price = drWebUser["price"].ToString();
            objCartUnit.cost = drWebUser["price"].ToString();
            objCart.Add(objCartUnit);
            drWebUser.Close();
            con.Close();
            Session["Cart"] = objCart;
            Session["CountUnit"] = objCart.Count.ToString();
            Literal6.Text = Session["CountUnit"].ToString();
        }

        protected void BCreateOrderUp_Click(object sender, EventArgs e)  //Оформити замовлення
        {
            Response.Redirect("EditingOrderCart.aspx");
        }

        protected void BBackToProductsUp_Click(object sender, EventArgs e)  //Повернутися до перегляду товарів
        {
            Response.Redirect("ViewProducts.aspx");
        }

        protected void BAddToCartDown_Click(object sender, EventArgs e)
        {
            BAddToCartUp_Click(sender, e);
        }

        protected void BCreateOrderDown_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditingOrderCart.aspx");
        }

        protected void BBackToProductsDown_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProducts.aspx");
        }

        protected void BEditProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProduct.aspx?id_transport=" + Session["id_transport"]);
        }

        protected void BDeleteProduct_Click(object sender, EventArgs e)
        {
            int idTransport = Convert.ToInt32(Session["id_transport"]);

            // Отримання рядка підключення з файлу конфігурації
            string connectionString = ConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;

            // Підключення до бази даних
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Відкриття підключення
                connection.Open();

                // Створення SQL-запиту для видалення товару за його ID
                string query = "DELETE FROM transport WHERE id_transport = @id_transport";

                // Створення об'єкта команди SQL з параметром для ID товару
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Додавання параметру ID товару до команди
                    command.Parameters.AddWithValue("@id_transport", idTransport);

                    // Виконання команди SQL для видалення товару
                    command.ExecuteNonQuery();
                }
            }
            Response.Redirect("ViewProducts.aspx");
        }
    }
}