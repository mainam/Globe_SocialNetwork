using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataAccess
{
    public class ErrorCls
    {
        public String Message;
        public ErrorCls(String message)
        {
            this.Message = message;
        }
    }
}