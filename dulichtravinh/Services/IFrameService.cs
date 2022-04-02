using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace dulichtravinh.Services
{
    public class GeoGraphic
    {
        private double longtitude;

        private double latitude;

        public GeoGraphic(double longtitude, double latitude)
        {
            this.longtitude = longtitude;
            this.latitude = latitude;
        }
        public double Longtitude
        {
            get { return longtitude; }
            set { longtitude = value; }
        }
        public double Latitude
        {
            get { return latitude; }
            set { latitude = value; }
        }
    }
    public class IFrameService
    {
        public static GeoGraphic getLocationFromIframe(string iframe)
        {
            string pattern = @"2d\d{1,10}.\d{1,20}!3d\d{1,10}.\d{1,20}";
            Regex reg = new Regex(pattern);
            var result = reg.Match(iframe);
            var splited = result.ToString().Split('!');

            double longtitude = double.Parse(splited[0].Substring(2));
            double latitude = double.Parse(splited[1].Substring(2));  
            return new GeoGraphic(longtitude, latitude);
        }
    }
}