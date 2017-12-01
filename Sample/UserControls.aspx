<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserControls.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.UserControls" %> 
<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <asp:PlaceHolder ID="CommonContainerHolder" runat="server"></asp:PlaceHolder>
</asp:Content>