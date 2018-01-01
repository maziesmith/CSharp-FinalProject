using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Home : Page {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        private int rowsAffected;
        protected string message;

        protected void Page_Load(object sender, EventArgs e) {
            if (IsPostBack) return;

            if (Session["RowsAffected"] == null)
                Session["RowsAffected"] = 0;
        }


        protected void BtnSubmit_OnClick(object sender, EventArgs e) {
            try {
                using (SqlConnection connection = new SqlConnection(connectionString)) {
                    connection.Open();
                    string query =
                        "INSERT INTO Appointments VALUES (NEXT VALUE FOR seq_appointments_id, @Name, @Email, @Phone, CONVERT(DATETIME, @Date), @Service, @Comment)";

                    DateTime appointmentDate = DateTime.Parse(txtDate.Text);
                    string date = appointmentDate.ToString("dd.MM.yyyy HH:mm");

                    SqlCommand insertCommand = new SqlCommand(query, connection);
                    insertCommand.Parameters.AddWithValue("@Name", txtName.Text);
                    insertCommand.Parameters.AddWithValue("@Email", txtEmail.Text);
                    insertCommand.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    insertCommand.Parameters.AddWithValue("@Date", date);
                    insertCommand.Parameters.AddWithValue("@Service", ddlService.SelectedItem.Text);
                    insertCommand.Parameters.AddWithValue("@Comment", txtComment.Text);

                    rowsAffected = insertCommand.ExecuteNonQuery();

                    Session["RowsAffected"] = rowsAffected;
                    message = (int)Session["RowsAffected"] > 0 ? "Your appointment has been submitted!" 
                        : "Something went wrong during your appointment submission. Try again a bit later.";

                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "showMessage();", true);
                }
            } catch (SqlException ex) {
                message = $"SQL Exception: {ex.Message}";
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "showMessage();", true);
            }
        }
    }
}