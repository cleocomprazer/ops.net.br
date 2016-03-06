<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="AuditoriaFornecedor.aspx.cs" Inherits="AuditoriaParlamentar.AuditoriaFornecedor"
    ClientIDMode="Static" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .btn { margin-bottom: 10px; }
    </style>
    <script type="text/javascript">
        $(loadAuditoriaFornecedor);
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <fieldset id="fsConsultaReceita" runat="server">
            <legend>Consulta de CNPJ na Receita Federal</legend>
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <div class="col-md-12">
                        <div class="form-group img-captcha" style="height: 50px">
                            <img id="captcha_img" runat="server" title="Informe o texto da imagem" alt="Captcha" src="#" />
                            <a href="#" id="buscar-captcha-btn" class="btn btn-warning btn-sm" style="margin-left: 3px" title="Carregar outra imagem"><i class="glyphicon glyphicon-refresh"></i></a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label">Digite o Captcha</label>
                            <div class="input-group">
                                <input type="text" id="img-input" value="" class="form-control input-sm input-sm" />
                                <span class="input-group-btn">
                                    <button type="button" id="buscarDados-btn" class="btn btn-primary btn-sm">Buscar</button>
                                </span>
                            </div>
                            <p class="bg-danger pull-left hidden msg" style="padding: 10px 20px;">
                                <i class="glyphicon glyphicon-warning-sign"></i>&nbsp;<strong><span id="msgErro-span"></span></strong>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <p class="text-justify">
                        O Captcha exibido é necessário para você consultar os dados do fornecedor na página da Receita Federal.<br />
                        Após a consulta as informações do fornecedor serão salvas para as próximas consultas e para os próximos
                        usuários que auditarem este fornecedor.<br />
                        Caso tenha alguma dúvida entre em <a href="mailto:suporte@ops.net.br">contato</a>.
                    </p>
                </div>
            </div>
            <br />
        </fieldset>
        <div class="row" id="dvBotoesAcao" runat="server">
            <div class="col-md-12 text-center">
                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#dvQueProcurar">O Que Procurar?</a>
                <asp:Button ID="ButtonAtualizar" runat="server" Text="Atualizar Dados" ToolTip="Reconsultar dados a partir da Receita Federal" CssClass="btn btn-primary btn-sm" />
                <asp:Button ID="ButtonDenunciar" runat="server" Text="Denunciar" ToolTip="Denunciar esse Fornecedor" CssClass="btn btn-success btn-sm" />
                <asp:Button ID="ButtonMaps" runat="server" Text="Pesquisar no Maps" ToolTip="Pesquisar Fornecedor no Maps" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonPesquisa" runat="server" Text="Pesquisar no Google" ToolTip="Pesquisar Fornecedor no Google" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonListarDeputados" runat="server" Text="Listar Parlamentares" ToolTip="Listar Todos os Parlamentares que Contrataram esse Fornecedor" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonListarDocumentos" runat="server" Text="Solicitar/Listar Documentos" CssClass="btn btn-default btn-sm" />
                <asp:Button ID="ButtonListarDoacoes" runat="server" Text="Listar Doações Eleitorais" ToolTip="Listar Doações Eleitorais do Fornecedor" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>
        <fieldset id="fsMinhasDenuncias" runat="server" visible="false">
            <legend>Denúncias</legend>
            <div class="row">
                <div class="col-md-12">
                    <div runat="server" id="LabelExisteDenuncia" class="alert alert-danger"></div>
                </div>
                <div class="col-md-12">
                    <asp:GridView ID="GridViewDenuncias" runat="server" AllowSorting="True" UseAccessibleHeader="true"
                        CssClass="table table-hover table-striped" GridLines="None">
                        <RowStyle CssClass="cursor-pointer" />
                    </asp:GridView>
                </div>
            </div>
            <br />
        </fieldset>
        <fieldset id="fsDadosReceita" runat="server">
            <legend>Cadastro nacional da pessoa jurídica</legend>
            <div runat="server" id="dvInfoDataConsultaCNPJ" class="alert alert-warning" visible="false"></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">CNPJ</label>
                        <span runat="server" id="lblCNPJ" class="control-label show"></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Data de abertura</label>
                        <span runat="server" id="lblDataAbertura" class="control-label show"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Razão social / Nome empresarial </label>
                        <span runat="server" id="lblRazaoSocial" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Nome fantasia / Título do estabelecimento</label>
                        <span runat="server" id="lblNomeFantasia" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="control-label">Código e descrição da atividade econômica principal (CNAE)</label>
                        <span runat="server" id="lblAtividadePrincipal" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="control-label">Código e descrição das atividades econômicas secundárias</label>
                        <span runat="server" id="lblAtividadeSecundaria" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="control-label">Código e descrição da natureza jurídica</label>
                        <span runat="server" id="lblCodigoDescricaoNaturezaJuridica" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label">Logradouro</label>
                        <span runat="server" id="lblLogradouro" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label class="control-label">Numero</label>
                        <span runat="server" id="lblNumero" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Complemento</label>
                        <span runat="server" id="lblComplemento" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Bairro / Distrito</label>
                        <span runat="server" id="lblBairro" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Município / Cidade</label>
                        <span runat="server" id="lblCidade" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label class="control-label">CEP</label>
                        <span runat="server" id="lblCep" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label class="control-label">UF</label>
                        <span runat="server" id="lblUf" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Situação Cadastral</label>
                        <span runat="server" id="lblSituacaoCadastral" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Data da situação cadastral</label>
                        <span runat="server" id="lblDataSituacaoCadastral" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Motivo de situação cadastral </label>
                        <span runat="server" id="lblMotivoSituacaoCadastral" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Situação especial</label>
                        <span runat="server" id="lblSituacaoEspecial" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Data da situação especial</label>
                        <span runat="server" id="lblDataSituacaoEspecial" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Ente federativo responsável (EFR)</label>
                        <span runat="server" id="lblEnteFederativoResponsavel" class="control-label show" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Endereço eletrônico (E-mail)</label>
                        <span runat="server" id="lblEmail" class="control-label show" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Telefone</label>
                        <span runat="server" id="lblTelefone" class="control-label show" />
                    </div>
                </div>
            </div>
            <%--<div class="row">
                    <div class="col-md-12 text-center">
                        Clique <a href="http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp" target="_blank" rel="nofollow">aqui</a> caso queira consultar as informações diretamente na Receita federal.
                    </div>
                </div>--%>
        </fieldset>
        <fieldset id="fsQuadroSocietario" runat="server">
            <legend>Quadro de Sócios e Administradores - QSA</legend>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="control-label">Capital Social</label>
                        <span runat="server" id="lblCapitalSocial" class="control-label show"></span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <table class="table table-condensed table-striped" id="tbQuadroSocietario">
                            <thead>
                                <tr>
                                    <th>Nome/Nome Empresarial</th>
                                    <th>Qualificação</th>
                                    <th>Nome do Repres. Legal</th>
                                    <th>Qualif. Rep. Legal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="rptQuadroSocietario">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Nome") %></td>
                                            <td><%# Eval("Qualificacao") %></td>
                                            <td><%# Eval("NomeRepresentanteLegal") %></td>
                                            <td><%# Eval("QualificacaoRepresentanteLegal") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Literal runat="server" ID="ltrSemQuadroSocios" />
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </fieldset>
        <div id="dvQueProcurar" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">O que procurar?</h4>
                    </div>
                    <div class="modal-body text-justify">
                        <p>
                            A primeira coisa que sugerimos é começar a investigar o fornecedor. Em várias fiscalizações que a OPS já realizou, a empresa esteva registrada em endereços que não condiziam com a realidade do local. Um exemplo é a de uma locadora que dizia funcionar aonde, na realidade havia uma padaria. Você pode utilizar o Google Maps ou o Street View (se estiver disponível) para avaliar a localização da empresa. Visite o local, se for possível.
                        </p>
                        <p>
                            Outra sugestão é verificar se a empresa possui uma página na internet e se ela realmente fornece o serviço prestado ao parlamentar. A OPS já encontrou “empresas” que faturavam alguns milhões de reais tendo como clientes apenas políticos. Além disso, estas empresas não possuíam qualquer publicidade na internet ou em outro lugar. Empresas sérias não se escondem e são facilmente localizadas.
                        </p>
                        <p>
                            O foco da OPS não é a empresa prestadora de serviço ou fornecedora de produtos ao parlamentar, mas a nossa experiência nos mostra que muitas vezes empresas fajutas eram abertas apenas para emitirem notas a parlamentares.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Entendi</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
