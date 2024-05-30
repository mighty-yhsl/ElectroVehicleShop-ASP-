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
    public partial class AddManufacturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnAddManufacturer_Click(object sender, EventArgs e)
        {
            string manufacturerName = TBManufacturerName.Text.Trim();
            if (!string.IsNullOrEmpty(manufacturerName))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Manufacturer (manufacturer_name) VALUES (@manufacturer_name)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@manufacturer_name", manufacturerName);
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                Response.Redirect("Manufacturers.aspx");
            }
        }

        protected void BtnBackToManufacturers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manufacturers.aspx");
        }
    }
}