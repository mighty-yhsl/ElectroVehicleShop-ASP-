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
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LBAddCategory_Click(object sender, EventArgs e)
        {
            // Redirect to Add Category page or open a modal for adding category
            Response.Redirect("AddCategory.aspx");
        }

        protected void LBBackToCatalog_Click(object sender, EventArgs e)
        {
            // Redirect back to the product catalog
            Response.Redirect("ViewProducts.aspx");
        }
    }
}