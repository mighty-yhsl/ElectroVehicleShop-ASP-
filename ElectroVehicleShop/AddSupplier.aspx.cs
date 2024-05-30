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
    public partial class AddSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void BtnAddManufacturer_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Открытие соединения
                connection.Open();

                // Создание команды для добавления нового поставщика
                SqlCommand command = new SqlCommand("INSERT INTO supplier (fk_supplier_country, supplier_name, supplier_address, supplier_registration_date, supplier_email, supplier_phone, supplier_rating) " +
                                                      "VALUES (@CountryId, @SupplierName, @SupplierAddress, @RegistrationDate, @Email, @Phone, @Rating)", connection);
                command.Parameters.AddWithValue("@CountryId", DDSupplierCountry.Text);
                command.Parameters.AddWithValue("@SupplierName", TBManufacturerName.Text);
                command.Parameters.AddWithValue("@SupplierAddress", TBSupplierAddress.Text);
                command.Parameters.AddWithValue("@RegistrationDate", DateTime.Parse(TBSupplierRegistrationDate.Text));
                command.Parameters.AddWithValue("@Email", TBSupplierEmail.Text);
                command.Parameters.AddWithValue("@Phone", TBSupplierPhone.Text);
                command.Parameters.AddWithValue("@Rating", float.Parse(TBSupplierRating.Text, CultureInfo.InvariantCulture).ToString("F2"));

                // Выполнение команды
                command.ExecuteNonQuery();

                // Закрытие соединения
                connection.Close();

                // Перенаправление на страницу со списком поставщиков
                Response.Redirect("Suppliers.aspx");
            }
        }

        protected void BtnBackToManufacturers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Suppliers.aspx");
        }
    }
}