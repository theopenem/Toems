﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Toems_Common;
using Toems_Common.Dto;

namespace Toems_FrontEnd.views.assets.customassets
{
    public partial class search : BasePages.Assets
    {
        protected void ButtonConfirmDelete_Click(object sender, EventArgs e)
        {
            var action = (string)Session["action"];
            Session.Remove("action");
            var count = 0;
            switch (action)
            {
                case "delete":
                    foreach (GridViewRow row in gvAssets.Rows)
                    {
                        var cb = (CheckBox)row.FindControl("chkSelector");
                        if (cb == null || !cb.Checked) continue;
                        var dataKey = gvAssets.DataKeys[row.RowIndex];
                        if (dataKey == null) continue;
                        if (Call.AssetApi.Delete(Convert.ToInt32(dataKey.Value)).Success)
                            count++;
                    }
                    EndUserMessage = "Successfully Deleted " + count + " Asset(s)";
                    break;
                case "archive":
                    foreach (GridViewRow row in gvAssets.Rows)
                    {
                        var cb = (CheckBox)row.FindControl("chkSelector");
                        if (cb == null || !cb.Checked) continue;
                        var dataKey = gvAssets.DataKeys[row.RowIndex];
                        if (dataKey == null) continue;
                        if (Call.AssetApi.Archive(Convert.ToInt32(dataKey.Value)).Success)
                            count++;
                    }
                    EndUserMessage = "Successfully Archived " + count + " Asset(s)";
                    break;
            }
            PopulateGrid();

          

        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            ChkAll(gvAssets);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateAssetTypes(ddlAssetType);
                ddlAssetType.Items.Insert(0, new ListItem("", ""));
                ddlAssetType.Items.Insert(1, new ListItem("Any Asset Type", "Any Asset Type"));
                ddlAssetType.Items.Remove(ddlAssetType.Items.FindByText("Built-In Any"));
                ddlAssetType.Items.Remove(ddlAssetType.Items.FindByText("Built-In Computers"));
                ddlAssetType.SelectedIndex = 1;
                PopulateGrid();
                PopulateCategories();
            }
        }

        protected void ddl_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        private void PopulateCategories()
        {
            selectCategory.DataSource = Call.CategoryApi.Get().Select(x => x.Name).ToList();
            selectCategory.DataBind();
        }

        protected void PopulateGrid()
        {
            var filter = new DtoSearchFilterCategories();
            filter.Limit = 0;
            filter.SearchText = txtSearch.Text;
            filter.Categories = SelectedCategories();
            filter.AssetType = ddlAssetType.SelectedItem.Text;
            filter.CategoryType = ddlCatType.Text;
            gvAssets.DataSource = Call.AssetApi.Search(filter);
            gvAssets.DataBind();

            lblTotal.Text = gvAssets.Rows.Count + " Result(s) / " + Call.AssetApi.GetCount() +
                            " Asset(s)";
        }

        protected void search_Changed(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        protected void btnArchive_OnClick(object sender, EventArgs e)
        {
            lblTitle.Text = "Archive Selected Assets?";
            Session["action"] = "archive";
            DisplayConfirm();
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            lblTitle.Text = "Delete Selected Assets?";
            Session["action"] = "delete";
            DisplayConfirm();
        }

        protected void ddlCatType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCatType.Text != "Any Category")
            {
                selectCategory.Visible = true;
                CategorySubmit.Visible = true;
            }
            else
            {
                selectCategory.Visible = false;
                CategorySubmit.Visible = false;
            }

            PopulateGrid();
        }

        protected void CategorySubmit_OnClick(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        private List<string> SelectedCategories()
        {
            var list = new List<string>();
            foreach (ListItem a in selectCategory.Items)
            {

                if (a.Selected)
                    list.Add(a.Value);
            }

            return list;
        }

        protected void ddlAssetType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateGrid();
        }

     
    }
}