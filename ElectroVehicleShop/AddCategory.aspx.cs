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
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnAddCategory_Click(object sender, EventArgs e)
        {
            string categoryName = TBCategoryName.Text.Trim();
            if (!string.IsNullOrEmpty(categoryName))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["electro_transportConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Category (category_name) VALUES (@category_name)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@category_name", categoryName);
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                Response.Redirect("Categories.aspx");
            }
        }

        protected void BtnBackToCategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories.aspx");
        }
    }
}