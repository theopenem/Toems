﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using Toems_ApplicationApi.Controllers.Authorization;
using Toems_Common;
using Toems_Common.Dto;
using Toems_Common.Entity;
using Toems_Service.Entity;

namespace Toems_ApplicationApi.Controllers
{
    public class UserController : ApiController
    {
        private readonly int _userId;
        private readonly ServiceUser _userServices;

        public UserController()
        {
            _userServices = new ServiceUser();
            _userId = Convert.ToInt32(((ClaimsIdentity) User.Identity).Claims.Where(c => c.Type == "user_id")
                .Select(c => c.Value).SingleOrDefault());
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public DtoActionResult Delete(int id)
        {
            var result = _userServices.DeleteUser(id);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public DtoApiBoolResponse DeleteRights(int id)
        {
            return new DtoApiBoolResponse {Value = _userServices.DeleteUserRights(id)};
        }

       [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public EntityToemsUser Get(int id)
        {
            var result = _userServices.GetUser(id);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [Authorize]
        public EntityToemsUser GetSelf()
        {
            var result = _userServices.GetUser(_userId);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public IEnumerable<EntityToemsUser> Get()
        {
            return _userServices.GetAll();
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        [HttpPost]
        public IEnumerable<UserWithUserGroup> Search(DtoSearchFilter filter)
        {
            return _userServices.SearchUsers(filter);
        }

        [Authorize]
        public IEnumerable<DtoPinnedPolicy> GetPinnedPolicies()
        {
            return _userServices.GetPinnedPolicyCounts(_userId);
        }

        [Authorize]
        public IEnumerable<DtoPinnedGroup> GetPinnedGroups()
        {
            return _userServices.GetPinnedGroupCounts(_userId);
        }

        [Authorize]
        public DtoApiIntResponse GetAdminCount()
        {
            return new DtoApiIntResponse {Value = _userServices.GetAdminCount()};
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public EntityToemsUser GetByName(string username)
        {
            var result = _userServices.GetUser(username);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public DtoApiStringResponse GetCount()
        {
            return new DtoApiStringResponse {Value = _userServices.TotalCount()};
        }

        [Authorize]
        public DtoApiObjectResponse GetForLogin(string username)
        {
            var user = _userServices.GetUser(username);
            if (user.Id == Convert.ToInt32(_userId))
                return _userServices.GetUserForLogin(user.Id);

            throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
        }





       [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public IEnumerable<EntityUserRight> GetRights(int id)
        {
            return _userServices.GetUserRights(id);
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        [HttpPost]
        public IEnumerable<EntityAuditLog> GetUserAuditLogs(int id, DtoSearchFilter filter)
        {
            return _userServices.GetUserAuditLogs(id, filter);
        }

      
        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public DtoActionResult Post(EntityToemsUser user)
        {
            return _userServices.AddUser(user);
        }

        [CustomAuth(Permission = AuthorizationStrings.Administrator)]
        public DtoActionResult Put(int id, EntityToemsUser user)
        {
            user.Id = id;
            var result = _userServices.UpdateUser(user);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [Authorize]
        [HttpPut]
        public DtoActionResult ChangePassword(EntityToemsUser user)
        {
            user.Id = _userId;
            var result = _userServices.UpdateUser(user);
            if (result == null) throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            return result;
        }

        [HttpGet]
        [CustomAuth(Permission = AuthorizationStrings.ReportRead)]
        public List<DtoProcessWithTime> UserProcessTimes(DateTime dateCutoff, int limit, string userName)
        {
            return _userServices.GetUserProcessTimes(dateCutoff, limit, userName);
        }

        [HttpGet]
        [CustomAuth(Permission = AuthorizationStrings.ReportRead)]
        public List<DtoProcessWithCount> UserProcessCounts(DateTime dateCutoff, int limit, string userName)
        {
            return _userServices.GetUserProcessCounts(dateCutoff, limit, userName);
        }

        [HttpGet]
        [CustomAuth(Permission = AuthorizationStrings.ReportRead)]
        public List<DtoProcessWithUser> UserProcess(DateTime dateCutoff, int limit, string userName)
        {
            return _userServices.GetAllProcessForUser(dateCutoff, limit, userName);
        }


    }
}