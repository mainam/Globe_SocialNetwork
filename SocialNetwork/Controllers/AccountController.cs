using Swashbuckle.Swagger.Annotations;
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CDYT.Common;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using DataAccess;
using System.Web;
using DataAccess.dao;
using CDYT.Models;

namespace CDYT.Controllers
{
    public class AccountController : ApiController
    {

        /// <summary>
        /// Contructor AccountController
        /// </summary>
        public AccountController()
        {
        }

        /// <summary>
        /// Module: CDYTM1
        /// Function get account all data
        /// </summary>
        /// <returns>Account all data</returns>
        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/Login")]
        public HttpResponseMessage Login(JObject jsonJObject)
        {
            try
            {
                if (jsonJObject != null)
                {
                    var entity = JsonConvert.DeserializeObject<AccountRequestEntity>(jsonJObject.ToString());
                    String ip = ((HttpContextBase)Request.Properties["MS_HttpContext"]).Request.UserHostAddress;
                    String country = IPInfo.getCountryFromIP(ip);

                    if (entity == null)
                        throw new Exception();
                    var obj = MemberInfo.Login(entity.MemberId, entity.Password,country);
                    if (obj != null)
                        return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, obj);
                    else
                        return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Thông tin đăng nhập sai");
                }
            }
            catch
            {

            }
            return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Sai tham số");


        }
        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Account/GetMemberById")]
        public HttpResponseMessage GetMemberById(JObject jsonJObject)
        {
            try
            {
                String ip = ((HttpContextBase)Request.Properties["MS_HttpContext"]).Request.UserHostAddress;
                String country = IPInfo.getCountryFromIP(ip);
                var entity = JsonConvert.DeserializeObject<dynamic>(jsonJObject.ToString());
                String memberId = entity.MemberId.ToString();
                var obj = MemberInfo.GetById(memberId, country);
                if (obj != null)
                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, obj);
                else
                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "");
            }
            catch
            {

            }
            return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Sai tham số");


        }
    }
}