﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/impersonation/impersonation.master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Toems_FrontEnd.views.admin.impersonation.search" %>
<asp:Content runat="server" ContentPlaceHolderID="TopBreadCrumbSub2">
    <li>Search</li>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SubNavTitle_Sub2">
    Impersonation Accounts
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="DropDownActionsSub2" Runat="Server">
    <li><asp:LinkButton runat="server" ID="btnDelete" Text="Delete Selected" OnClick="btnDelete_OnClick"></asp:LinkButton></li>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="SubContent2" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function() {
            $('#search').addClass("nav-current");
            $("[id*=gvAccounts] td").hover(function() {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function() {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>
    <p class="total">
        <asp:Label ID="lblTotal" runat="server"></asp:Label>
    </p>
    <div class="size-7 column">
        <asp:TextBox ID="txtSearch" runat="server" CssClass="rounded-search" OnTextChanged="search_Changed"></asp:TextBox>
    </div>
    <br class="clear"/>

    <asp:GridView ID="gvAccounts" runat="server"  DataKeyNames="Id"  AutoGenerateColumns="False" CssClass="Gridview" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle CssClass="chkboxwidth"></HeaderStyle>
                <ItemStyle CssClass="chkboxwidth"></ItemStyle>
                <HeaderTemplate>
                    <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged"/>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelector" runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/views/admin/impersonation/edit.aspx?level=2&impersonationId={0}" Text="View" ItemStyle-CssClass="chkboxwidth"/>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False"/>
            <asp:BoundField DataField="Username" HeaderText="User Name"></asp:BoundField>
         

        </Columns>
        <EmptyDataTemplate>
            No Impersonation Accounts Found
        </EmptyDataTemplate>
    </asp:GridView>

    <div id="confirmbox" class="confirm-box-outer">
        <div class="confirm-box-inner">
            <h4>
                <asp:Label ID="lblTitle" runat="server" Text="Delete The Selected Accounts?"></asp:Label>
            </h4>
            <div class="confirm-box-btns">
                <asp:LinkButton ID="ConfirmButton" OnClick="ButtonConfirmDelete_Click" runat="server" Text="Yes" CssClass="confirm_yes"/>
                <asp:LinkButton ID="CancelButton" runat="server" Text="No" CssClass="confirm_no"/>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="subsubHelp">
    <p>The search page allows you to view and delete existing impersonation accounts. Filtering options include:</p>
<ul>
	<li><strong>Search by username</strong></li>
</ul>
</asp:Content>