using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;

namespace SocialNetwork.Common
{
    public static class HTTPResponseHelper
    {
        public static HttpResponseMessage CreateResponse<T>(HttpRequestMessage request, HttpStatusCode httpStatusCode,
            T value)
        {
            HttpResponseMessage response = request.CreateResponse(httpStatusCode, value);
            response.Headers.CacheControl = new CacheControlHeaderValue()
            {
                MaxAge = TimeSpan.FromMinutes(20)
            };

            return response;
        }

        public static HttpResponseMessage CreateResponse(HttpRequestMessage request, HttpStatusCode httpStatusCode,
            string message)
        {
            dynamic obj = new System.Dynamic.ExpandoObject();
            obj.StatusCode = (int)httpStatusCode;
            obj.Message = message;

            HttpResponseMessage response = request.CreateResponse(httpStatusCode);
            response.Content = new StringContent(JsonConvert.SerializeObject(obj), Encoding.UTF8);
            response.Headers.CacheControl = new CacheControlHeaderValue()
            {
                MaxAge = TimeSpan.FromMinutes(20)
            };

            return response;
        }

        public static HttpResponseMessage CreateResponse<T>(HttpRequestMessage request, HttpStatusCode httpStatusCode, ResultResponseEntity<T> entity)
        {
            HttpResponseMessage response = request.CreateResponse(httpStatusCode,entity);
            response.Headers.CacheControl = new CacheControlHeaderValue()
            {
                MaxAge = TimeSpan.FromMinutes(20)
            };

            return response;
        }
    }

    public class ResultResponseEntity<T>
    {
        public int ErrorCode { get; set; }
        public string Descirption { get; set; }

        public int Size { get; set; }
        public int Page { get; set; }
        public int PageTotal { get; set; }
        public int Count { get; set; }
        public List<T> Data { get; set; }

        public ResultResponseEntity()
        {
            this.ErrorCode = 0;
            this.Descirption = string.Empty;

            this.Size = 0;
            this.Page = 0;
            this.PageTotal = 0;
            this.Data = new List<T>();
        }
    }
}