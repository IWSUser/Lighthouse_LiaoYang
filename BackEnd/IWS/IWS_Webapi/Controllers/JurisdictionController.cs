﻿using IWS_Business.Business;
using IWS_Business.BusinessIF;
using IWS_Common.Const;
using IWS_Common.Model;
using IWS_Common.Mysql;
using IWS_Common.Common;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IWS_Webapi.Controllers
{
    /// <summary>
    /// 权限Controller
    /// </summary>
    public class JurisdictionController : ApiController
    {
        /// <summary>
        /// 权限数据查询
        /// </summary>
        /// <returns></returns>
        public HttpResponseMessage GetUserData()
        {
            InterfaceBusiness<m_jurisdiction> jurisdictionBusiness;                // 业务层对象
            QueryModel model;                                                      // Json序列化对象
            List<m_jurisdiction> lstJurisdiction;                                  // 用户数据集合
            Dictionary<string, string> dicCondition;                               // 条件集合
            string rtnJson = string.Empty;                                         // 返回用Json字符串
            int startIndex = 0;                                                    // 数据条数开始索引

            int currentPage = 0;
            int pageCnt = 1;
            string strCurrentPage;
            string strPageCnt;
            string jurisdictionId;
            string jurisdictionLevel;
            string jurisdictionName;
            string jurisdictionPath;

            List<KeyValuePair<string, string>> requestList = Request.GetQueryNameValuePairs().ToList();

            strCurrentPage = requestList.Exists(s => s.Key == "currentPage") ? requestList.First(s => s.Key == "currentPage").Value : "";
            strPageCnt = requestList.Exists(s => s.Key == "pageCnt") ? requestList.First(s => s.Key == "pageCnt").Value : "";
            jurisdictionId = requestList.Exists(s => s.Key == "jurisdictionId") ? requestList.First(s => s.Key == "jurisdictionId").Value : "";
            jurisdictionLevel = requestList.Exists(s => s.Key == "jurisdictionLevel") ? requestList.First(s => s.Key == "jurisdictionLevel").Value : "";
            jurisdictionName = requestList.Exists(s => s.Key == "jurisdictionName") ? requestList.First(s => s.Key == "jurisdictionName").Value : "";
            jurisdictionPath = requestList.Exists(s => s.Key == "jurisdictionPath") ? requestList.First(s => s.Key == "jurisdictionPath").Value : "";

            int.TryParse(strCurrentPage, out currentPage);
            int.TryParse(strPageCnt, out pageCnt);
            currentPage = currentPage == 0 ? 1 : currentPage;
            pageCnt = pageCnt == 0 ? 10 : pageCnt;

            try
            {
                // 对象实例化
                jurisdictionBusiness = new JurisdictionBusiness();
                model = new QueryModel();
                lstJurisdiction = new List<m_jurisdiction>();
                dicCondition = new Dictionary<string, string>();

                // 创建WebApi数据库连接
                MysqlConnectionHelper DbHelper = new MysqlConnectionHelper(AppConst.Platform_Webapi);
                DbHelper.FirstCreateMysqlConnection();

                // 条件编辑
                startIndex = (currentPage - 1) * pageCnt;
                dicCondition = AppCommon.GetJurisdictionCondition(startIndex, pageCnt, jurisdictionId, jurisdictionLevel, jurisdictionName, jurisdictionPath);

                // Json数据序列化
                lstJurisdiction = jurisdictionBusiness.SelectData(DbHelper.GetMysqlConnection(), dicCondition).ToList();
                model.Data = lstJurisdiction;
                model.TotalDataCount = jurisdictionBusiness.SelectDataCnt(DbHelper.GetMysqlConnection(), dicCondition);
                model.CurrentPage = currentPage;
                model.TotalPageCnt = AppCommon.GetTotalPageCnt(pageCnt, model.TotalDataCount);
                model.State = 1;
                model.Msg = AppConst.Excute_Success;
            }
            catch (Exception ex)
            {
                model = new QueryModel();
                model.State = 7;
                model.Msg = ex.Message.ToString();
            }

            // Json序列化返回
            string json = JsonConvert.SerializeObject(model);
            return new HttpResponseMessage
            {
                Content = new StringContent(json, System.Text.Encoding.UTF8, "application/json")
            };
        }
    }
}