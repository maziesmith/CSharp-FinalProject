using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Appointments : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
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
        
        protected void GvAppointments_OnRowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName != "GenerateInvoice") return;

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = ((GridView) sender).Rows[index];

            var emailControl = row.Cells[4].FindControl("lblEmail") as Label;
            var dateControl = row.Cells[6].FindControl("lblDate") as Label;
            var serviceControl = row.Cells[7].FindControl("lblService") as Label;

            Session["AppointmentId"]      = row.Cells[2].Text;
            Session["AppointmentName"]    = row.Cells[3].Text;
            Session["AppointmentEmail"]   = emailControl.Text;
            Session["AppointmentPhone"]   = row.Cells[5].Text;
            Session["AppointmentDate"]    = DateTime.Parse(dateControl.Text);
            Session["AppointmentService"] = serviceControl.Text;
            Session["AppointmentPrice"]   = GetPrice(serviceControl.Text);
            Session["AppointmentComment"] = row.Cells[8].Text;

            Response.Redirect("Invoice.aspx");
        }

        private decimal GetPrice(string service) {
            decimal price = 0.0m;
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            try {
                using (SqlConnection connection = new SqlConnection(connectionString)) {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT Price FROM Services WHERE Name = @Name", connection);
                    command.Parameters.AddWithValue("@Name", service);

                    using (SqlDataReader reader = command.ExecuteReader()) {
                        while (reader.Read()) {
                            price = reader.GetDecimal(0);
                        }
                    }
                }
            } catch (SqlException ex) {
                string message = $"SQL Exception:\n{ex.Message}";
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", $"alert('{message}');", true);
            }

            return price;
        }
    }
}