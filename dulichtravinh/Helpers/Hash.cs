using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace dulichtravinh.Helpers
{
    public class Hash
    {
        public static string make(string input)
        {
            var hash = new SHA1Managed().ComputeHash(Encoding.UTF8.GetBytes(input));
            return string.Concat(hash.Select(b => b.ToString("x2")));
        }
    }
    // Hash.make('matkhau') => 'jfhakâa
}