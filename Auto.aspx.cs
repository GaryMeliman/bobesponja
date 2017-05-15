using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Auto : System.Web.UI.Page
{
    string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
    int id;
    int mPrecio;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Request.Params.Get("id"));
        if (Session["id_usuario"] == null)
        {
            Response.Redirect("Default.aspx");
        }
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
                    mPrecio = reader.GetInt32(2);
                }
                con.Close();
            }
        }
    }

    protected void comprar_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("comprar"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_car", id);
                cmd.Parameters.AddWithValue("@id_usuario", Convert.ToInt32(Session["id_usuario"]));
                cmd.Parameters.AddWithValue("@total", mPrecio);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Index.aspx");
            }
        }
    }
}