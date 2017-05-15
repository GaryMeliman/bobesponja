using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reporte : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id_usuario"] == null || !Session["tipo"].Equals("admin"))
        {
            Response.Redirect("Default.aspx");
        }
    }
}