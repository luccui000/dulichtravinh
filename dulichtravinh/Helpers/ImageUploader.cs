using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dulichtravinh.Helpers
{
    public class ImageUploader
    {
        public static string upload(FileUpload fileUpload, string targetDir)
        {
            if(!fileUpload.HasFile)
            {
                return null;
            } 
            
            string fileName = "/" + targetDir.Trim('/') + '/' + DateTime.Now.ToString("ddMMyyyy_HHmmss") + "_" + fileUpload.FileName;
            string filePath = HttpContext.Current.Server.MapPath(fileName);
            fileUpload.SaveAs(filePath);
            return fileName; 
        }
    }
}