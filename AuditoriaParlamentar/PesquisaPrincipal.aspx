<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
	CodeBehind="PesquisaPrincipal.aspx.cs" Inherits="AuditoriaParlamentar.PesquisaPrincipal"
	EnableEventValidation="false" ClientIDMode="Static" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
	<style type="text/css">
		label { margin-bottom: 2px; }

		.form-group { margin-bottom: 10px; }

		.watermark { background-image: url(assets/img/logo_opaca.png); background-repeat: no-repeat; position: fixed; bottom: 5px; right: 5px; width: 600px; height: 365px; z-index: -1; }
	</style>
	<script type="text/javascript">
		$(loadPesquisaPrincipal);
	</script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

	<div id="popover_content_wrapper" style="display: none">
		<input type="button" class="btn btn-success btn-sm btn-block" value="Por Fornecedor" />
		<input type="button" class="btn btn-primary btn-sm btn-block" value="Por Parlamentar" />
		<input type="button" class="btn btn-primary btn-sm btn-block" value="Por Despesa" />
		<input type="button" class="btn btn-primary btn-sm btn-block" value="Por Partido" />
		<input type="button" class="btn btn-primary btn-sm btn-block" value="Por UF (Parlamentar)" />
		<input type="button" class="btn btn-primary btn-sm btn-block" value="Por Documento" />
		<input type="button" class="btn btn-default btn-sm btn-block" value="Cancelar" />
	</div>

	<div id="conteudo" class="container-fluid" style="overflow: auto">
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label>Cargo</label>
					<asp:DropDownList ID="DropDownListGrupo" runat="server" Width="100%"
						AutoPostBack="True" OnSelectedIndexChanged="DropDownListGrupo_SelectedIndexChanged" CssClass="form-control input-sm">
					</asp:DropDownList>
				</div>
				<div class="form-group">
					<label>Período</label>
					<asp:DropDownList ID="DropDownListPerido" runat="server" Width="100%" CssClass="form-control input-sm"></asp:DropDownList>
				</div>
				<div class="form-group periodo">
					<label>Inicial</label>
					<div class="row">
						<div class="col-xs-6">
							<asp:DropDownList ID="DropDownListMesInicial" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
						</div>
						<div class="col-xs-6">
							<asp:DropDownList ID="DropDownListAnoInicial" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
						</div>
					</div>
				</div>
				<div class="form-group periodo">
					<label>Final</label>
					<div class="row">
						<div class="col-xs-6">
							<asp:DropDownList ID="DropDownListMesFinal" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
						</div>
						<div class="col-xs-6">
							<asp:DropDownList ID="DropDownListAnoFinal" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>Parlamentares</label>
					<asp:ListBox ID="DropDownListParlamentar" runat="server" CssClass="form-control input-sm selectpicker"
						SelectionMode="Multiple" data-selected-text-format="count > 2" data-live-search="true"></asp:ListBox>
				</div>
				<div class="form-group">
					<label>Despesas</label>
					<asp:ListBox ID="DropDownListDespesa" runat="server" CssClass="form-control input-sm selectpicker"
						SelectionMode="Multiple" data-selected-text-format="count > 2" data-live-search="true"></asp:ListBox>
				</div>
				<div class="form-group">
					<label>UF (Parlamentar)</label>
					<asp:ListBox ID="DropDownListUF" runat="server" CssClass="form-control input-sm selectpicker"
						SelectionMode="Multiple" data-selected-text-format="count > 2" data-live-search="true"></asp:ListBox>
				</div>
				<div class="form-group">
					<label>Partido</label>
					<asp:ListBox ID="DropDownListPartido" runat="server" CssClass="form-control input-sm selectpicker"
						SelectionMode="Multiple" data-selected-text-format="count > 2" data-live-search="true"></asp:ListBox>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>Fornecedor</label>
					<asp:TextBox ID="txtFornecedor" runat="server" CssClass="form-control input-sm" placeholder="CNPJ/CPF"></asp:TextBox>
				</div>
				<div class="form-group">
					<label>Agrupar</label>
					<asp:DropDownList ID="DropDownListAgrupamento" runat="server" Width="100%" CssClass="form-control input-sm"></asp:DropDownList>
				</div>
				<div class="checkbox">
					<label>
						<asp:CheckBox ID="CheckBoxSepararMes" runat="server" />
						Exibir mês a mês?
					</label>
				</div>
				<div class="form-group">
					<asp:Button ID="ButtonPesquisar" runat="server" OnClick="ButtonPesquisar_Click" Text="Clique para Pesquisar" CssClass="btn btn-success btn-sm" UseSubmitBehavior="false" />
					<input type="button" value="Limpar Filtros" class="btn btn-default btn-sm" onclick="LimparFiltros();" />
					<asp:Button ID="ButtonShare" runat="server" OnClick="ButtonShare_Click" Text="Compartilhar" CssClass="btn btn-default btn-sm" Visible="false" />
				</div>
				<a href="javascript:void(0);" class="text-center" style="display: block;" onclick="__doPostBack('ButtonExportar_Click', '');">Exportar Consulta em CSV</a>
				<asp:UpdatePanel ID="UpdatePanelUltimaAtualizacao" runat="server"
					UpdateMode="Conditional">
					<ContentTemplate>
						<center>
                                <asp:Label ID="LabelUltimaAtualizacao" runat="server" Text="Última Atualização:"></asp:Label>
                            </center>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="DropDownListGrupo" EventName="SelectedIndexChanged" />
					</Triggers>
				</asp:UpdatePanel>
			</div>
			<div class="col-md-12">
				<hr />
				<div id="LabelMaximo" runat="server" class="alert alert-warning" visible="false">
					O resultado está limitado a 1.000 registros para evitar sobrecarga.
				</div>
				<div class="table-responsive">
					<asp:GridView ID="GridViewResultado" runat="server" AllowSorting="True"
						OnRowDataBound="GridViewResultado_RowDataBound" OnSorting="GridViewResultado_Sorting"
						ShowFooter="True" ViewStateMode="Disabled" UseAccessibleHeader="true"
						CssClass="table table-hover table-striped table-condensed" GridLines="None" EnableViewState="false"
						EmptyDataText="Nenhum registro Encontrado!" EmptyDataRowStyle-HorizontalAlign="Center">
						<Columns>
							<asp:TemplateField>
								<FooterTemplate>
									<asp:Label ID="LabelTotal" runat="server" Text="Total Geral:"></asp:Label>
								</FooterTemplate>
								<ItemTemplate>
									<a tabindex="0" role="button" class="popover-link btn btn-primary btn-sm" data-valor="<%# Eval("[0]") %>" data-descricao="<%# Eval("[1]") %>">Detalhar</a>
									<asp:Button ID="ButtonAuditar" runat="server" Text="Auditar" CssClass="btn btn-default btn-sm" />
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
