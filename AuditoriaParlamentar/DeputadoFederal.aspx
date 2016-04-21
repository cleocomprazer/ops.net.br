<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
	CodeBehind="DeputadoFederal.aspx.cs" Inherits="AuditoriaParlamentar.DeputadoFederal"
	EnableEventValidation="false" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<style>
		.deputado-header { margin: 10px auto; background-color: #f8f8f8; border: 1px solid #e7e7e7; border-radius: 3px; }
			.box-deputado a:hover, .deputado-header .box a:active { text-decoration: none; }
		.box-deputado .box-item { margin: 10px auto; }
			.box-deputado .box-item .box-item-title { font-size: 30px; }
			.box-deputado .box-item .box-item-text { }

		.img-parlamentar { margin: 0 auto; margin-top: 15px; }
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container-fluid">
		<div class="row box-deputado">
			<div class="col-xs-12 col-sm-8">
				<asp:FormView runat="server" ID="frvDeputadoFederal" RenderOuterTable="false">
					<ItemTemplate>
						<div class="row deputado-header">
							<div class="col-xs-12 col-md-4 col-lg-3 form-group">
								<div class="thumbnail img-parlamentar">
									<img src="./Figuras/Parlamentares/DEPFEDERAL/<%# DataBinder.Eval(Container.DataItem, "ideCadastro") %>.jpg" alt="<%# DataBinder.Eval(Container.DataItem, "txNomeParlamentar") %>" width="120" width="160">
								</div>
							</div>
							<div class="col-xs-12 col-md-8 col-lg-9 form-group">
								<h3>Dep. <%# DataBinder.Eval(Container.DataItem, "txNomeParlamentar") %></h3>
								<p class="text-muted"><%# DataBinder.Eval(Container.DataItem, "nome") %></p>
								<h4><%# DataBinder.Eval(Container.DataItem, "partido") %> / <%# DataBinder.Eval(Container.DataItem, "uf") %></h4>
								<p><a href="mailto:<%# DataBinder.Eval(Container.DataItem, "email").ToString().ToLower() %>"><%# DataBinder.Eval(Container.DataItem, "email") %></a></p>
								<p><a href="http://www.camara.leg.br/internet/Deputado/dep_Detalhe.asp?id=<%# DataBinder.Eval(Container.DataItem, "ideCadastro") %>" target="_blank" rel="nofollow">Perfil na Camâra</a></p>
							</div>
						</div>
					</ItemTemplate>
				</asp:FormView>
			</div>
			<div class="col-xs-12 col-sm-4">
				<a href="PesquisaInicio.aspx?periodo=Tudo&agrupamento=Por%20Despesa&cargo=Deputado%20Federal&parlamentar=<%= Request.QueryString["id"] %>" title="Clique para ver o detalhamento das despesas">
					<div class="box-item form-group alert alert-info text-center">
						<div class="box-item-title" id="ValorTotal" runat="server"></div>
						<div class="box-item-text">Gastos com Cota Parlamentar (CEAP)</div>
					</div>
				</a>
				<a href="DetalhesSecretarios.aspx?ideCadastro=<%= Request.QueryString["id"] %>" title="Clique para ver a lista de secretários">
					<div class="box-item form-group alert alert-info text-center">
						<div class="box-item-title" id="TotalFuncionarios" runat="server"></div>
						<div class="box-item-text">Secretários parlamentares</div>
					</div>
				</a>
			</div>
		</div>

		<fieldset>
			<legend>Classificações de Despesas</legend>
			<div class="table-responsive">
				<asp:GridView ID="GridViewDepudadoFederal" runat="server" AllowSorting="false" UseAccessibleHeader="true"
					OnRowDataBound="GridViewDepudadoFederal_RowDataBound" OnSorting="GridViewDepudadoFederal_Sorting"
					CssClass="table table-hover table-striped" GridLines="None" AutoGenerateColumns="false"
					EmptyDataText="Não há gestos para exibir." EmptyDataRowStyle-HorizontalAlign="Center" ShowFooter="true">
					<Columns>
						<asp:BoundField DataField="Despesa" SortExpression="Despesa" HeaderText="Descrição" />
						<asp:BoundField DataField="ValorTotal" SortExpression="ValorTotal" HeaderText="Valor Total" DataFormatString="{0:N2}" />
					</Columns>
					<RowStyle CssClass="cursor-pointer" />
				</asp:GridView>
			</div>

			<div class="text-center form-group">
				<a href="PesquisaInicio.aspx?periodo=Tudo&agrupamento=Por%20Documento&cargo=Deputado%20Federal&parlamentar=<%= Request.QueryString["id"] %>" class="btn btn-primary btn-sm">Ver detalhes das despesas</a>
			</div>
		</fieldset>
	</div>
</asp:Content>
