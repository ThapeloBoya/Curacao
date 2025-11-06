using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Net;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Only on Live to Lobby
        //Response.Redirect("https://lobby.larivieracasino.net:2072/lobby.aspx?skinId=2&redirect=0");
        Response.Redirect("home.html");
    }
   
}