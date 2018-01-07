using System;
using System.IO;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace FinalProject {
    public partial class InvoiceExport : System.Web.UI.Page {
        protected decimal price;

        protected void Page_Load(object sender, EventArgs e) {
            price = Convert.ToDecimal(Session["AppointmentPrice"]);

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", $"attachment;filename=Invoice_{Session["AppointmentName"].ToString()}.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);

            Page.RenderControl(htmlWriter);

            StringReader reader = new StringReader(stringWriter.ToString());

            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(reader);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }
    }
}