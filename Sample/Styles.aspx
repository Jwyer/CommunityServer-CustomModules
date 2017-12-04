<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Styles.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.Styles" %>

<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <div>
        <h1>Text styles</h1>
        <div class="header-base big">header-base big</div>
        <div class="header-base large">header-base large</div>
        <div class="header-base">header-base</div>
        <div class="header-base middle">header-base middle</div>
        <div class="header-base medium">header-base medium</div>
        <div class="header-base small">header-base small</div>
        <div class="bold">bold</div>
        <div class="red-text">red-text</div>
        <div class="gray-text">gray-text</div>
        <div class="blue-text">blue-text</div>
        <h1>Link styles</h1>
        <a class="link">link</a><br />
        <a class="link dotted">link dotted</a><br />
        <a class="link dotline">link dotline</a><br />
        <a class="link underline">link underline</a><br />
        <a class="link header blue">link header blue</a><br />
        <a class="link middle blue">link middle blue</a><br />
        <a class="link medium gray">link medium gray</a><br />
        <a class="link small gray">link small gray</a><br />
        <a class="link bold">link bold</a>
        <h1>Button styles</h1>
        <div class="big-button-container">
            <a class="button blue big">button blue big</a>
            <span class="splitter-buttons"></span>
            <a class="button blue big disable">button blue big disable</a>
            <span class="splitter-buttons"></span>
            <a class="button gray big">button gray big</a>
            <span class="splitter-buttons"></span>
            big-button-container
        </div>
        <div class="middle-button-container">
            <a class="button blue middle">button blue middle</a>
            <span class="splitter-buttons"></span>
            <a class="button gray middle">button gray middle</a>
            <span class="splitter-buttons"></span>
            <a class="button gray middle disable">button gray middle disable</a>
            <span class="splitter-buttons"></span>
            middle-button-container
        </div>
        <div class="small-button-container">
            <a class="button blue medium">button blue medium</a>
            <span class="splitter-buttons"></span>
            <a class="button gray medium">button gray medium</a>
            <span class="splitter-buttons"></span>
            <a class="button gray group"><span>button gray group</span></a>
            <span class="splitter-buttons"></span>
            small-button-container
        </div>
    </div>
</asp:Content>
