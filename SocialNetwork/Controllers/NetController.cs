using Swashbuckle.Swagger.Annotations;
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CDYT.Common;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using DataAccess;

namespace CDYT.Controllers
{
    public class NetController : ApiController
    {

        /// <summary>
        /// Contructor AccountController
        /// </summary>
        public NetController()
        {
        }

        /// <summary>
        /// Module: CDYTM1
        /// Function get account all data
        /// </summary>
        /// <returns>Account all data</returns>
        [HttpGet]
        [SwaggerResponse(HttpStatusCode.OK, Type = typeof(HttpResponseMessage))]
        [Route("~/Net/GetAll")]
        public HttpResponseMessage GetAll()
        {
            try
            {
                var obj = NetInfo.getAll();
                return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.OK, obj);
            }
            catch
            {

            }
            return HTTPResponseHelper.CreateResponse(Request, HttpStatusCode.NotFound, "Sai tham số");


        }
    }
}