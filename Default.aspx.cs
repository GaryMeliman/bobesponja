using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["id_usuario"] != null)
        {
            Response.Redirect("Index.aspx");
        }
    }

    protected void ValidateUser(object sender, EventArgs e)
    {
        int userId = 0;
        string tipo = "";
        string constr = @"Data Source=DESKTOP-CFHNB0F\SQLEXPRESS;Initial Catalog=autos;Integrated Security=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User"))
            {
                cmd.Connection = con;
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Correo", Login1.UserName);
                cmd.Parameters.AddWithValue("@Password", Login1.Password);
                cmd.Parameters.Add(new SqlParameter("@UserId", SqlDbType.Int, 20, ParameterDirection.Output, false, 0, 10, "@UserId", DataRowVersion.Default, null));
                cmd.Parameters.Add(new SqlParameter("@Tipo", SqlDbType.VarChar, 20, ParameterDirection.Output, true, 0, 20, "@Tipo", DataRowVersion.Default, null));
                //cmd.UpdatedRowSource = UpdateRowSource.OutputParameters;
                cmd.ExecuteNonQuery();
                userId = Convert.ToInt32(cmd.Parameters["@UserId"].Value);
                tipo = (string)cmd.Parameters["@Tipo"].Value;
                con.Close();
            }
            switch (userId)
            {
                case 0:
                    Login1.FailureText = "Correo o contraseña incorrecta";
                    break;
                default:
                    Session.Add("id_usuario",userId);
                    Session.Add("tipo", tipo);
                    Response.Redirect("Index.aspx");
                    break;
            }
        }
    }
}