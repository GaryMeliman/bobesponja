using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AutoCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_usuario"] == null || !Session["tipo"].Equals("admin"))
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {
            string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM marca"))
                {
                    cmd.Connection = con;
                    con.Open();
                    DataTable dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                    Marca.DataSource = dt.DefaultView;
                    Marca.DataValueField = "id_marca";
                    Marca.DataTextField = "nombre_marca";
                    Marca.DataBind();
                    con.Close();
                }
            }
        }
    }

    protected void Crear_Click(object sender, EventArgs e)
    {
        string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO car VALUES(@idmarca,@idmodelo,@precio)"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@idmarca", Convert.ToInt32(Marca.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@idmodelo", Convert.ToInt32(Modelo.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@precio", Convert.ToInt32(Precio.Text));
                cmd.ExecuteNonQuery();
                Response.Redirect("Admin.aspx");
                con.Close();
            }
        }
    }

    protected void Marca_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM modelo WHERE id_marcar = @idmarca"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@idmarca", Convert.ToInt32(Marca.SelectedItem.Value));
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                Modelo.DataSource = dt.DefaultView;
                Modelo.DataValueField = "id_modelo";
                Modelo.DataTextField = "nombre_modelo";
                Modelo.DataBind();
                con.Close();
            }
        }
    }
}