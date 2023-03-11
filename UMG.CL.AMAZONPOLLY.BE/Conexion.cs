using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using MySqlConnector;
using MySql.Data.MySqlClient;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

namespace UMG.CL.AMAZONPOLLY.BE
{
    internal class Conexion
    {
        public DataTable realizarConsulta(String consulta)
        {
            DataTable tblResultado = new DataTable();
            String mysqlServerConexión = "server=ASVI01;uid=reportes;pwd='8ac3etuq';database=cdiadm;SSL Mode=None;";//ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            try
            {
                using (MySqlConnection con = new MySqlConnection(mysqlServerConexión))
                {
                    using (MySqlCommand cmd = new MySqlCommand(consulta, con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            sda.Fill(tblResultado);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                tblResultado = null;
            }
            return tblResultado;
        }

        public int realizarDML(String consulta)
        {
            int resultado = 0;
            String mysqlServerConexión = "server=ASVI01;uid=reportes;pwd='8ac3etuq';database=cdiadm;SSL Mode=None;";//ConfigurationManager.ConnectionStrings["MySqlConn"].ConnectionString;
            try
            {
                MySqlConnection conn = new MySqlConnection(mysqlServerConexión);
                MySqlCommand cmd = null;
                conn.Open();
                cmd = new MySqlCommand(consulta, conn);
                resultado = cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (MySqlException ex)
            {
                resultado = 0;
            }
            return resultado;
        }




        

    }
}
