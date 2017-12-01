<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.DefaultPage" %> 
<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <asp:PlaceHolder ID="CommonContainerHolder" runat="server"></asp:PlaceHolder>
</asp:Content>