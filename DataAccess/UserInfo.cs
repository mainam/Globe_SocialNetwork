using DataAccess.Db.UserDB;
using DataAccess.UtilFolder;
using System;
using System.Linq;

namespace DataAccess
{
    public class UserInfo
    {
        public static tbUser Login(UserDbDataContext context, String username, String email, String password, String deviceId, String deviceToken)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == username || x.Email == email);
            if (user == null)
                throw new Exception("Tài khoản không tồn tại");
            if (user.Password == password)
            {
                user.LastLogin = DateTime.Now.ToUniversalTime().Subtract(
    new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)
    ).TotalMilliseconds;
                user.Token = StringUtils.encryptPassword(user.UserName + new DateTime().ToString());

                tbDevice device = context.tbDevices.SingleOrDefault(x => x.DeviceId.Equals(deviceId));
                if (device == null)
                {
                    context.tbDevices.InsertOnSubmit(new tbDevice()
                    {
                        DeviceId = deviceId,
                        Token = deviceToken,
                        UserName = user.UserName
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

        public static tbUser Register(UserDbDataContext context, String username, String fullname, String password, String email, String imageUrl, String deviceId, String deviceToken)
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
                Password = password,
                LastLogin = new DateTime().ToUniversalTime().Subtract(
    new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)
    ).TotalMilliseconds,
                Token = StringUtils.encryptPassword(username + new DateTime().ToString())
            };

            context.tbUsers.InsertOnSubmit(user);

            tbDevice device = context.tbDevices.SingleOrDefault(x => x.DeviceId.Equals(deviceId));
            if (device == null)
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

        public static Db.UserDB2.tbUser getByUserId(Db.UserDB2.DbDataContext context, String findUser, String requestBy, ref bool isFriend)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == findUser);
            if (user == null)
                throw new Exception("Tài khoản không tồn tại");
            isFriend = user.tbFriends1.SingleOrDefault(x => x.UserName == requestBy) != null;

            return user;
        }

        public static bool Logout(UserDbDataContext context, String username, String token)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == username && x.Token == token);
            if (user == null)
                throw new Exception("User không tồn tại hoặc token sai");

            user.Token = null;
            context.tbDevices.DeleteAllOnSubmit(user.tbDevices);
            context.SubmitChanges();
            return true;
        }

        public static tbUser ChangePassword(UserDbDataContext context, string userName, string token, string currentPassword, string newPassword)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == userName && x.Token == token);
            if (user == null)
                throw new Exception("User không tồn tại hoặc token sai");

            if (user.Password == currentPassword)
                user.Password = newPassword;
            context.SubmitChanges();
            return user;
        }

        public static tbUser ChangeAvatar(UserDbDataContext context, string userName, string token, string imageUrl)
        {
            var user = context.tbUsers.SingleOrDefault(x => x.UserName == userName && x.Token == token);
            if (user == null)
                throw new Exception("User không tồn tại hoặc token sai");
            user.ImageUrl=imageUrl;
            context.SubmitChanges();
            return user;
        }


        public static tbUser UpdateProfile(UserDbDataContext context, string userName, string token, String email, String fullName)
        {
            var users = context.tbUsers.Where(x => x.UserName == userName && x.Token == token || x.Email==email);
            if (users.Count()==0 || (users.Count() == 1&&users.First().UserName!=userName))
                throw new Exception("User không tồn tại hoặc token sai");
            if(users.Count()>1)
                throw new Exception("Đã tồn tại tài khoản với email bạn đã nhập");
            users.First().Email = email;
            users.First().FullName = fullName;
            context.SubmitChanges();
            return users.First();
        }
    }
}
