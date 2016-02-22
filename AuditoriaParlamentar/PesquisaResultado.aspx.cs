using AuditoriaParlamentar.Classes;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace AuditoriaParlamentar
{
    public partial class PesquisaResultado : System.Web.UI.Page
    {
        const String GRUPO_DEPUTADO_FEDERAL = "Deputado Federal";
        const String GRUPO_SENADOR = "Senador";

        Double mTotalGeral = 0;
        Boolean mAuthenticated;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewResultado.PreRender += GridViewResultado_PreRender;
            mAuthenticated = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;

            if (!IsPostBack)
            {
                //Chave para exportação do CSV
                ChavePesquisa.Value = Guid.NewGuid().ToString();

                HiddenFieldGrupo.Value = HttpUtility.HtmlDecode(Request.QueryString["grupo"]);
                HiddenFieldAgrupamento.Value = HttpUtility.HtmlDecode(Request.QueryString["agrupamentoNovo"]);
                HiddenFieldSeparaMes.Value = HttpUtility.HtmlDecode(Request.QueryString["separaMes"]);
                HiddenFieldPeriodo.Value = HttpUtility.HtmlDecode(Request.QueryString["periodo"]);
                HiddenFieldAnoIni.Value = HttpUtility.HtmlDecode(Request.QueryString["anoIni"]);
                HiddenFieldMesIni.Value = HttpUtility.HtmlDecode(Request.QueryString["mesIni"]);
                HiddenFieldAnoFim.Value = HttpUtility.HtmlDecode(Request.QueryString["anoFim"]);
                HiddenFieldMesFim.Value = HttpUtility.HtmlDecode(Request.QueryString["mesFim"]);
                HiddenFieldParlamentar.Value = HttpUtility.HtmlDecode(Request.QueryString["parlamentar"]);
                HiddenFieldDespesa.Value = HttpUtility.HtmlDecode(Request.QueryString["despesa"]);
                HiddenFieldFornecedor.Value = HttpUtility.HtmlDecode(Request.QueryString["fornecedor"]);
                HiddenFieldUF.Value = HttpUtility.HtmlDecode(Request.QueryString["uf"]);
                HiddenFieldPartido.Value = HttpUtility.HtmlDecode(Request.QueryString["partido"]);
                HiddenFieldDocumento.Value = HttpUtility.HtmlDecode(Request.QueryString["documento"]);

                String valorFiltro = HttpUtility.HtmlDecode(Request.QueryString["filtro"]);
                LabelFiltro.InnerText = HttpUtility.HtmlDecode(Request.QueryString["descricao"]);
                String agrupamentoAtual = HttpUtility.HtmlDecode(Request.QueryString["agrupamentoAtual"]);

                switch (agrupamentoAtual)
                {
                    case Pesquisa.AGRUPAMENTO_PARLAMENTAR:
                        HiddenFieldParlamentar.Value = valorFiltro;
                        break;

                    case Pesquisa.AGRUPAMENTO_DESPESA:
                        HiddenFieldDespesa.Value = valorFiltro;
                        break;

                    case Pesquisa.AGRUPAMENTO_FORNECEDOR:
                        HiddenFieldFornecedor.Value = valorFiltro;
                        break;

                    case Pesquisa.AGRUPAMENTO_PARTIDO:
                        HiddenFieldPartido.Value = valorFiltro;
                        break;

                    case Pesquisa.AGRUPAMENTO_UF:
                        HiddenFieldUF.Value = valorFiltro;
                        break;

                    case Pesquisa.AGRUPAMENTO_DOCUMENTO:
                        HiddenFieldDocumento.Value = valorFiltro;
                        HiddenFieldSeparaMes.Value = "false";
                        break;

                }

                Pesquisar();
            }
            else
            {
                if (Request["__EVENTTARGET"] == "ButtonExportar_Click")
                {
                    DataTable ultimaConsulta = HttpContext.Current.Session["AuditoriaUltimaConsulta" + ChavePesquisa.Value] as DataTable;
                    if (ultimaConsulta != null)
                    {
                        ultimaConsulta.Columns.RemoveAt(0);
                        CsvHelper.ExportarCSV(ultimaConsulta);
                    }
                }
            }
        }

        private void GridViewResultado_PreRender(object sender, EventArgs e)
        {
            try
            {
                GridViewResultado.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
            }
        }

        private void Pesquisar()
        {
            //Usado para selecionar o parlamentar ao solicitar documentos ao auditar o fornecedor
            if (!string.IsNullOrEmpty(HiddenFieldParlamentar.Value))
                Session["ParlamentarQueEstaSendoAuditado"] = HiddenFieldParlamentar.Value.Split(',')[0];

            switch (HiddenFieldGrupo.Value)
            {
                case GRUPO_DEPUTADO_FEDERAL:
                    Pesquisa pesquisa = new Pesquisa();
                    pesquisa.Carregar(GridViewResultado,
                        HttpContext.Current.User.Identity.Name,
                        HiddenFieldDocumento.Value,
                        HiddenFieldPeriodo.Value,
                        HiddenFieldAgrupamento.Value,
                        Convert.ToBoolean(HiddenFieldSeparaMes.Value),
                        HiddenFieldAnoIni.Value,
                        HiddenFieldMesIni.Value,
                        HiddenFieldAnoFim.Value,
                        HiddenFieldMesFim.Value,
                        HiddenFieldParlamentar.Value,
                        HiddenFieldDespesa.Value,
                        HiddenFieldFornecedor.Value,
                        HiddenFieldUF.Value,
                        HiddenFieldPartido.Value,
                        ChavePesquisa.Value);

                    break;

                case GRUPO_SENADOR:
                    PesquisaSenadores pesquisaSenadores = new PesquisaSenadores();
                    pesquisaSenadores.Carregar(GridViewResultado,
                        HttpContext.Current.User.Identity.Name,
                        HiddenFieldDocumento.Value,
                        HiddenFieldPeriodo.Value,
                        HiddenFieldAgrupamento.Value,
                        Convert.ToBoolean(HiddenFieldSeparaMes.Value),
                        HiddenFieldAnoIni.Value,
                        HiddenFieldMesIni.Value,
                        HiddenFieldAnoFim.Value,
                        HiddenFieldMesFim.Value,
                        HiddenFieldParlamentar.Value,
                        HiddenFieldDespesa.Value,
                        HiddenFieldFornecedor.Value,
                        HiddenFieldUF.Value,
                        HiddenFieldPartido.Value,
                        ChavePesquisa.Value);

                    break;
            }

            String id = HttpUtility.HtmlDecode(Request.QueryString["id"]);
            Session["pesquisa" + id] = GridViewResultado.DataSource;

            Session["SortDirection" + id] = "DESC";
            Session["SortExpression" + id] = "Valor Total";

            LabelMaximo.Visible = (GridViewResultado.Rows.Count == 1000);
        }

        protected void GridViewResultado_Sorting(object sender, GridViewSortEventArgs e)
        {
            String id = HttpUtility.HtmlDecode(Request.QueryString["id"]);

            //Retrieve the table from the session object.
            DataTable dt = Session["pesquisa" + id] as DataTable;

            if (dt != null)
            {
                //Sort the data.
                dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression, id);
                GridViewResultado.DataSource = Session["pesquisa" + id];
                GridViewResultado.DataBind();
            }

        }

        private string GetSortDirection(string column, String id)
        {

            // By default, set the sort direction to ascending.
            string sortDirection = "DESC";

            // Retrieve the last column that was sorted.
            string sortExpression = Session["SortExpression" + id] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // Otherwise, the default value can be returned.
                if (sortExpression == column)
                {
                    string lastDirection = Session["SortDirection" + id] as string;
                    if ((lastDirection != null) && (lastDirection == "DESC"))
                    {
                        sortDirection = "ASC";
                    }
                }
            }

            Session["SortDirection" + id] = sortDirection;
            Session["SortExpression" + id] = column;

            return sortDirection;
        }

        protected void GridViewResultado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.EmptyDataRow)
            {
                e.Row.Cells[1].Visible = false;

                for (Int32 i = 0; i < e.Row.Cells.Count; i++)
                    e.Row.Cells[i].Wrap = false;

                Int32 inicioColunaValores = 0;

                switch (HiddenFieldAgrupamento.Value)
                {
                    case Pesquisa.AGRUPAMENTO_PARLAMENTAR:
                        inicioColunaValores = 7;
                        e.Row.Cells[6].Visible = false; //url
                        break;

                    case Pesquisa.AGRUPAMENTO_FORNECEDOR:
                        inicioColunaValores = 8;

                        if (mAuthenticated == false)
                        {
                            e.Row.Cells[Pesquisa.INDEX_COLUNA_AUDITEI + 1].Visible = false;
                        }

                        break;

                    case Pesquisa.AGRUPAMENTO_DESPESA:
                    case Pesquisa.AGRUPAMENTO_PARTIDO:
                    case Pesquisa.AGRUPAMENTO_UF:
                        inicioColunaValores = 3;
                        break;

                    case Pesquisa.AGRUPAMENTO_DOCUMENTO:
                        inicioColunaValores = 10;

                        e.Row.Cells[7].Visible = false;
                        e.Row.Cells[8].Visible = false;
                        e.Row.Cells[9].Visible = false;
                        break;

                }

                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    for (Int32 i = inicioColunaValores; i < e.Row.Cells.Count; i++)
                    {
                        Double valor;

                        if (Double.TryParse(e.Row.Cells[i].Text, out valor))
                            e.Row.Cells[i].Text = Convert.ToDouble(valor).ToString("N2");
                        else
                            e.Row.Cells[i].Text = "0,00";

                        //e.Row.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                    }

                    Button buttonAuditar = (Button)e.Row.FindControl("ButtonAuditar");

                    switch (HiddenFieldAgrupamento.Value)
                    {
                        case Pesquisa.AGRUPAMENTO_FORNECEDOR:
                            buttonAuditar.Text = "Auditar";

                            if (mAuthenticated == true)
                            {
                                buttonAuditar.Visible = true;

                                if (HttpUtility.HtmlDecode(e.Row.Cells[1].Text).Trim() == "")
                                {
                                    buttonAuditar.OnClientClick = "window.parent.AlertaSemCnpj();return false;";
                                }
                                else
                                {
                                    if (e.Row.Cells[1].Text.Length == 11)
                                    {
                                        buttonAuditar.OnClientClick = "window.parent.TabAuditoria('F','" + e.Row.Cells[1].Text + "');UpdateGridView(" + (e.Row.RowIndex + 1) + "," + Pesquisa.INDEX_COLUNA_AUDITEI.ToString() + ",'Sim');return false;";
                                    }
                                    else
                                    {
                                        buttonAuditar.OnClientClick = "window.parent.TabAuditoria('J','" + e.Row.Cells[1].Text + "');UpdateGridView(" + (e.Row.RowIndex + 1) + "," + Pesquisa.INDEX_COLUNA_AUDITEI.ToString() + ",'Sim');return false;";
                                    }
                                }
                            }
                            else
                            {
                                buttonAuditar.Visible = false;
                            }

                            try { e.Row.Cells[6].Text = Convert.ToDateTime(e.Row.Cells[6].Text).ToString("dd/MM/yyyy"); }
                            catch { }

                            break;

                        case Pesquisa.AGRUPAMENTO_PARLAMENTAR:
                            buttonAuditar.Text = "Site";

                            switch (HiddenFieldGrupo.Value)
                            {
                                case GRUPO_DEPUTADO_FEDERAL:
                                    buttonAuditar.OnClientClick = "window.open('http://www.camara.leg.br/internet/Deputado/dep_Detalhe.asp?id=" + e.Row.Cells[1].Text + "');return false;";
                                    break;
                                case GRUPO_SENADOR:
                                    buttonAuditar.OnClientClick = "window.open('" + e.Row.Cells[5].Text + "');return false;";
                                    break;
                            }

                            break;

                        case Pesquisa.AGRUPAMENTO_DOCUMENTO:
                            buttonAuditar.Visible = false;

                            try { e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[3].Text).ToString("dd/MM/yyyy"); }
                            catch { }

                            long refDoc;

                            if (Int64.TryParse(e.Row.Cells[9].Text, out refDoc))
                            {
                                if (refDoc > 0)
                                {
                                    HyperLink url = new HyperLink();
                                    url.NavigateUrl = "http://www.camara.gov.br/cota-parlamentar/documentos/publ/" + e.Row.Cells[7].Text + "/" + e.Row.Cells[8].Text + "/" + e.Row.Cells[9].Text + ".pdf";
                                    url.Target = "_blank";
                                    url.Text = e.Row.Cells[2].Text;
                                    e.Row.Cells[2].Controls.Clear();
                                    e.Row.Cells[2].Controls.Add(url);
                                }
                            }

                            break;

                        default:
                            buttonAuditar.Visible = false;
                            break;
                    }

                    mTotalGeral += Convert.ToDouble(e.Row.Cells[e.Row.Cells.Count - 1].Text);
                }
                //else if (e.Row.RowType == DataControlRowType.Header)
                //{
                //   for (Int32 i = inicioColunaValores; i < e.Row.Cells.Count; i++)
                //      e.Row.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                //}
                else if (e.Row.RowType == DataControlRowType.Footer)
                {
                    e.Row.Cells[e.Row.Cells.Count - 1].Text = mTotalGeral.ToString("N2");
                    //e.Row.Cells[e.Row.Cells.Count - 1].HorizontalAlign = HorizontalAlign.Right;
                }
            }
        }
    }
}
