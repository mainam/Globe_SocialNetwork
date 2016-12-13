using Swashbuckle.Swagger.Annotations;
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CDYT.Common;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using CDYT.Models;
using DataAccess;
using DataAccess.dao;
using System.Web;

namespace CDYT.Controllers
{
    public class OfferController : ApiController
    {

        /// <summary>
        /// Contructor AccountController
        /// </summary>
        public OfferController()
        {
        }

        /// <summary>
        /// Module: CDYTM1
        /// Function get account all data
        /// </summary>
        /// <returns>Account all data</returns>
        [HttpPost]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Offer/GetByNet")]
        public HttpResponseMessage GetByNet(JObject jsonJObject)
        {
            try
            {
                if (jsonJObject != null)
                {
                    var entity = JsonConvert.DeserializeObject<OfferRequestEntity>(jsonJObject.ToString());
                    if (entity == null)
                        throw new Exception();
                    String ip = ((HttpContextBase)Request.Properties["MS_HttpContext"]).Request.UserHostAddress;
                    var obj = OfferInfo.getByNet(entity.MemberId, entity.NetId, entity.FlatformId, ip);
                    return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, obj);
                }
            }
            catch
            {

            }
            return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Sai tham số");
        }
    }
}