using AuditoriaParlamentar.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuditoriaParlamentar
{
	public partial class DeputadoFederal : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			using (var banco = new Banco())
			{
				GridViewDepudadoFederal.PreRender += GridViewDepudadoFederal_PreRender;
				DataTable dt;

				banco.AddParameter("@ideCadastro", Request.QueryString["id"]);
				dt = banco.GetTable(@"SELECT ideCadastro, txNomeParlamentar, uf, partido, condicao, email, nome
                    FROM parlamentares
						  WHERE ideCadastro=@ideCadastro");
				frvDeputadoFederal.DataSource = dt;
				frvDeputadoFederal.DataBind();

				Master.Page.Title = "OPS :: Dep. " + dt.Rows[0]["txNomeParlamentar"].ToString();

				banco.AddParameter("@ideCadastro", Request.QueryString["id"]);
				dt = banco.GetTable(@"SELECT SUM(vlrLiquido) AS ValorTotal, txtDescricao AS Despesa
                    FROM lancamentos
						  WHERE ideCadastro=@ideCadastro
						  GROUP BY txtDescricao
						  ORDER BY 1 DESC");
				GridViewDepudadoFederal.DataSource = dt;
				GridViewDepudadoFederal.DataBind();
				Session["pesquisa0"] = dt;

				ValorTotal.InnerText = Convert.ToDecimal(dt.Compute("Sum(ValorTotal)", "")).ToString("#,###.00");

				banco.AddParameter("@ideCadastro", Request.QueryString["id"]);
				TotalFuncionarios.InnerText = banco.ExecuteScalar(@"SELECT count(1) FROM secretario WHERE deputado=@ideCadastro").ToString();
			}
		}

		private void GridViewDepudadoFederal_PreRender(object sender, EventArgs e)
		{
			try
			{
				if (GridViewDepudadoFederal.HeaderRow != null)
					GridViewDepudadoFederal.HeaderRow.TableSection = TableRowSection.TableHeader;
			}
			catch (Exception)
			{
			}
		}

		protected void GridViewDepudadoFederal_Sorting(object sender, GridViewSortEventArgs e)
		{
			//Retrieve the table from the session object.
			DataTable dt = Session["pesquisa0"] as DataTable;

			if (dt != null)
			{
				//Sort the data.
				dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
				GridViewDepudadoFederal.DataSource = Session["pesquisa0"];
				GridViewDepudadoFederal.DataBind();
			}
		}

		private string GetSortDirection(string column)
		{

			// By default, set the sort direction to ascending.
			string sortDirection = "DESC";

			// Retrieve the last column that was sorted.
			string sortExpression = Session["SortExpression0"] as string;

			if (sortExpression != null)
			{
				// Check if the same column is being sorted.
				// Otherwise, the default value can be returned.
				if (sortExpression == column)
				{
					string lastDirection = Session["SortDirection0"] as string;
					if ((lastDirection != null) && (lastDirection == "DESC"))
					{
						sortDirection = "ASC";
					}
				}
			}

			Session["SortDirection0"] = sortDirection;
			Session["SortExpression0"] = column;

			return sortDirection;
		}

		private double mTotalGeral = 0;
		protected void GridViewDepudadoFederal_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType != DataControlRowType.EmptyDataRow)
			{
				if (e.Row.RowType == DataControlRowType.DataRow)
				{
					mTotalGeral += Convert.ToDouble(e.Row.Cells[1].Text);
				}
				else if (e.Row.RowType == DataControlRowType.Footer)
				{
					e.Row.Cells[0].Text = "Valor Total:";
					e.Row.Cells[1].Text = mTotalGeral.ToString("N2");
				}
			}
		}
	}
}