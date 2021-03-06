﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_usuario"] == null || !Session["tipo"].Equals("admin"))
        {
            Response.Redirect("Default.aspx");
        }

        string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT id_car, nombre_marca AS Marca, nombre_modelo AS Modelo, precio AS Precio FROM car JOIN marca ON marca.id_marca = car.id_marca JOIN modelo ON modelo.id_modelo = car.id_modelo"))
            {
                cmd.Connection = con;
                con.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                this.Autos.DataSource = dt;
                this.Autos.DataBind();
                con.Close();
            }
        }
    }
}