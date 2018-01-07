using System;
using System.IO;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace FinalProject {
    public partial class Invoice : System.Web.UI.Page {
        protected decimal price;

        protected void Page_Load(object sender, EventArgs e) {
            price = Convert.ToDecimal(Session["AppointmentPrice"]);
        }

        protected void BtnExport_OnClick(object sender, EventArgs e) {
            Response.Redirect("InvoiceExport.aspx");
        }
    }
}