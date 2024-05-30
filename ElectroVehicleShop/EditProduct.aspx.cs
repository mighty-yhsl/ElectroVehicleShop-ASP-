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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id_transport"] != null)
                {
                    Session["id_transport"] = Request.QueryString["id_transport"];
                }
            }
        }
        protected void BBackToProductDescription_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductDescription.aspx");
        }
    }
}