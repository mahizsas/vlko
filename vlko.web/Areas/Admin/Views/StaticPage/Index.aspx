﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<vlko.core.Components.PagedModel<vlko.model.Action.ViewModel.StaticTextViewModel>>" %>
<%@ Import Namespace="vlko.web.Areas.Admin.Controllers" %>
<%@ Import Namespace="vlko.core.Components" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<% Html.ScriptInclude("~/Scripts/Grid.js"); %>
	<h2>Index</h2>

	<table>
		<thead>
			<th></th>
			<th>
				<%= vlko.model.ModelResources.Id  %>
			</th>
			<th>
				<%= vlko.model.ModelResources.FriendlyUrl%>
			</th>
			<th>
				<%= vlko.model.ModelResources.Title%>
			</th>
			<th>
				<%= vlko.model.ModelResources.ChangeDate%>
			</th>
			<th>
				<%= vlko.model.ModelResources.PublishDate%>
			</th>
			<th>
				<%= vlko.model.ModelResources.AllowComments%>
			</th>
			<th>
				<%= vlko.model.ModelResources.CommentCounts%>
			</th>
		</thead>

	<% foreach (var item in Model) { %>
	
		<tr>
			<td class="no_wrap">
				<%: Html.ActionLink<StaticPageController>(c => c.Edit(item.Id), "Edit", new { @class = "grid_edit", title = "Edit" })%>&nbsp;
				<%: Html.ActionLink<StaticPageController>(c => c.Details(item.Id), "Details", new { @class = "grid_details", title = "Details" })%>&nbsp;
				<%: Html.ActionLink<StaticPageController>(c => c.Delete(item.Id), "Delete", new { @class = "grid_delete", title = "Delete" })%> 
			</td>
			<td>
				<%: item.Id %>
			</td>
			<td>
				<%: item.FriendlyUrl %>
			</td>
			<td>
				<%: item.Title %>
			</td>
			<td>
				<%: String.Format("{0:g}", item.ChangeDate) %>
			</td>
			<td>
				<%: String.Format("{0:g}", item.PublishDate) %>
			</td>
			<td>
				<%: item.AllowComments %>
			</td>
			<td>
				<%: item.CommentCounts %>
			</td>
		</tr>
	<% } %>
	</table>
	<p><% Html.RenderPartial("~/Views/Shared/Pager.ascx", new PagerModel(Model, "Index")); %></p>
	<p>
		<%: Html.ActionLink<StaticPageController>(c => c.Create(), "Create new", new { @class = "grid_create", title = "Create new" })%> 
	</p>
<% Html.ScriptInlineInclude(() => {%>
<script type="text/javascript">
	$(function () {
		$("#content").ajaxGrid();
	});
</script> 
<% }); %>
</asp:Content>

