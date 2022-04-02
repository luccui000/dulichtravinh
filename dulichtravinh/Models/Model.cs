using dulichtravinh.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace dulichtravinh.Models
{
    public delegate void AddParameterToCmd(SqlCommand cmd);

    public class Model: System.Web.UI.Page
    {
        protected string connectionString = WebConfigurationManager.ConnectionStrings[Constant.CONNECTION_STRING_NAME].ConnectionString;

        public void bindingGridView(
            GridView gridView, 
            string query, 
            AddParameterToCmd addParameterTo,
            bool isStoreProceduce = false
        ) {  
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand cmd = new SqlCommand(query, connection);
            if (isStoreProceduce)
                cmd.CommandType = CommandType.StoredProcedure; 
            addParameterTo(cmd);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            gridView.DataSource = dt;
            gridView.DataBind();
        } 
    }
}