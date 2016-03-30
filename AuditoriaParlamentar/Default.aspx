<%@ Page Title="OPS - Operação Política Supervisionada" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuditoriaParlamentar.Default" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveClientUrl("~/") %>assets/css/landing-page.css?v=<%= Configuracao.VersaoSite %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg">
        <div class="intro-header">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="intro-message">
                            <h1>Operação Política Supervisionada</h1>
                            <h3>Além do projeto, uma solução real</h3>
                            <hr class="intro-divider" />
                            <ul class="list-inline">
                                <li>
                                    <a href="http://luciobig.com.br/o-que-e-ops/" class="btn btn-primary btn-lg" target="_blank"><i class="glyphicon glyphicon-heart"></i>&nbsp;Conheça</a>
                                </li>
                                <li>
                                    <a id="btnAuditar" runat="server" href="PesquisaInicio.aspx" class="btn btn-success btn-lg" target="_blank"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;Fiscalize</a>
                                </li>
                                <li>
                                    <a href="http://luciobig.com.br/pagina-para-doacoes_16-html/" class="btn btn-default btn-lg" target="_blank"><i class="glyphicon glyphicon-usd"></i>&nbsp;Doe</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-section-a resumo-gastos">
            <div class="container">
                <div class="panel panel-danger">
                    <div class="panel-heading">Quem mais gastou em 2015</div>
                    <div class="panel-body">
                        <asp:Repeater runat="server" ID="rptMaioresGastos">
                            <ItemTemplate>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="card form-group">
                                        <canvas class="header-desempenho bg-danger" width="250" height="70"></canvas>
                                        <div class="avatar">
                                            <img src='./Figuras/Parlamentares/<%# DataBinder.Eval(Container.DataItem, "urlImagem") %>' alt='<%# DataBinder.Eval(Container.DataItem, "nomeParlamentar") %>'>
                                        </div>
                                        <div class="content">
                                            <p title="Nome do parlamentar">
                                                <%# DataBinder.Eval(Container.DataItem, "nomeParlamentar") %>
                                            </p>
                                            <p title="Cargo">
                                                <%# DataBinder.Eval(Container.DataItem, "cargoParlamentar") %>
                                            </p>
                                            <p title="Despesa">
                                                <%# DataBinder.Eval(Container.DataItem, "descricaoCartao") %>
                                            </p>
                                            <p title="Valor gasto em reais">
                                                R$ <%# DataBinder.Eval(Container.DataItem, "valorCard", "{0:#,###.00}") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">Quem menos gastou em 2015</div>
                    <div class="panel-body">
                        <asp:Repeater runat="server" ID="rptMenoresGastos">
                            <ItemTemplate>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="card form-group">
                                        <canvas class="header-desempenho bg-primary" width="250" height="70"></canvas>
                                        <div class="avatar">
                                            <img src='./Figuras/Parlamentares/<%# DataBinder.Eval(Container.DataItem, "urlImagem") %>' alt='<%# DataBinder.Eval(Container.DataItem, "nomeParlamentar") %>'>
                                        </div>
                                        <div class="content">
                                            <p title="Nome do parlamentar">
                                                <%# DataBinder.Eval(Container.DataItem, "nomeParlamentar") %>
                                            </p>
                                            <p title="Cargo">
                                                <%# DataBinder.Eval(Container.DataItem, "cargoParlamentar") %>
                                            </p>
                                            <p title="Despesa">
                                                <%# DataBinder.Eval(Container.DataItem, "descricaoCartao") %>
                                            </p>
                                            <p title="Valor gasto em reais">
                                                R$ <%# DataBinder.Eval(Container.DataItem, "valorCard", "{0:#,###.00}") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>

        <div class="container banner1">
            <div class="row">
                <div class="col-lg-12 text-center text-success">
                    <h2>Mais de <b>R$5,5 MILHÕES</b> de Economia aos Cofres Públicos</h2>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-lg-12">
                    <asp:Repeater runat="server" ID="rptResumoAuditoria">
                        <ItemTemplate>
                            <div class="col-xs-12 col-sm-4 text-center">
                                <div class="bs-callout bs-callout-info">
                                    <h3><%# Eval("Resultado") %></h3>
                                    <p><%# Eval("Nome") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <br />
        </div>
        <div class="content-section-a">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4 media-middle">
                        <div class="form-group text-center">
                            <img src="assets/img/ops_fiscalize.png" alt="OPS Fiscalize" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-8">
                        <h4>OPS Fiscalize</h4>
                        <br />
                        <p class="text-justify">Já está disponível o OPS Fiscalize, aplicativo que permite a qualquer pessoa fiscalizar os gastos realizados por deputados federais com a verba indenizatória, dinheiro público destinado à reposição de despesas feitas pelos parlamentares no exercício do mandato.</p>
                        <p class="text-justify">Disponível para Android e IOS, o OPS Fiscalize reúne, atualizadamente, os custos gerados por deputados da 55ª legislatura.</p>
                        <br />
                        <div class="ops-fiscalize-button">
                            <div class="form-group">
                                <a href="https://play.google.com/store/apps/details?id=br.net.ops.fiscalize" class="btn btn-primary" target="_blank" rel="nofollow">Android&nbsp;<i class="glyphicon glyphicon-menu-right"></i></a>
                            </div>
                            <div class="form-group">
                                <a href="https://itunes.apple.com/br/app/ops-fiscalize/id1016302793?l=en&mt=8" class="btn btn-primary" target="_blank" rel="nofollow">IOS&nbsp;<i class="glyphicon glyphicon-menu-right"></i></a>
                            </div>
                            <div class="form-group">
                                <a href="https://www.microsoft.com/pt-br/store/apps/ops-fiscalize/9nblggh686vc" class="btn btn-primary" target="_blank" rel="nofollow">Windows Phone&nbsp;<i class="glyphicon glyphicon-menu-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" id="info-geral">
            <div class="row">
                <div class="col-md-6">
                    <div class="bs-callout bs-callout-info">
                        <h4 class="media-heading">O que é CEAP (CEAPS)?</h4>
                        <br />
                        <p class="text-justify">CEAP é a sigla da Cota para o Exercício da Atividade Parlamentar (No Senado se chama CEAPS).</p>
                        <p class="text-justify">Trata-se de um recurso público disponível mensalmente aos deputados e senadores para o custeio de suas atividades parlamentares.</p>
                        <p class="text-justify">Apesar de ser dinheiro público, fato que já implicaria no seu enquadramento à Lei Nº 8.666, o uso da verba dispensa qualquer tipo de burocracia exigida pela lei de licitações, dando ao deputado e ao senador a livre escolha da empresa a ser contratada para fornecimento do produto ou serviço.</p>
                        <p class="text-justify">Não é raro encontrar irregularidades escandalosas, como locações de veículos feitas em padarias ou cópias de trabalhos escolares transformados em «pareceres jurídicos» generosamente pagos com o dinheiro do contribuinte.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="bs-callout bs-callout-info">
                        <h4 class="media-heading">O que é a OPS?</h4>
                        <br />
                        <p class="text-justify">A Operação Política Supervisionada - OPS - fiscaliza de forma detalhada os gastos realizados via CEAP ou CEAPS. Até o momento já foram economizados mais de R$ 5,5 milhões do dinheiro público graças a estas fiscalizações e às exigências feitas diretamente aos parlamentares para que devolvam o dinheiro público indevidamente utilizado.</p>
                        <p class="text-justify">A OPS conta com a ajuda de seus colaboradores, espalhados pelo Brasil, para o levantamento de informações necessárias para a conclusão de fiscalizações, como por exemplo, o envio de fotos de endereços suspeitos em diversas cidades do país. Além disso, qualquer um pode ser um fiscal dos gastos públicos e este site oferece dados suficientes para isso.</p>
                        <p class="text-justify">Apesar de ser especialista na fiscalização dos gastos com a verba indenizatória, a OPS também aceita denúncias de outros setores públicos, dando a elas o destino certo para que sejam apuradas pelas autoridades competentes.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner">
            <div class="container text-center">
                <div class="fb-comments" data-href="http://ops.net.br" data-numposts="5" data-width="100%"></div>
            </div>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center" style="margin-top: 15px;">
                            <div class="fb-like" data-href="http://ops.net.br" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
                        </div>
                        <p style="margin: 10px 0 0;" class="text-muted text-center">O controle social é indispensável para combatermos a corrupção em nosso país.</p>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1033624573364106";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</asp:Content>
