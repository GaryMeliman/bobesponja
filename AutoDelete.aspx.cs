using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AutoDelete : System.Web.UI.Page
{
    string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
    int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_usuario"] == null || !Session["tipo"].Equals("admin"))
        {
            Response.Redirect("Default.aspx");
        }
        id = Convert.ToInt32(Request.Params.Get("id"));
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT nombre_marca, nombre_modelo, precio FROM car JOIN marca ON marca.id_marca = car.id_marca JOIN modelo ON modelo.id_modelo = car.id_modelo WHERE id_car = @id"))
            {
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    this.marca.Text = "Marca: " + reader.GetString(0);
                    this.modelo.Text = "Modelo: " + reader.GetString(1);
                    this.precio.Text = "Precio: " + reader.GetInt32(2);
                }
                con.Close();
            }
        }
    }

    protected void Borrar_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE car WHERE id_car = @id_car"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@id_car", id);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Admin.aspx");
            }
        }
    }
}