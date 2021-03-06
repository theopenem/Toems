﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/computers/computers.master" AutoEventWireup="true" CodeBehind="updates.aspx.cs" Inherits="Toems_FrontEnd.views.computers.updates" EnableEventValidation="false" %>
<asp:Content runat="server" ContentPlaceHolderID="TopBreadCrumbSub1">
    <li> <%= ComputerEntity.Name %></li>
    <li>Windows Updates</li>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SubNavTitle_Sub1">
    <%= ComputerEntity.Name %>
</asp:Content>

<asp:Content ID="Breadcrumb" ContentPlaceHolderID="DropDownActionsSub" Runat="Server">
  <li><asp:LinkButton ID="btnExport" runat="server" OnClick="btnExport_OnClick" Text="Export To CSV" CssClass="main-action" /></li>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="SubContent" Runat="Server">
      <script type="text/javascript">
          $(document).ready(function () {
              $('#updates').addClass("nav-current");

              $("[id*=gvUpdates] td").hover(function () {
                  $("td", $(this).closest("tr")).addClass("hover_row");
              }, function () {
                  $("td", $(this).closest("tr")).removeClass("hover_row");
              });
          });

    </script>
    
   

    <p class="total">
        <asp:Label ID="lblTotal" runat="server"></asp:Label>
    </p>
    <div class="size-7 column">

        <asp:TextBox ID="txtSearch" runat="server" CssClass="rounded-search" OnTextChanged="txtSearch_OnTextChanged"></asp:TextBox>
    </div>

    <br class="clear"/>

    <asp:GridView ID="gvUpdates" runat="server" AllowSorting="True" OnSorting="gvSoftware_OnSorting" AutoGenerateColumns="False" CssClass="Gridview" AlternatingRowStyle-CssClass="alt">
        <Columns>
            <asp:BoundField DataField="IsInstalled" HeaderText="Installed" SortExpression="IsInstalled" ItemStyle-CssClass="width_200" ></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Name" SortExpression="Title" ItemStyle-CssClass="width_200"></asp:BoundField>
             <asp:BoundField DataField="InstallDate" HeaderText="Install Date" SortExpression="InstallDate" ItemStyle-CssClass="width_200"></asp:BoundField>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ItemStyle-CssClass="width_200"></asp:BoundField>
            <asp:BoundField DataField="UpdateId" HeaderText="Update Id" SortExpression="Category" ></asp:BoundField>
          
           
        </Columns>
        <EmptyDataTemplate>
            No Windows Updates Found
        </EmptyDataTemplate>
    </asp:GridView>
      
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="subHelp">
    <p>This page displays all Windows updates that have been available for this computer.  It will also display if the update has been installed and when.</p>
</asp:Content>
