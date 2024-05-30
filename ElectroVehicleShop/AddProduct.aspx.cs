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
using System.Globalization;

namespace ElectroVehicleShop
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["electro_transportConnectionString"]?.ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO transport (fk_manufacturer, fk_supplier, fk_category, name, price, waranty_start_date, description,img_big, img_small, speed, amount, weight) " +
                               "VALUES (@id_manufacturer, @id_supplier, @id_category, @name, @price, @waranty_start_date, @description, @img_big, @img_small, @speed, @amount, @weight)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id_manufacturer", Convert.ToInt32(ProductManufacturer.Text)); // Ensure ProductManufacturer contains the manufacturer ID
                    command.Parameters.AddWithValue("@id_supplier", Convert.ToInt32(ProductSupplier.Text));
                    command.Parameters.AddWithValue("@id_category", Convert.ToInt32(ProductCategory.Text));
                    command.Parameters.AddWithValue("@name", ProductName.Text);
                    command.Parameters.AddWithValue("@price", Convert.ToDecimal(ProductPrice.Text));
                    command.Parameters.AddWithValue("@description", ProductDescription.Text);
                    command.Parameters.AddWithValue("@img_big", ProductImgbig.Text);
                    command.Parameters.AddWithValue("@img_small", ProductImgsmall.Text);
                    command.Parameters.AddWithValue("@waranty_start_date", DateTime.ParseExact(ProductWarrantyDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture));
                    command.Parameters.AddWithValue("@speed", Convert.ToInt32(ProductSpeed.Text));
                    command.Parameters.AddWithValue("@amount", Convert.ToInt32(ProductAmount.Text));
                    command.Parameters.AddWithValue("@weight", Convert.ToInt32(ProductWeight.Text));

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            Response.Redirect("~/ViewProducts.aspx");
        }
    }
    
}