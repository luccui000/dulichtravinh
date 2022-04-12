﻿using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using dulichtravinh.Helpers;
using System.Web.Configuration;

namespace dulichtravinh
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        public int Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["Id"]))
                Response.Redirect("/");

            bool isNumeric = int.TryParse(Request.QueryString["Id"], out Id);
            if (!isNumeric) 
                Response.Redirect("/"); 
            if (isNumeric)
            {
                DiaDiem diaDiem = new DiaDiem();
                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_TimDiaDiemTheoIdVaNgonNgu", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@BanDich", "VietNam");
                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();  
                    while(reader.Read())
                    {
                        lblTenDiaDiem.Text = reader.GetString(2); 
                        lblMoTaNgan.Text = reader.GetString(3);
                        lblMoTa.Text = reader.GetString(4);
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally { conn.Close(); } 
            } else
            {
                Response.Redirect("/");
            }

        } 
        protected void loginWithGoogle_click(object sender, EventArgs e)
        {
            
            string url = String.Format(
                "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri={0}&response_type=code&client_id={1}",
                Constant.GOOGLE_REDIRECT_URL,
                Constant.GOOGLE_CLIENT_ID
            );
            Session["previous_url"] = Request.Url;
            Response.Redirect(url);
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {

        }
    }
}