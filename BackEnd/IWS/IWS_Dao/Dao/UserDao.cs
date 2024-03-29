﻿using IWS_Common.Const;
using IWS_Common.Model;
using IWS_Dao.Inerface;
using MySql.Data.MySqlClient;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IWS_Dao.Dao
{
    /// <summary>
    /// 用户数据库操模型作类
    /// </summary>
    public class UserDao : AbstractDao<m_user>, InterfaceDao<m_user>
    {
        #region 属性

        #endregion

        #region 接口函数
        /// <summary>
        /// 数据查询
        /// </summary>
        /// <param name="conn">数据库连接对象</param>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合</param>
        /// <returns></returns>
        public List<m_user> SelectData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<m_user> lstData = null)
        {
            // 返回集合
            List<m_user> lstUser = new List<m_user>();

            // 连接失效返回空
            if (conn.State == System.Data.ConnectionState.Open) return null;

            try
            {
                // 执行命令读取数据
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = CreateSelectSql(dicCondition);
                    cmd.Parameters.AddRange(CreateSelectParameter(dicCondition));
                    MySqlDataReader read = cmd.ExecuteReader();

                    while (read.Read())
                    {
                        lstUser.Add(new m_user()
                        {
                            UserId = GetDBNullToString(read[0]),
                            UserName = GetDBNullToString(read[1]),
                            Password = GetDBNullToString(read[2]),
                            RoleName = GetDBNullToString(read[3]),
                            Telephone = GetDBNullToString(read[4]),
                            IdCard = GetDBNullToString(read[5]),
                            CompanyName = GetDBNullToString(read[6]),
                            Age = GetDBNullToString(read[7]),
                            Sex = GetDBNullToString(read[8]),
                            CreateUser = GetDBNullToString(read[9]),
                            CreateTime = GetDBNullToString(read[10]),
                            UpdateUser = GetDBNullToString(read[11]),
                            UpdateTime = GetDBNullToString(read[12]),
                            Remark = GetDBNullToString(read[13])
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return lstUser;
        }

        /// <summary>
        /// 数据删除
        /// </summary>
        /// <param name="conn">数据库连接对象</param>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合</param>
        /// <returns></returns>
        public int DeleteData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<m_user> lstData = null)
        {
            // 返回对象
            int intReturnValue = 0;
            // 数据库事务对象
            MySqlTransaction tran = null;
            // 连接失效返回空
            if (conn.State == System.Data.ConnectionState.Open) return 0;

            try
            {
                tran = conn.BeginTransaction();
                // 执行命令读取数据
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = CreateDeleteSql(dicCondition);
                    intReturnValue = cmd.ExecuteNonQuery();                    
                }
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return intReturnValue;
        }

        /// <summary>
        /// 数据插入
        /// </summary>
        /// <param name="conn">数据库连接</param>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合</param>
        /// <returns></returns>
        public int InsertData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<m_user> lstData = null)
        {
            // 返回对象
            int intReturnValue = 0;
            // 数据库事务对象
            MySqlTransaction tran = null;
            // 数据库执行参数
            MySqlParameter[] paras = null;

            // 连接失效返回空
            if (conn.State == System.Data.ConnectionState.Open) return 0;

            try
            {
                tran = conn.BeginTransaction();
                // 执行命令读取数据
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = CreateInsertSql(dicCondition);

                    // 循环执行插入语句
                    foreach (m_user user in lstData)
                    {
                        paras = CreateInsertParameter();
                        paras[0].Value = user.UserId;
                        paras[1].Value = user.UserName;
                        paras[2].Value = user.Password;
                        paras[3].Value = user.RoleName;
                        paras[4].Value = user.Telephone;
                        paras[5].Value = user.IdCard;
                        paras[6].Value = user.CompanyName;
                        paras[7].Value = user.Age;
                        paras[8].Value = user.Sex;
                        paras[9].Value = user.CreateUser;
                        paras[10].Value = user.CreateTime;
                        paras[11].Value = user.UpdateUser;
                        paras[12].Value = user.UpdateTime;
                        paras[13].Value = user.Remark;

                        intReturnValue = cmd.ExecuteNonQuery();                        
                    }
                }
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return intReturnValue;
        }        

        /// <summary>
        /// 数据更新
        /// </summary>
        /// <param name="conn">数据库连接对象</param>
        /// <param name="dicCondition">条件集合</param>
        /// <param name="lstData">数据集合</param>
        /// <returns></returns>
        public int UpdateData(MySqlConnection conn, Dictionary<string, string> dicCondition, List<m_user> lstData = null)
        {
            // 返回对象
            int intReturnValue = 0;
            // 数据库事务对象
            MySqlTransaction tran = null;
            // 数据库执行参数
            MySqlParameter[] paras = null;

            // 连接失效返回空
            if (conn.State == System.Data.ConnectionState.Open) return 0;

            try
            {
                tran = conn.BeginTransaction();
                // 执行命令读取数据
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = CreateUpdateSql(dicCondition);

                    // 循环执行插入语句
                    foreach (m_user user in lstData)
                    {
                        paras = CreateUpdateParameter();
                        paras[0].Value = user.UserId;
                        paras[1].Value = user.UserName;
                        paras[2].Value = user.Password;
                        paras[3].Value = user.RoleName;
                        paras[4].Value = user.Telephone;
                        paras[5].Value = user.IdCard;
                        paras[6].Value = user.CompanyName;
                        paras[7].Value = user.Age;
                        paras[8].Value = user.Sex;
                        paras[9].Value = user.CreateUser;
                        paras[10].Value = user.CreateTime;
                        paras[11].Value = user.UpdateUser;
                        paras[12].Value = user.UpdateTime;
                        paras[13].Value = user.Remark;

                        intReturnValue = cmd.ExecuteNonQuery();
                    }
                }
                tran.Commit();
            }
            catch (Exception ex)
            {
                tran.Rollback();
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return intReturnValue;
        }        
        #endregion

        #region 抽象函数
        public override MySqlParameter[] CreateDeleteParameter()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// 创建数据库插入语句
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <returns></returns>
        public override string CreateDeleteSql(Dictionary<string, string> dicCondition)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" delete from m_user ");
            if (dicCondition != null && dicCondition.ContainsKey(AppConst.Dictionary_ConditionCnt))
            {
                // foreach value sb.Append(Condition Value)
            }
            return sb.ToString();
        }

        /// <summary>
        /// 创建数据插入参数
        /// </summary>
        /// <param name="dicCondition"></param>
        /// <param name="lstData"></param>
        /// <returns></returns>
        public override MySqlParameter[] CreateInsertParameter()
        {
            MySqlParameter[] paras = new MySqlParameter[] 
            {
                new MySqlParameter("@UserId",MySqlDbType.VarChar,10),
                new MySqlParameter("@UserName",MySqlDbType.VarChar,40),
                new MySqlParameter("@Password",MySqlDbType.VarChar,20),
                new MySqlParameter("@RoleName",MySqlDbType.VarChar,40),
                new MySqlParameter("@Telephone",MySqlDbType.VarChar,20),
                new MySqlParameter("@IdCard",MySqlDbType.VarChar,50),
                new MySqlParameter("@CompanyName",MySqlDbType.VarChar,100),
                new MySqlParameter("@Age",MySqlDbType.VarChar,3),
                new MySqlParameter("@Sex",MySqlDbType.VarChar,5),
                new MySqlParameter("@CreateUser",MySqlDbType.VarChar,10),
                new MySqlParameter("@CreateTime",MySqlDbType.VarChar,30),
                new MySqlParameter("@UpdateUser",MySqlDbType.VarChar,10),
                new MySqlParameter("@UpdateTime",MySqlDbType.VarChar,30),
                new MySqlParameter("@Remark",MySqlDbType.VarChar,255),
            };
            return paras;
        }

        /// <summary>
        /// 创建查询Sql语句
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <returns></returns>
        public override string CreateSelectSql(Dictionary<string, string> dicCondition)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" select * from m_user ");

            if (dicCondition != null && dicCondition.ContainsKey(AppConst.Dictionary_ConditionCnt))
            {
                // foreach value sb.Append(Condition Value)
            }
            return sb.ToString();
        }
        
        /// <summary>
        /// 创建数据库插入语句
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <returns></returns>
        public override string CreateInsertSql(Dictionary<string, string> dicCondition)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" insert into m_user ");
            sb.Append(" ( ");
            sb.Append("         UserId, ");
            sb.Append("         UserName, ");
            sb.Append("         Password, ");
            sb.Append("         RoleName, ");
            sb.Append("         Telephone, ");
            sb.Append("         IdCard, ");
            sb.Append("         CompanyName, ");
            sb.Append("         Age, ");
            sb.Append("         Sex, ");
            sb.Append("         CreateUser, ");
            sb.Append("         CreateTime, ");
            sb.Append("         UpdateUser, ");
            sb.Append("         UpdateTime, ");
            sb.Append("         Remark ");
            sb.Append(" ) ");
            sb.Append(" values ");
            sb.Append(" ( ");
            sb.Append("         @UserId, ");
            sb.Append("         @UserName, ");
            sb.Append("         @Password, ");
            sb.Append("         @RoleName, ");
            sb.Append("         @Telephone, ");
            sb.Append("         @IdCard, ");
            sb.Append("         @CompanyName, ");
            sb.Append("         @Age, ");
            sb.Append("         @Sex, ");
            sb.Append("         @CreateUser, ");
            sb.Append("         @CreateTime, ");
            sb.Append("         @UpdateUser, ");
            sb.Append("         @UpdateTime, ");
            sb.Append("         Remark ");
            sb.Append(" ) ");

            return sb.ToString();
        }

        /// <summary>
        /// 创建查询参数
        /// </summary>
        /// <param name="dicCondition"></param>
        /// <param name="lstData"></param>
        /// <returns></returns>
        public override MySqlParameter[] CreateSelectParameter(Dictionary<string, string> dicCondition)
        {
            throw new NotImplementedException();
        }        

        /// <summary>
        /// 创建数据库更新参数
        /// </summary>
        /// <returns></returns>
        public override MySqlParameter[] CreateUpdateParameter()
        {
            MySqlParameter[] paras = new MySqlParameter[]
            {
                new MySqlParameter("@UserId",MySqlDbType.VarChar,10),
                new MySqlParameter("@UserName",MySqlDbType.VarChar,40),
                new MySqlParameter("@Password",MySqlDbType.VarChar,20),
                new MySqlParameter("@RoleName",MySqlDbType.VarChar,40),
                new MySqlParameter("@Telephone",MySqlDbType.VarChar,20),
                new MySqlParameter("@IdCard",MySqlDbType.VarChar,50),
                new MySqlParameter("@CompanyName",MySqlDbType.VarChar,100),
                new MySqlParameter("@Age",MySqlDbType.VarChar,3),
                new MySqlParameter("@Sex",MySqlDbType.VarChar,5),
                new MySqlParameter("@CreateUser",MySqlDbType.VarChar,10),
                new MySqlParameter("@CreateTime",MySqlDbType.VarChar,30),
                new MySqlParameter("@UpdateUser",MySqlDbType.VarChar,10),
                new MySqlParameter("@UpdateTime",MySqlDbType.VarChar,30),
                new MySqlParameter("@Remark",MySqlDbType.VarChar,255),
            };
            return paras;
        }

        /// <summary>
        /// 创建数据更新语句
        /// </summary>
        /// <param name="dicCondition">条件集合</param>
        /// <returns></returns>
        public override string CreateUpdateSql(Dictionary<string, string> dicCondition)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(" update m_user ");
            sb.Append("    set UserId = @UserId, ");
            sb.Append("        UserName = @UserName, ");
            sb.Append("        Password = @Password, ");
            sb.Append("        RoleName = @RoleName, ");
            sb.Append("        Telephone = @Telephone, ");
            sb.Append("        IdCard = @IdCard, ");
            sb.Append("        CompanyName = @CompanyName, ");
            sb.Append("        Age = @Age, ");
            sb.Append("        Sex = @Sex, ");
            sb.Append("        CreateUser = @CreateUser, ");
            sb.Append("        CreateTime = @CreateTime, ");
            sb.Append("        UpdateUser = @UpdateUser, ");
            sb.Append("        UpdateTime = @UpdateTime, ");
            sb.Append("        Remark = @Remark, ");

            if (dicCondition != null && dicCondition.ContainsKey(AppConst.Dictionary_ConditionCnt))
            {
                // foreach value sb.Append(Condition Value)
            }
            return sb.ToString();
        }
        #endregion
    }
}
