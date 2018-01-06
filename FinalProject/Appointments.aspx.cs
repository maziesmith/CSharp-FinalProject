using System;
using System.Data;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Appointments : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            gvAppointments.HeaderRow.TableSection = TableRowSection.TableHeader;

            if (!IsPostBack)
                btnClear.Visible = false;
        }

        protected void BtnClear_OnServerClick(object sender, EventArgs e) {
            sdsAppointments.SelectParameters.Clear();
            sdsAppointments.SelectCommand = "SELECT * FROM Appointments";

            gvAppointments.DataBind();
        }

        protected void DdlSearch_Criteria_OnSelectedIndexChanged(object sender, EventArgs e) {
            switch (ddlSearch_Criteria.SelectedItem.Value) {
                case "Name":
                    lblSearch_Customer.Visible = true;
                    txtSearch_Customer.Visible = true;
                    txtSearch_Customer.Enabled = true;

                    ddlSearch_Date.Visible = false;
                    ddlSearch_Date.Enabled = false;
                    txtSearch_Date.Visible = false;
                    txtSearch_Date.Enabled = false;
                    break;
                case "Date":
                    lblSearch_Customer.Visible = false;
                    txtSearch_Customer.Visible = false;
                    txtSearch_Customer.Enabled = false;

                    ddlSearch_Date.Visible = true;
                    ddlSearch_Date.Enabled = true;
                    txtSearch_Date.Visible = true;
                    txtSearch_Date.Enabled = true;
                    break;
            }
        }

        protected void BtnSearch_OnClick(object sender, EventArgs e) {
            string query = "SELECT * FROM Appointments WHERE ";

            sdsAppointments.SelectParameters.Clear();
            switch (ddlSearch_Criteria.SelectedItem.Value) {
                case "Name":
                    if (string.IsNullOrWhiteSpace(txtSearch_Customer.Text))
                        sdsAppointments.SelectCommand = "SELECT * FROM Appointments";
                    else {
                        sdsAppointments.SelectCommand = query.Insert(query.Length, "Name LIKE @Name");
                        sdsAppointments.SelectParameters.Add("Name", DbType.String, txtSearch_Customer.Text + "%");
                    }

                    break;
                case "Date":
                    sdsAppointments.SelectCommand = query.Insert(query.Length, $"Date {ddlSearch_Date.SelectedItem.Value} @Date");
                    sdsAppointments.SelectParameters.Add("Date", DbType.DateTime, txtSearch_Date.Text);
                    break;
            }

            gvAppointments.DataBind();
        }

        //TODO: Send data for invoice generation
        protected void GvAppointments_OnRowCommand(object sender, GridViewCommandEventArgs e) {
            string command = e.CommandName;
            string commandArgument = e.CommandArgument.ToString();

            if (command == "GenerateInvoice") {
                //...
            }
        }
    }
}