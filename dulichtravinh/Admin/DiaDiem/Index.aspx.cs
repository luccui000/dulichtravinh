using dulichtravinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace dulichtravinh
{
    public partial class WebForm2 : Model
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AddParameterToCmd addParameterToCmd = new AddParameterToCmd(addParameter);
            this.bindingGridView(grvDiaDiem, "SP_DanhSachDiaDiemTheoNgonNgu", addParameterToCmd, true);
        }
        public void addParameter(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("BanDich", "VietNam");
        }
    }
}