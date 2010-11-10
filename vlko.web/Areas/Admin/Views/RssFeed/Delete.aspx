﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<vlko.model.Action.CRUDModel.RssFeedCRUDModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

	<div>
		<%: Html.ValidationSummary(excludePropertyErrors: true, cssClass: "ui-state-error ui-corner-all")%>

    	<h3>Are you sure you want to delete this?</h3>
		<fieldset>
			<legend>Fields</legend>
        
			<%: Html.DisplayFor(model => model.Id) %>
			<%: Html.DisplayFor(model => model.Name) %>
			<%: Html.DisplayFor(model => model.Url) %>
			<%: Html.DisplayFor(model => model.AuthorRegex) %>
			<%: Html.DisplayFor(model => model.GetDirectContent) %>
			<%: Html.DisplayFor(model => model.DisplayFullContent) %>
			<%: Html.DisplayFor(model => model.ContentParseRegex) %>

    	</fieldset>
	</div>
	<% using (Html.BeginForm()) { %>
	<div class="ajax_ignore">
        	<%: Html.HiddenFor(model => Model.Id) %> |
		
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
	</div>
	<% } %>

</asp:Content>

