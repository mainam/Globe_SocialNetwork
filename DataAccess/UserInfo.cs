using DataAccess.Db.UserDB;
using DataAccess.UtilFolder;
using System;
using System.Linq;

namespace DataAccess
{
    public class UserInfo
    {
        public static Object Login(UserDbDataContext context, String username, String password, String deviceId, String deviceToken)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == username);
            if (user == null)
                throw new Exception("Tài khoản không tồn tại");
            if (user.Password == password)
            {
                user.LastLogin = DateTime.Now;
                tbDevice device = context.tbDevices.SingleOrDefault(x => x.DeviceId.Equals(deviceId));
                if (device != null)
                {
                    context.tbDevices.InsertOnSubmit(new tbDevice()
                    {
                        DeviceId = deviceId,
                        Token = deviceToken,
                        UserName = username
                    });
                }
                else
                {
                    device.UserName = username;
                    device.Token = deviceToken;
                }
                context.SubmitChanges();
                return user;
            }
            else
                throw new Exception("Sai mật khẩu");
        }

        public static Object Register(UserDbDataContext context, String username, String fullname, String password, String email, String imageUrl, String deviceId, String deviceToken)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == username || x.Email == email);
            if (user != null)
                throw new Exception("Email hoặc UserName đã tồn tại");

            user = new tbUser()
            {
                UserName = username,
                FullName = fullname,
                Email = email,
                ImageUrl = imageUrl,
                Password = password
            };

            context.tbUsers.InsertOnSubmit(user);

            tbDevice device = context.tbDevices.SingleOrDefault(x => x.DeviceId.Equals(deviceId));
            if (device != null)
            {
                context.tbDevices.InsertOnSubmit(new tbDevice()
                {
                    DeviceId = deviceId,
                    Token = deviceToken,
                    UserName = username
                });
            }
            else
            {
                device.UserName = username;
                device.Token = deviceToken;
            }

            context.SubmitChanges();
            return user;
        }
    }
}
