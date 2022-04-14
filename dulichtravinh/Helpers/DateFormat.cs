using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dulichtravinh.Helpers
{
    public class DateFormat
    {
        // https://stackoverflow.com/questions/11/calculate-relative-time-in-c-sharp
        public static string diffForHuman(DateTime input)
        {
            TimeSpan oSpan = DateTime.Now.Subtract(input);
            double TotalMinutes = oSpan.TotalMinutes;
            string Suffix = " trước";

            if (TotalMinutes < 0.0)
            {
                TotalMinutes = Math.Abs(TotalMinutes);
                Suffix = " from now";
            }

            var aValue = new SortedList<double, Func<string>>();
            aValue.Add(0.75, () => "ít hơn 1 phút");
            aValue.Add(1.5, () => "khoảng hơn 1 phút");
            aValue.Add(45, () => string.Format("{0} phút", Math.Round(TotalMinutes)));
            aValue.Add(90, () => "khoảng 1 giờ");
            aValue.Add(1440, () => string.Format("khoảng {0} giờ", Math.Round(Math.Abs(oSpan.TotalHours)))); // 60 * 24
            aValue.Add(2880, () => "1 ngày trước"); // 60 * 48
            aValue.Add(43200, () => string.Format("{0} ngày", Math.Floor(Math.Abs(oSpan.TotalDays)))); // 60 * 24 * 30
            aValue.Add(86400, () => "khoảng 1 tháng"); // 60 * 24 * 60
            aValue.Add(525600, () => string.Format("{0} tháng", Math.Floor(Math.Abs(oSpan.TotalDays / 30)))); // 60 * 24 * 365 
            aValue.Add(1051200, () => "khoảng 1 năm"); // 60 * 24 * 365 * 2
            aValue.Add(double.MaxValue, () => string.Format("{0} năm", Math.Floor(Math.Abs(oSpan.TotalDays / 365))));

            return aValue.First(n => TotalMinutes < n.Key).Value.Invoke() + Suffix;
        }
    }
}