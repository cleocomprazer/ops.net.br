<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PaginaInterna.Master"
    CodeBehind="CidadesPendenciaGrid.aspx.cs" Inherits="AuditoriaParlamentar.CidadesPendenciaGrid" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
      a:link, a:visited { color: #034af3; }

      .fonte2 { text-indent: 40px; }
   </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
      <div class="panel panel-default">
         <div class="panel-body">
            <p class='fonte2 text-justify'>
               Precisamos da sua ajuda para levantar informações nas cidades relacionadas abaixo.
                    Na maioria das vezes precisamos de uma fotografia atualizada de algum endereço suspeito.
                    Em alguns poucos casos precisamos de documentos na junta comercial. Se você tiver
                    disponibilidade e for maior de 18 anos entre em contado no email <a href="mailto:luciobig@ops.net.br">luciobig@ops.net.br</a> para receber as instruções.
            </p>
            <p class="text-center">
               <asp:Button ID="ButtonGerenciar" runat="server" Text="Gerenciar" CssClass="btn btn-success" OnClick="ButtonGerenciar_Click" />
            </p>
         </div>
      </div>
      <div class="table-responsive">
         <asp:GridView ID="GridViewCidades" runat="server" CssClass="table table-hover table-striped" GridLines="None"
            AutoGenerateColumns="False" UseAccessibleHeader="true"
            EmptyDataText="Nenhuma pendência foi incluída" EmptyDataRowStyle-HorizontalAlign="Center">
            <Columns>
               <asp:BoundField DataField="Uf" HeaderText="UF" />
               <asp:BoundField DataField="Cidade" HeaderText="Cidade" />
               <asp:BoundField DataField="pendencias" HeaderText="Qtde. Pendências" />
            </Columns>
            <RowStyle CssClass="cursor-pointer" />
         </asp:GridView>
      </div>
   </div>
</asp:Content>