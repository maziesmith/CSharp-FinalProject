using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject {
    public partial class Staff : System.Web.UI.Page {
        private readonly string connectionString = 
            ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

        private int rowsAffected;
        protected string message;

        protected void Page_Load(object sender, EventArgs e) {
            if (IsPostBack) return;

            if (ViewState["RowsAffected"] == null)
                ViewState["RowsAffected"] = 0;
        }

        protected void BtnSubmit_OnClick(object sender, EventArgs e) {
            try {
                using (SqlConnection connection = new SqlConnection(connectionString)) {
                    connection.Open();
                    string query = "INSERT INTO Staff VALUES (NEXT VALUE FOR seq_staff_id, @Name, @Position)";

                    SqlCommand insertCommand = new SqlCommand(query, connection);
                    insertCommand.Parameters.AddWithValue("@Name", txtName.Text);
                    insertCommand.Parameters.AddWithValue("@Position", txtPosition.Text);

                    rowsAffected = insertCommand.ExecuteNonQuery();

                    message = (int)ViewState["RowsAffected"] > 0 ? "Employee successfully added!"
                        : "Something went wrong during employee information submission. Try again a bit later.";

                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "showMessage();", true);
                }
            } catch (SqlException ex) {
                message = $"SQL Exception: {ex.Message}";
                ScriptManager.RegisterStartupScript(this, GetType(), "Message", "showMessage();", true);
            } finally {
                gvStaff.DataBind();
                Response.Redirect("Staff.aspx", false);
            }
        }
    }
}