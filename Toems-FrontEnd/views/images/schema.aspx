﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/images/images.master" AutoEventWireup="true" CodeBehind="schema.aspx.cs" Inherits="Toems_FrontEnd.views.images.schema" %>
<asp:Content runat="server" ContentPlaceHolderID="TopBreadCrumbSub1">
     <li>
        <a href="<%= ResolveUrl("~/views/images/general.aspx") %>?imageId=<%= ImageEntity.Id %>"><%= ImageEntity.Name %></a>
    </li>
    <li>Schema</li>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="SubNavTitle_Sub1">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="DropDownActionsSub" runat="Server">
   
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="SubContent" runat="Server">
  <script type="text/javascript">
        $(document).ready(function() {
            $('#schema').addClass("nav-current");

        });

    </script>

     <asp:GridView ID="gvHDs" runat="server" AutoGenerateColumns="false" CssClass="Gridview" AlternatingRowStyle-CssClass="alt">
        <Columns>

            <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="width_30" HeaderStyle-CssClass="">
                <ItemTemplate>
                    <div style="width: 0">
                        <asp:LinkButton ID="btnHd" runat="server" CausesValidation="false" CommandName="" Text="+" OnClick="btnHd_Click"></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="width_100"></asp:BoundField>
            <asp:BoundField DataField="Size" HeaderText="Size (Reported / Usable)" ItemStyle-CssClass="width_200"></asp:BoundField>
            <asp:BoundField DataField="Table" HeaderText="Table" ItemStyle-CssClass="width_100"></asp:BoundField>
            <asp:BoundField DataField="Boot" HeaderText="Boot Flag" ItemStyle-CssClass="width_100"></asp:BoundField>
            <asp:BoundField DataField="Lbs" HeaderText="LBS" ItemStyle-CssClass="width_100"></asp:BoundField>
            <asp:BoundField DataField="Pbs" HeaderText="PBS" ItemStyle-CssClass="width_100"></asp:BoundField>
            <asp:BoundField DataField="Guid" HeaderText="GUID" ItemStyle-CssClass="width_100"></asp:BoundField>

            <asp:TemplateField>
                <ItemTemplate>
                    <tr>
                        <td id="tdParts" runat="server" visible="false" colspan="900">
                            <asp:GridView ID="gvParts" AutoGenerateColumns="false" runat="server" CssClass="Gridview gv_parts" ShowHeader="true" Visible="false" AlternatingRowStyle-CssClass="alt">
                                <Columns>

                                    <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="width_30" HeaderStyle-CssClass="">
                                        <ItemTemplate>
                                            <div style="width: 20px">
                                                <asp:LinkButton ID="partClick" runat="server" CausesValidation="false" CommandName="" Text="+" OnClick="btnPart_Click"></asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Prefix" HeaderText="Pre" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="Number" HeaderText="#" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="Start" HeaderText="Start" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="End" HeaderText="End" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="Size" HeaderText="Size" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="VolumeSize" HeaderText="Volume" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="Type" HeaderText="Type" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="FsType" HeaderText="FS" ItemStyle-CssClass="width_100"></asp:BoundField>
                                    <asp:BoundField DataField="FsId" HeaderText="FSID" ItemStyle-CssClass="width_105"></asp:BoundField>
                                    <asp:BoundField DataField="UsedMb" HeaderText="Used" ItemStyle-CssClass="width_100"></asp:BoundField>

                                    <asp:TemplateField>
                                        <ItemTemplate>

                                            <tr>

                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>

                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="UUID" Font-Bold="true"/>
                                                    <asp:Label ID="lblUUID" runat="server" Text='<%# Bind("uuid") %>'/>

                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="GUID" Font-Bold="true"/>
                                                    <asp:Label ID="lblGUID" runat="server" Text='<%# Bind("guid") %>'/>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <tr>
                                                <td id="tdVG" runat="server" visible="false" colspan="900">
                                                    <h4>
                                                        <asp:Label ID="LVM" runat="server" Text="Volume Group" style="margin-left: 30px;"></asp:Label>
                                                    </h4>
                                                    <asp:GridView ID="gvVG" AutoGenerateColumns="false" runat="server" CssClass="Gridview gv_vg" ShowHeader="true" Visible="false" AlternatingRowStyle-CssClass="alt">
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="width_30" HeaderStyle-CssClass="">
                                                                <ItemTemplate>
                                                                    <div style="width: 20px">
                                                                        <asp:LinkButton ID="vgClick" runat="server" CausesValidation="false" CommandName="" Text="+" OnClick="btnVG_Click"></asp:LinkButton>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="width_100"/>
                                                            <asp:BoundField DataField="PhysicalVolume" HeaderText="PV" ItemStyle-CssClass="width_200"/>
                                                            <asp:BoundField DataField="Uuid" HeaderText="UUID" ItemStyle-CssClass="width_200"/>

                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td id="tdLVS" runat="server" visible="false" colspan="900">
                                                                            <asp:GridView ID="gvLVS" AutoGenerateColumns="false" runat="server" CssClass="Gridview gv_parts" ShowHeader="true" Visible="false" AlternatingRowStyle-CssClass="alt">
                                                                                <Columns>

                                                                                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-CssClass="width_100"></asp:BoundField>

                                                                                    <asp:BoundField DataField="Size" HeaderText="Size" ItemStyle-CssClass="width_100"></asp:BoundField>
                                                                                    <asp:BoundField DataField="VolumeSize" HeaderText="Volume" ItemStyle-CssClass="width_100"></asp:BoundField>

                                                                                    <asp:BoundField DataField="FsType" HeaderText="FS" ItemStyle-CssClass="width_100"></asp:BoundField>
                                                                                    <asp:BoundField DataField="Uuid" HeaderText="UUID" ItemStyle-CssClass="width_100"></asp:BoundField>

                                                                                    <asp:BoundField DataField="UsedMb" HeaderText="Used" ItemStyle-CssClass="width_100"></asp:BoundField>


                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>


                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <tr>
                                                <td id="tdFile" runat="server" visible="false" colspan="900">
                                                    <asp:GridView ID="gvFiles" AutoGenerateColumns="false" runat="server" CssClass="Gridview gv_parts" ShowHeader="true" Visible="false" AlternatingRowStyle-CssClass="alt">
                                                        <Columns>

                                                            <asp:BoundField DataField="FileName" HeaderText="File Name" ItemStyle-CssClass="width_100"/>
                                                            <asp:BoundField DataField="FileSize" HeaderText="Server Size" ItemStyle-CssClass="width_200"/>

                                                        </Columns>
                                                        <EmptyDataTemplate>No Image File Found</EmptyDataTemplate>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>


                        </td>


                    </tr>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EmptyDataTemplate>
            No Image Schema Found
        </EmptyDataTemplate>
    </asp:GridView>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="subHelp">
    <p>Specifies if the storage path is local to this server or on a remote SMB share.  The local type can only be used if only a single server is used for all Toec Api's, Toems Api's, and Toems Front Ends.</p>
<h5><span style="color: #ff9900;">Storage Path:</span></h5>
<p>The path to the storage directory.  If the storage type is local, the path should be a local drive, such as c:\toems-local-storage.  If the storage type is SMB, the path must be a UNC path, such as \\server\toems-remote-storage.</p>
<h5><span style="color: #ff9900;">Username:</span></h5>
<p>Only available for a storage type of SMB.  This is the username used to connect to the share.</p>
<h5><span style="color: #ff9900;">Password:</span></h5>
<p>Only available for a storage type of SMB.  This is the password used to connect to the share.</p>
<h5><span style="color: #ff9900;">Domain:</span></h5>
<p>Only available for a storage type of SMB.  This is the domain used to connect to the share.</p>
</asp:Content>
