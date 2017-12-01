<%@ Import Namespace="ASC.Web.Sample.Resources" %>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavigationSidePanel.ascx.cs" Inherits="ASC.Web.Sample.Controls.NavigationSidePanel" %>


<div class="page-menu">
    <ul class="menu-actions">
        <li id="menuCreateNewButton" class="menu-main-button without-separator middle" title="<%= SampleResource.NavigateTo %>">
            <span class="main-button-text"><%= SampleResource.NavigateTo %></span>
            <span class="white-combobox"></span>
        </li>
        <li id="menuOtherActionsButton" class="menu-gray-button" title="<%= SampleResource.MoreActions %>">
            <span class="btn_other-actions">...</span>
        </li>
    </ul>

    <div id="createNewButton" class="studio-action-panel">
        <ul class="dropdown-content">
            <li>
                <a class="dropdown-item" href="default.aspx"><%= SampleResource.Default %></a>
            </li>
            <li>
                <a class="dropdown-item" href="styles.aspx"><%= SampleResource.Styles %></a>
            </li>
            <li>
                <a class="dropdown-item" href="elements.aspx"><%= SampleResource.Elements %></a>
            </li>
            <li>
                <a class="dropdown-item" href="usercontrols.aspx"><%= SampleResource.Controls %></a>
            </li>
            <li>
                <a class="dropdown-item" href="database.aspx"><%= SampleResource.Database %></a>
            </li>
            <li>
                <a class="dropdown-item" href="api.aspx"><%= SampleResource.Api %></a>
            </li>
            <li>
                <a class="dropdown-item" href="help.aspx"><%= SampleResource.Help %></a>
            </li>
        </ul>
    </div>

    <div id="otherActions" class="studio-action-panel">
        <ul class="dropdown-content">
            <li>
                <a class="dropdown-item" href="default.aspx"><%= SampleResource.Default %></a>
            </li>
            <li>
                <a class="dropdown-item" href="styles.aspx"><%= SampleResource.Styles %></a>
            </li>
            <li>
                <a class="dropdown-item" href="elements.aspx"><%= SampleResource.Elements %></a>
            </li>
            <li>
                <a class="dropdown-item" href="usercontrols.aspx"><%= SampleResource.Controls %></a>
            </li>
            <li>
                <a class="dropdown-item" href="database.aspx"><%= SampleResource.Database %></a>
            </li>
            <li>
                <a class="dropdown-item" href="api.aspx"><%= SampleResource.Api %></a>
            </li>
            <li>
                <a class="dropdown-item" href="help.aspx"><%= SampleResource.Help %></a>
            </li>
        </ul>
    </div>

    <ul class="menu-list">
        <li class="menu-item  none-sub-list<% if (CurrentPage == "default") { %> active<% } %>">
            <a class="menu-item-label outer-text text-overflow" href="default.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Default %></span>
            </a>
            <span id="feed-new-cases-count" class="feed-new-count"></span>
        </li>
        <li class="menu-item  none-sub-list<% if (CurrentPage == "styles") { %> active<% } %>">
            <a class="menu-item-label outer-text text-overflow" href="styles.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Styles %></span>
            </a>
            <span id="Span1" class="feed-new-count"></span>
        </li>
        <li class="menu-item  none-sub-list <% if (CurrentPage == "elements") { %> active <% } %>">
            <a class="menu-item-label outer-text text-overflow" href="elements.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Elements %></span>
            </a>
        </li>
        <li class="menu-item  none-sub-list <% if (CurrentPage == "usercontrols") { %> active <% } %>">
            <a class="menu-item-label outer-text text-overflow" href="usercontrols.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Controls %></span>
            </a>
        </li>
        <li class="menu-item  none-sub-list <% if (CurrentPage == "database") { %> active <% } %>">
            <a class="menu-item-label outer-text text-overflow" href="database.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Database %></span>
            </a>
        </li>
        <li class="menu-item  none-sub-list <% if (CurrentPage == "api") { %> active <% } %>">
            <a class="menu-item-label outer-text text-overflow" href="api.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Api %></span>
            </a>
        </li>
        <li class="menu-item  none-sub-list <% if (CurrentPage == "help") { %> active <% } %>">
            <a class="menu-item-label outer-text text-overflow" href="help.aspx">
                <span class="menu-item-icon sample"></span>
                <span class="menu-item-label inner-text"><%= SampleResource.Help %></span>
            </a>
        </li>
    </ul>

    <% if(!string.IsNullOrEmpty(ExceptionMessage)) { %>
    <div class="red-text"><%= ExceptionMessage %></div>
    <% } %>
</div>