﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IWS_Dao.Inerface
{
    /// <summary>
    /// Dao层公开接口
    /// </summary>
    public interface InterfaceDao<T>
    {
        /// <summary>
        /// 数据查询
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合（可缺省）</param>
        /// <returns></returns>
        List<T> SelectData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<T> lstData = null);

        /// <summary>
        /// 数据库追加数据
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合（可缺省）</param>
        /// <returns></returns>
        int InsertData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<T> lstData = null);

        /// <summary>
        /// 数据库追加数据
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合（可缺省）</param>
        /// <returns></returns>
        int UpdateData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<T> lstData = null);

        /// <summary>
        /// 数据库追加数据
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合（可缺省）</param>
        /// <returns></returns>
        int DeleteData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<T> lstData = null);
    }
}
