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
    public partial class ViewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Check();
            if (!IsPostBack)
            {
                if (Session["id_user"] != null)
                {
                    Literal1.Text = Session["surname"].ToString();
                    Literal2.Text = Session["name"].ToString();
                    Literal4.Text = Session["id_user"].ToString();
                    Literal5.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    GridView1.Visible = true;
                    GridView2.Visible = false;
                    GridView3.Visible = false;
                }
                else
                {
                    Literal5.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    LBCreateOrder.Visible = false;
                    LBPersonalCabinet.Visible = false;
                }
            }
        }
        protected void Check()
        {
            string st = (string)Session["status"];
            switch (st)
            {
                case "3":
                    LBAddNewProduct.Visible = false;
                    LBCategories.Visible = false;
                    LBManufacturers.Visible = false;
                    LBSuppliers.Visible = false;
                    break;
                case "1":
                    LBCategories.Visible = true;
                    LBAddNewProduct.Visible = true;
                    LBManufacturers.Visible = true;
                    LBSuppliers.Visible = true;
                    break;
                case "2":
                    LBAddNewProduct.Visible = false;
                    LBCategories.Visible = false;
                    LBManufacturers.Visible = false;
                    LBSuppliers.Visible = false;
                    break;
                case "":
                    LBAddNewProduct.Visible = false;
                    LBCategories.Visible = false;
                    LBManufacturers.Visible = false;
                    LBSuppliers.Visible = false;
                    break;
                case null:
                    LBAddNewProduct.Visible = false;
                    LBCategories.Visible = false;
                    LBManufacturers.Visible = false;
                    LBSuppliers.Visible = false;
                    break;
            }
        }

        protected void LBAllManufacturer_Click(object sender, EventArgs e)  //Все
        {
            Session["id_manufacturer"] = null;
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        protected void LBSamsung_Click(object sender, EventArgs e)  //SAMSUNG
        {
            Session["id_manufacturer"] = "1";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }

        protected void LBApple_Click(object sender, EventArgs e)  //APPLE
        {
            Session["id_manufacturer"] = "2";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }
        protected void LBSony_Click(object sender, EventArgs e)
        {
            Session["id_manufacturer"] = "3";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
        }

        protected void LBLg_Click(object sender, EventArgs e)
        {
            Session["id_manufacturer"] = "4";
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_transport"] = GridView1.SelectedDataKey.Values["id_transport"].ToString();
            Response.Redirect("ProductDescription.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["id_transport"] = GridView2.SelectedDataKey.Values["id_transport"].ToString();
            Response.Redirect("ProductDescription.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void LBMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartPage.aspx");
        }

        protected void LBAddNewProduct_Click(object sender, EventArgs e)
        {

        }

        protected void LBCategories_Click(object sender, EventArgs e)
        {

        }

        protected void LBManufacturers_Click(object sender, EventArgs e)
        {

        }

        protected void LBSuppliers_Click(object sender, EventArgs e)
        {

        }
        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string keyword = searchTextBox.Text.Trim();

            // Устанавливаем параметр для фильтрации по ключевому слову
            SqlDataSource3.SelectParameters["productName"].DefaultValue = keyword;
            GridView1.Visible = false;
            // Обновляем данные в GridView3 с учетом нового фильтра
            GridView3.DataBind();
            GridView3.Visible = true;
            searchTextBox.Text = "";
        }
    }
}