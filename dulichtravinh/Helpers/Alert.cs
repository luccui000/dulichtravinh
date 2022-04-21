using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace dulichtravinh.Helpers
{
    public class Alert
    { 
        public static string Error(string message)
        {  
            string sweetAlertCDN = "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>"; 
            return sweetAlertCDN + "<script>Swal.fire({ icon: 'error', text: '" + message + "' })</script>";
        }
        public static string Success(string message)
        {
            string sweetAlertCDN = "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>";
            return sweetAlertCDN + "<script>Swal.fire({ icon: 'success', text: '" + message + "' })</script>";
        }
    }
}