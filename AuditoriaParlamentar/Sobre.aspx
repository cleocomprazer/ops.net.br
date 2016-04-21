<%@ Page Title="Operação Política Supervisionada :: Sobre" Language="C#" MasterPageFile="~/Site.master"
	AutoEventWireup="false" CodeBehind="Sobre.aspx.cs" Inherits="AuditoriaParlamentar.Sobre" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
	<style type="text/css">
		#sobre-page .style2 { text-indent: 30px; text-align: justify; }

		#sobre-page .bs-callout { padding: 20px; margin: 20px 0; border: 1px solid #eee; border-left-width: 5px; border-radius: 3px; }

		#sobre-page .bs-callout-info { border-left-color: #1b809e; }

		.embed-responsive-16by9 { padding-bottom: 56.25%; }
	</style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<div class="container" id="sobre-page">
		<br />
		<div id="info-geral">
			<h3 class="media-heading text-center">Conheça a Operação Política Supervisionada</h3>
			<%--<br />
			<div class="embed-responsive embed-responsive-16by9 form-group">
				<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/4gSHjpGLRgQ" frameborder="0" allowfullscreen></iframe>
			</div>--%>
			<div class="row">
				<div class="col-md-6">
					<div class="bs-callout bs-callout-info">
						<h4 class="media-heading">O que é a OPS?</h4>
						<br>
						<p class="text-justify style2">A <strong>Operação Política Supervisionada - OPS</strong> fiscaliza de forma detalhada os gastos realizados via CEAP ou CEAPS. Até o momento já foram economizados mais de R$ 5,5 milhões do dinheiro público graças a estas fiscalizações e às exigências feitas diretamente aos parlamentares para que devolvam o dinheiro público indevidamente utilizado.</p>
						<p class="text-justify style2">A OPS conta com a ajuda de seus colaboradores, espalhados pelo Brasil, para o levantamento de informações necessárias para a conclusão de fiscalizações, como por exemplo, o envio de fotos de endereços suspeitos em diversas cidades do país. Além disso, qualquer um pode ser um fiscal dos gastos públicos e este site oferece dados suficientes para isso.</p>
						<p class="text-justify style2">Apesar de ser especialista na fiscalização dos gastos com a verba indenizatória, a OPS também aceita denúncias de outros setores públicos, dando a elas o destino certo para que sejam apuradas pelas autoridades competentes.</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="bs-callout bs-callout-info">
						<h4 class="media-heading">O que é CEAP (CEAPS)?</h4>
						<br>
						<p class="text-justify style2">CEAP é a sigla da <strong>Cota para o Exercício da Atividade Parlamentar</strong> (No Senado se chama CEAPS).</p>
						<p class="text-justify style2">Trata-se de um recurso público disponível mensalmente aos deputados e senadores para o custeio de suas atividades parlamentares.</p>
						<p class="text-justify style2">Apesar de ser dinheiro público, fato que já implicaria no seu enquadramento à Lei Nº 8.666, o uso da verba dispensa qualquer tipo de burocracia exigida pela lei de licitações, dando ao deputado e ao senador a livre escolha da empresa a ser contratada para fornecimento do produto ou serviço.</p>
						<p class="text-justify style2">Não é raro encontrar irregularidades escandalosas, como locações de veículos feitas em padarias ou cópias de trabalhos escolares transformados em «pareceres jurídicos» generosamente pagos com o dinheiro do contribuinte.</p>
					</div>
				</div>
			</div>
		</div>
		<br />
		<p class="text-center"><a href="https://luciobig.com.br/o-que-e-ops/" target="_blank" class="btn btn-success">Saiba Mais&nbsp;<i class="glyphicon glyphicon-menu-right"></i></a></p>
	</div>
</asp:Content>
