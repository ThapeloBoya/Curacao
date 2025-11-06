<%@ WebHandler Language="C#" Class="geoHandler" %>

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web;


public class geoHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string ip = "";
        if (context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            ip = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
        }
        if (String.IsNullOrEmpty(ip) && context.Request.ServerVariables["REMOTE_ADDR"] != null)
        {
            ip = context.Request.ServerVariables["REMOTE_ADDR"].ToString();
        }
       

        string country_name = "";
        string country_code = "";
        bool showCompanyInfo = false;

        // check country
        try
        {
            WebRequest request = (WebRequest)WebRequest.Create("https://ipfind.co/?ip=" + ip + "&auth=83c4d481-4e55-4601-806e-5e0732e5e8ef");
            using (StreamReader reader = new StreamReader(request.GetResponse().GetResponseStream()))
            {
                JObject jsonResponse = JObject.Parse(reader.ReadToEnd());
                country_name = jsonResponse["country"].ToString();
                country_code = jsonResponse["country_code"].ToString();
            }
            if (country_name.ToLower() == "hungary")
                context.Response.Redirect("https://www.casinolariviera.net/NotAuthorized.html");
            //imgfooter2.Visible = false;
            // Response.Write("country:" + country_name);
            request = (WebRequest)WebRequest.Create("http://pixeltracking.mrzeebet.com:203/GeoSettingsExtended.ashx?CasinoID=115&CountryCode=" + country_code);
            using (StreamReader reader = new StreamReader(request.GetResponse().GetResponseStream()))
            {
                //JObject jsonResponse = JObject.Parse(reader.ReadToEnd());
                //showCompanyInfo = jsonResponse["ShowCompanyInfo"] != null ? Convert.ToBoolean(jsonResponse["ShowCompanyInfo"]) : false;
                string str = reader.ReadToEnd();

                context.Response.Write(str);

                //showCompanyInfo = tt != null ? Convert.ToBoolean(tt) : false;
            }
        }
        catch (Exception ex1)
        {
            //Response.Write("geoip:"  + ex1.Message);
        }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}