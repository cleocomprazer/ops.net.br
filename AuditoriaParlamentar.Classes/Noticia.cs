using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace AuditoriaParlamentar.Classes
{
    public class Noticia
    {
        public Int64 IdNoticia { get; set; }
        public String TextoNoticia { get; set; }
        public String LinkNoticia { get; set; }
        public String ImagemNoticia { get; set; }
        public DateTime DataNoticia { get; set; }
        public String UserName { get; set; }

        public Boolean InsereNoticia()
        {
            using (Banco banco = new Banco())
            {
                banco.AddParameter("TextoNoticia", TextoNoticia);
                banco.AddParameter("LinkNoticia", LinkNoticia);
                banco.AddParameter("UserName", UserName);

                if (banco.ExecuteNonQuery("INSERT INTO noticias (TextoNoticia, LinkNoticia, DataNoticia, UserName) VALUES (@TextoNoticia, @LinkNoticia, NOW(), @UserName)") == false)
                {
                    return false;
                }

                IdNoticia = banco.LastInsertedId;
            }

            return true;
        }

        public void CarregaNoticia(Int64 idDenuncia)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("SELECT noticias.IdNoticia,");
            sql.Append("       noticias.TextoNoticia,");
            sql.Append("       noticias.LinkNoticia,");
            sql.Append("       noticias.DataNoticia,");
            sql.Append("       noticias.UserName");
            sql.Append("  FROM noticias");
            sql.Append(" WHERE noticias.IdNoticia = @IdNoticia");

            using (Banco banco = new Banco())
            {
                banco.AddParameter("IdNoticia", idDenuncia);

                using (MySqlDataReader reader = banco.ExecuteReader(sql.ToString(), 300))
                {
                    if (reader.Read())
                    {
                        try { IdNoticia = Convert.ToInt64(reader["IdNoticia"]); }
                        catch { IdNoticia = 0; }

                        try { TextoNoticia = Convert.ToString(reader["TextoNoticia"]); }
                        catch { TextoNoticia = ""; }

                        try { LinkNoticia = Convert.ToString(reader["LinkNoticia"]); }
                        catch { LinkNoticia = ""; }

                        try { DataNoticia = Convert.ToDateTime(reader["DataNoticia"]); }
                        catch { }

                        try { UserName = Convert.ToString(reader["UserName"]); }
                        catch { UserName = ""; }
                    }

                    reader.Close();
                }
            }
        }

        public void AtualizaNoticia()
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("UPDATE noticias");
            sql.Append("   SET TextoNoticia  = @TextoNoticia,");
            sql.Append("       LinkNoticia   = @LinkNoticia,");
            sql.Append("       UserName      = @UserName");
            sql.Append(" WHERE IdNoticia     = @IdNoticia");

            using (Banco banco = new Banco())
            {
                banco.AddParameter("TextoNoticia", TextoNoticia);
                banco.AddParameter("LinkNoticia", LinkNoticia);
                banco.AddParameter("UserName", UserName);
                banco.AddParameter("IdNoticia", IdNoticia);

                banco.ExecuteNonQuery(sql.ToString());
            }
        }

        public void CarregaNoticias(Repeater repeater)
        {
            StringBuilder sql = new StringBuilder();

            sql.Append("SELECT noticias.IdNoticia,");
            sql.Append("       noticias.LinkNoticia,");
            sql.Append("       noticias.TextoNoticia,");
            sql.Append("       noticias.DataNoticia,");
            sql.Append("       noticias.UserName");
            sql.Append("  FROM noticias");
            sql.Append(" ORDER BY IdNoticia DESC");

            using (Banco banco = new Banco())
            {
                using (MySqlDataReader reader = banco.ExecuteReader(sql.ToString(), 300))
                {
                    DataTable table = new DataTable("noticias");
                    table.Load(reader);

                    //table.Columns[3].ColumnName = "Data de Inclusão";
                    //table.Columns[4].ColumnName = "Incluído Por";

                    repeater.DataSource = table;
                    repeater.DataBind();
                }
            }
        }

        public void UltimasNoticias(System.Web.Caching.Cache cache, Repeater repeater)
        {
            if (cache["tableNoticias"] == null)
            {
                StringBuilder sql = new StringBuilder();

                sql.Append("SELECT noticias.IdNoticia,");
                sql.Append("       noticias.LinkNoticia,");
                sql.Append("       noticias.TextoNoticia,");
                sql.Append("       noticias.DataNoticia");
                sql.Append("  FROM noticias");
                sql.Append(" ORDER BY IdNoticia DESC LIMIT 8");

                using (Banco banco = new Banco())
                {
                    using (MySqlDataReader reader = banco.ExecuteReader(sql.ToString(), 300))
                    {
                        DataTable table = new DataTable("noticias");
                        table.Load(reader);

                        repeater.DataSource = table;
                        repeater.DataBind();

                        try
                        {
                            cache.Add("tableNoticias", table, null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                }
            }
            else
            {
                DataTable table = (DataTable)cache["tableNoticias"];
                repeater.DataSource = table;
                repeater.DataBind();
            }
        }
    }
}