using Swashbuckle.Swagger.Annotations;
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SocialNetwork.Common;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using DataAccess.Db.UserDB;
using DataAccess;

namespace SocialNetwork.Controllers
{
    public class AccountController : ApiController
    {

        /// <summary>
        /// Contructor AccountController
        /// </summary>
        public AccountController()
        {
        }


        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/GetMemberById")]
        public HttpResponseMessage GetMemberById(JObject jsonJObject)
        {
            try
            {
                using (var context = new DataAccess.Db.UserDB2.DbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    dynamic device = entity.Device;
                    String findUser = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "FindUser");
                    String requestBy = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "RequestBy");
                    bool isFriend = false;
                    DataAccess.Db.UserDB2.tbUser user = UserInfo.getByUserId(context, findUser, requestBy, ref isFriend);

                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { User = new { user.FullName, user.Email, user.ImageUrl, user.LastLogin, user.UserName }, IsFriend = isFriend });

                }
            }
            catch
            {

            }
            return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Sai tham số");


        }

        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/Login")]
        public HttpResponseMessage Login(JObject jsonJObject)
        {
            try
            {
                using (var context = new UserDbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    dynamic device = entity.Device;
                    String email = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Email");
                    String username = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "UserName");
                    String password = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Password");
                    String deviceId = DataAccess.UtilFolder.Converts.ToStringFromDynamic(device, "DeviceId");
                    String devicetoken = DataAccess.UtilFolder.Converts.ToStringFromDynamic(device, "Token");


                    tbUser user = UserInfo.Login(context, username, email, password, deviceId, devicetoken);

                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { user.FullName, user.Email, user.ImageUrl, user.LastLogin, user.UserName, user.Token });

                }
            }
            catch (Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));

            }


        }


        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/ChangePassword")]
        public HttpResponseMessage ChangePassword(JObject jsonJObject)
        {
            try
            {
                using (var context = new UserDbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    dynamic device = entity.Device;
                    String userName = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "UserName");
                    String token = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Token");
                    String currentPassword = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "CurrentPassword");
                    String newPassword = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "NewPassword");

                    tbUser user = UserInfo.ChangePassword(context, userName, token, currentPassword, newPassword);

                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { user.FullName, user.Email, user.ImageUrl, user.LastLogin, user.UserName, user.Token });
                }
            }
            catch (Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));

            }


        }

        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/Logout")]
        public HttpResponseMessage Logout(JObject jsonJObject)
        {
            try
            {
                using (var context = new UserDbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    String username = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "UserName");
                    String token = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Token");
                    if (UserInfo.Logout(context, username, token))
                        return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { Message = "Logout thành công" });
                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { Message = "Logout không thành công" });
                }
            }
            catch (Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));
            }


        }

        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/Register")]
        public HttpResponseMessage Register(JObject jsonJObject)
        {
            try
            {
                using (var context = new UserDbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    dynamic device = entity.Device;
                    String username = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "UserName");
                    String fullname = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "FullName");
                    String password = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Password");
                    String email = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Email");
                    String imageUrl = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "ImageUrl");

                    String deviceId = DataAccess.UtilFolder.Converts.ToStringFromDynamic(device, "DeviceId");
                    String devicetoken = DataAccess.UtilFolder.Converts.ToStringFromDynamic(device, "Token");


                    tbUser user = UserInfo.Register(context, username, fullname, password, email, imageUrl, deviceId, devicetoken);

                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { user.FullName, user.Email, user.ImageUrl, user.LastLogin, user.UserName, user.Token });
                }
            }
            catch (Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));

            }


        }



        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/ChangePassword")]
        public HttpResponseMessage UpdateProfile(JObject jsonJObject)
        {
            try
            {
                using (var context = new UserDbDataContext())
                {
                    var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                    dynamic device = entity.Device;
                    String userName = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "UserName");
                    String token = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "Token");
                    String currentPassword = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "CurrentPassword");
                    String newPassword = DataAccess.UtilFolder.Converts.ToStringFromDynamic(entity, "NewPassword");

                    tbUser user = UserInfo.ChangePassword(context, userName, token, currentPassword, newPassword);

                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { user.FullName, user.Email, user.ImageUrl, user.LastLogin, user.UserName, user.Token });
                }
            }
            catch (Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));

            }


        }


    }
}