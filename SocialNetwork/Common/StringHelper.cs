using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Office.Interop.Excel;

namespace SocialNetwork.Common
{
    public class StringHelper
    {
        /// <summary>
        /// Propertype array separators
        /// </summary>
        public static string[] separators = { "," };

        public static string separatorsKey = ",";

        /// <summary>
        /// Propertype add value to list
        /// </summary>
        public static int ADD = 0;

        /// <summary>
        /// Propertype remove value in list
        /// </summary>
        public static int REMOVE = 1;

        /// <summary>
        /// Propertype check exits remove, not exits add
        /// </summary>
        public static int ADDORREMOVE = 2;

        /// <summary>
        /// Function contains string
        /// </summary>
        /// <param name="addOrRemove">Type add,remove,addorremove</param>
        /// <param name="listString">listString</param>
        /// <param name="separators">separators</param>
        /// <param name="value">value</param>
        /// <returns></returns>
        public static List<string> ContainsString(int addOrRemove, string listString, string[] separators,
            string value)
        {
            string[] stringArray = null;
            List<string> list = new List<string>();
            if (!string.IsNullOrWhiteSpace(listString))
            {
                stringArray = listString.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                list = new List<string>(stringArray);
            }

            if (!string.IsNullOrEmpty(value))
            {
                if (addOrRemove == StringHelper.ADD)
                {
                    if (!list.Contains(value))
                    {
                        list.Add(value);
                    }
                }
                if (addOrRemove == StringHelper.REMOVE)
                {
                    if (list.Contains(value))
                    {
                        list.Remove(value);
                    }
                }
                if (addOrRemove == StringHelper.ADDORREMOVE)
                {
                    if (list.Contains(value))
                    {
                        list.Remove(value);
                    }
                    else
                    {
                        list.Add(value);
                    }
                }
            }
            return list;
        }

        /// <summary>
        /// Function list string to string add separators
        /// </summary>
        /// <param name="listString">List listString</param>
        /// <param name="separatorsKey">separatorsKey</param>
        /// <returns></returns>
        public static string ToString(List<string> listString, string separatorsKey)
        {
            if (listString == null)
            {
                return "";
            }
            else
            {
                var strings = string.Join(separatorsKey, listString);
                return strings;

            }
        }

        public static string SubString(string content, int countCharactor)
        {
            string[] list = content.Split(' ');
            List<string> listString = new List<string>();
            foreach (var item in list)
            {
                listString.Add(item);
                if (listString.Count == countCharactor)
                {
                    break;
                }
            }
            return StringHelper.ToString(listString, " ");
        }
    }
}