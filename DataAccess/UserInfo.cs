using DataAccess.Db.UserDB;
using DataAccess.UtilFolder;
using System;
using System.Linq;

namespace DataAccess
{
    public class UserInfo
    {
        public static Object Login(UserDbDataContext context, String username, String password)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == username);
            if (user == null)
                throw new Exception("Tài khoản không tồn tại");
            if (user.Password == password)
            {
                user.LastLogin = DateTime.Now;
                user.Token = StringUtils.encryptPassword(DateTime.Now.ToString() + user.UserName);
                context.SubmitChanges();
                return user;
            }
            else
                throw new Exception("Sai mật khẩu");
        }
    }
}
