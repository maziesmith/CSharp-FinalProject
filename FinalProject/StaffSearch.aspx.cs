using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class StaffSearch : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void DdlSearch_Criteria_OnSelectedIndexChanged(object sender, EventArgs e) {
            switch (ddlSearch_Criteria.SelectedItem.Value) {
                case "Name":
                    lblSearch_Name.Visible = true;
                    txtSearch_Name.Visible = true;
                    txtSearch_Name.Enabled = true;

                    lblSearch_Position.Visible = false;
                    txtSearch_Position.Visible = false;
                    txtSearch_Position.Enabled = false;
                    break;
                case "Position":
                    lblSearch_Name.Visible = false;
                    txtSearch_Name.Visible = false;
                    txtSearch_Name.Enabled = false;

                    lblSearch_Position.Visible = true;
                    txtSearch_Position.Visible = true;
                    txtSearch_Position.Enabled = true;
                    break;
            }
        }

        protected void BtnSearch_OnClick(object sender, EventArgs e) {
            string query = "SELECT * FROM Staff WHERE ";

            sdsStaffSearch.SelectParameters.Clear();
            switch (ddlSearch_Criteria.SelectedItem.Value) {
                case "Name":
                    if (string.IsNullOrWhiteSpace(txtSearch_Name.Text))
                        sdsStaffSearch.SelectCommand = "SELECT * FROM Staff";
                    else {
                        sdsStaffSearch.SelectCommand = query.Insert(query.Length, "Name LIKE @Name");
                        sdsStaffSearch.SelectParameters.Add("Name", DbType.String, txtSearch_Name.Text + "%");
                    }

                    break;
                case "Position":
                    if (string.IsNullOrWhiteSpace(txtSearch_Position.Text))
                        sdsStaffSearch.SelectCommand = "SELECT * FROM Staff";
                    else {
                        sdsStaffSearch.SelectCommand = query.Insert(query.Length, "Position LIKE @Position");
                        sdsStaffSearch.SelectParameters.Add("Position", DbType.String, txtSearch_Position.Text + "%");
                    }

                    break;
            }

            gvStaffSearch.DataBind();
        }
    }
}