﻿using System.Collections.Generic;
using RestSharp;
using Toems_Common.Dto;
using Toems_Common.Entity;

namespace Toems_ApiCalls
{
    public class PrinterModuleAPI : BaseAPI<EntityPrinterModule>
    {

        public PrinterModuleAPI(string resource) : base(resource)
        {
            
        }

        public string GetArchivedCount()
        {
            Request.Method = Method.GET;
            Request.Resource = string.Format("{0}/GetArchivedCount", Resource);
            var responseData = new ApiRequest().Execute<DtoApiStringResponse>(Request);
            return responseData != null ? responseData.Value : string.Empty;

        }

        public List<EntityPrinterModule> GetArchived(DtoSearchFilterCategories filter)
        {
            Request.Method = Method.POST;
            Request.Resource = string.Format("{0}/GetArchived", Resource);
            Request.AddJsonBody(filter);
            return new ApiRequest().Execute<List<EntityPrinterModule>>(Request);
        }
    }
}