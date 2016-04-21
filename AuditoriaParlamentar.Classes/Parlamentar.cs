using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;

namespace AuditoriaParlamentar.Classes
{
	public class Parlamentar
	{

		public String recuperaIdParlamentar(string vs_Nome)
		{
			DataTable vdt_Nome = new DataTable();
			vdt_Nome = ConexaoStatica.recuperaDataTable(" SELECT p.ideCadastro from parlamentares p where p.txNomeParlamentar like '%" + vs_Nome + "%' ", null);
			if (vdt_Nome.Rows.Count > 0)
			{
				return vdt_Nome.Rows[0]["ideCadastro"].ToString();
			}
			else {
				return "-1";
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="ao_ParlamentarId"></param>
		/// <returns></returns>
		public DataTable recuperaSecretariosParlamentar(string ao_ParlamentarId)
		{
			String vs_Query = " SELECT s.nome, p.txNomeParlamentar as nomeParlamentar from secretario s" +
							  " INNER JOIN parlamentares p on p.ideCadastro = s.deputado " +
							  " WHERE p.ideCadastro =" + ao_ParlamentarId;
			return ConexaoStatica.recuperaDataTable(vs_Query, null);
		}
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public DataTable recuperaParlamentares()
		{
			String vs_Query = " SELECT p.ideCadastro as id, p.txNomeParlamentar as nome, count(secretario.deputado) as qtd" +
							 " FROM secretario INNER JOIN parlamentares p ON p.ideCadastro = secretario.deputado" +
							 " GROUP BY p.ideCadastro,secretario.deputado order by count(secretario.deputado) DESC, p.txNomeParlamentar ASC";
			return ConexaoStatica.recuperaDataTable(vs_Query, null);
		}
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public DataTable recuperaCards()
		{
			String vs_Query = "SELECT * FROM cards_bi order by ordemExibicao";
			return ConexaoStatica.recuperaDataTable(vs_Query, null);
		}

		public void AtualizaInfoDeputados()
		{
			var ws = new CamaraWS.Deputados();
			XmlNode deputados = ws.ObterDeputados();
			XmlNodeList deputado = deputados.SelectNodes("*");
			StringBuilder sqlFields = new StringBuilder();

			using (var banco = new Banco())
			{
				foreach (XmlNode fileNode in deputado)
				{
					sqlFields.Clear();

					foreach (XmlNode item in fileNode.SelectNodes("*"))
					{
						var nodeName = item.Name;

						if (nodeName == "ideCadastro")
						{
							banco.AddParameter(nodeName, item.InnerText.ToUpper());
						}
						else if (nodeName != "comissoes")
						{
							if (nodeName == "nomeParlamentar")
								nodeName = "txNomeParlamentar";

							//sqlFields.Append(string.Format(",{0}='{1}'", nodeName, item.InnerText.ToUpper()));
							sqlFields.Append(string.Format(",{0}=@{0}", nodeName));
							banco.AddParameter(nodeName, item.InnerText.ToUpper());
						}
					}

					banco.ExecuteNonQuery("UPDATE parlamentares SET " + sqlFields.ToString().Substring(1) + " WHERE ideCadastro=@ideCadastro");
				}
			}
		}
	}
}