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
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LBBackToAdminPanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx"); 
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Get the controls in the edit template
            TextBox txtName = (TextBox)row.FindControl("txtName");
            TextBox txtSurname = (TextBox)row.FindControl("txtSurname");
            TextBox txtLogin = (TextBox)row.FindControl("txtLogin");
            TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
            TextBox txtAddress = (TextBox)row.FindControl("txtAddress");
            DropDownList ddlRole = (DropDownList)row.FindControl("ddlRole");

            if (txtName != null)
                e.NewValues["name"] = txtName.Text;
            if (txtSurname != null)
                e.NewValues["surname"] = txtSurname.Text;
            if (txtLogin != null)
                e.NewValues["login"] = txtLogin.Text;
            if (txtPhone != null)
                e.NewValues["phone"] = txtPhone.Text;
            if (txtAddress != null)
                e.NewValues["address"] = txtAddress.Text;
            if (ddlRole != null)
                e.NewValues["fk_role"] = ddlRole.SelectedValue;

            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
    }
}