<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarregaDados.aspx.cs" Inherits="AuditoriaParlamentar.CarregaDados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .Grid { font-size: small; font-family: Verdana; }

        .Grid { font-size: small; font-family: Verdana; }

        .style2 { color: #333333; border-collapse: collapse; text-align: left; font-size: 1em; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <fieldset>
            <legend>Carga Cota parlamentar</legend>
            <div class="form-group">
                <asp:FileUpload ID="FileUpload" runat="server" Style="display: inline;" />
                &nbsp;&nbsp;&nbsp;
            <a href="http://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/dados-abertos-cota-parlamentar" target="_blank">Cota Parlamentar Camâra</a>
                &nbsp;&nbsp;&nbsp;
            <a href="http://www.senado.gov.br/transparencia/dadosAbertos/dadosAbertos.asp" target="_blank">Cota Parlamentar Senado</a>
            </div>
            <div class="form-group">
                <div class="checkbox">
                    <label>
                        <asp:CheckBox ID="CheckBoxDiferenca" runat="server" Checked="True" />
                        Apenas Diferença?
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="btn-group" role="group">
                    <asp:Button ID="ButtonEnviar" runat="server" OnClick="ButtonEnviar_Click" Text="Carregar Cotas Deputados" Width="200px" CssClass="btn btn-primary btn-sm" />
                    <asp:Button ID="ButtonEfetivaDep" runat="server" OnClick="ButtonEfetivaDep_Click" Text="Efetiva Cotas Deputados" Width="200px" CssClass="btn btn-default btn-sm" />
                </div>
                <div class="btn-group" role="group">
                    <asp:Button ID="ButtonSenadores" runat="server" OnClick="ButtonSenadores_Click" Text="Carrega Cotas Senadores" Width="200px" CssClass="btn btn-primary btn-sm" />
                    <asp:Button ID="ButtonEfetivaSen" runat="server" OnClick="ButtonEfetivaSen_Click" Text="Efetiva Cotas Senadores" Width="200px" CssClass="btn btn-default btn-sm" />
                </div>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="GridViewAcerto" runat="server" AllowSorting="false" AutoGenerateColumns="false"
                    UseAccessibleHeader="true" CssClass="table table-hover table-striped" GridLines="None"
                    EmptyDataText="Nenhum Anexo Adicionado!" EmptyDataRowStyle-HorizontalAlign="Center">
                </asp:GridView>
                <asp:GridView ID="GridViewPrevia" runat="server" AllowSorting="false" AutoGenerateColumns="false"
                    UseAccessibleHeader="true" CssClass="table table-hover table-striped" GridLines="None"
                    EmptyDataText="Nenhum Anexo Adicionado!" EmptyDataRowStyle-HorizontalAlign="Center">
                </asp:GridView>
            </div>
        </fieldset>

        <fieldset>
            <legend>Carga de Receitas de Eleição</legend>

            <div class="form-inline form-group">
                <asp:Label ID="Label2" runat="server" Text="Ano: "></asp:Label>
                <asp:TextBox ID="TextBoxAno" runat="server" CssClass="form-control input-sm" placeholder="Ano" Width="100px"></asp:TextBox>
                <asp:Button ID="ButtonCarregarRec" runat="server" OnClick="ButtonCarregarRec_Click" Text="Carregar Receitas Eleição" CssClass="btn btn-default btn-sm" />
            </div>
        </fieldset>

        <fieldset>
            <legend>Carga de Suspeitas</legend>

            <div class="form-group">
                <asp:Button ID="ButtonSuspeitas" runat="server" OnClick="ButtonSuspeitas_Click" Text="Carrega Suspeitas" CssClass="btn btn-default btn-sm" />
            </div>
        </fieldset>

        <fieldset>
            <legend>Cargas das Imagens dos Deputados e Senadores</legend>

            <div class="form-group">
                <asp:Button ID="ButtonFotos" runat="server" OnClick="ButtonFotos_Click" Text="Download Fotos" CssClass="btn btn-default btn-sm" />
            </div>
        </fieldset>
    </div>
</asp:Content>
