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
        [Route("~/Account/GetById")]
        public HttpResponseMessage GetMemberById(JObject jsonJObject)
        {
            try
            {
                //String ip = ((HttpContextBase)Request.Properties["MS_HttpContext"]).Request.UserHostAddress;
                //String country = IPInfo.getCountryFromIP(ip);
                var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                String memberId = entity.MemberId.ToString();
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, new { Name = memberId });
                //var obj = MemberInfo.GetById(memberId, country);
                //if (obj != null)
                //    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, obj);
                //else
                //    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "");
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
                    String username = entity.UserName.ToString();
                    String password = entity.Password.ToString();
                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, UserInfo.Login(context,username,password));
                }
            }
            catch(Exception e)
            {
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, new ErrorCls(e.Message));

            }


        }
    }
}