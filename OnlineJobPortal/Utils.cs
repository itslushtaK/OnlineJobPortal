using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineJobPortal
{
    public class Utils
    {
        public static bool IsValidExtension(string fileName)
        {
            string[] fileExtension = { ".jpg", ".jpeg", ".png" };
            return fileExtension.Any(ext => fileName.EndsWith(ext, StringComparison.OrdinalIgnoreCase));
        }

        public static bool IsValidExtension4Resume(string fileName)
        {
            string[] fileExtension = { ".doc", ".docx", ".pdf" };
            return fileExtension.Any(ext => fileName.EndsWith(ext, StringComparison.OrdinalIgnoreCase));
        }
    }
}
