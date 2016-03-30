<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalhesSecretarios.aspx.cs" Inherits="AuditoriaParlamentar.DetalhesSecretarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <asp:Label ID="lblParlamentar" runat="server" Font-Bold="true"></asp:Label>
                <button class="btn btn-primary btn-lg pull-right btn-sm" onclick="window.history.back();" type="button" style="margin-top: -5px;">Retornar a página anterior</button>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="grdSecretarios" CssClass="table table-hover table-striped" runat="server"
                    GridLines="None" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nome" ReadOnly="True" HeaderText="Secretários" />
                    </Columns>
                    <RowStyle CssClass="cursor-pointer" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
