using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.UtilFolder
{
    public class Security
    {
        public byte[] encryptData(string data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public string md5(string data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-", "").ToLower();
        }

        public string encryptPassword(string password)
        {
            string result = md5(password);
            result = result.Substring(5, 1) + result.Substring(0, 17) + result.Substring(18, 2) + result.Substring(25, 7) + result.Substring(27, 3) + result.Substring(17, 8) + result.Substring(9, 2);
            return result;
        }
    }
}
