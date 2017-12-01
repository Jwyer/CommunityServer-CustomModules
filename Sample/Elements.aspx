<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Elements.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.Elements" %> 
<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <asp:PlaceHolder ID="CommonContainerHolder" runat="server"></asp:PlaceHolder>
</asp:Content>