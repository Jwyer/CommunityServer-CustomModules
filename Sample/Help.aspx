<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Help.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.Help" %>

<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <div>
        <h1>Help page</h1>
        If you have any questions visit links below:
        <ul>
            <li>
                <a href="http://helpcenter.onlyoffice.com/" target="_blank">Help Center</a>
            </li>
            <li>
                <a href="http://cloud.onlyoffice.org/" target="_blank">SaaS Forum</a>
            </li>
            <li>
                <a href="http://dev.onlyoffice.org/" target="_blank">Server Forum</a>
            </li>
            <li>
                <a href="http://support.onlyoffice.com/" target="_blank">Support Contact Form</a>
            </li>
        </ul>
    </div>
</asp:Content>
