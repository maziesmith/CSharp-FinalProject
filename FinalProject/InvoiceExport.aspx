<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceExport.aspx.cs" Inherits="FinalProject.InvoiceExport" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Invoice for <%= Session["AppointmentName"].ToString() %></h1>
    <h5>Date: <%= ((DateTime)Session["AppointmentDate"]).ToString("MMMM dd, yyyy", new CultureInfo("en-CA")) %></h5>

    <br/>
    
    <table cellspacing="-1" cellpadding="10">
        <tbody>
            <tr>
                <th style="text-align: center; border: 1px solid black;">Customer Information</th>
                <th style="text-align: center; border: 1px solid black;">Services</th>
            </tr>
            <tr>
                <td style="border: 1px solid black;">
                    <b>E-mail:</b> <span><%= Session["AppointmentEmail"].ToString() %></span><br/>
                    <b>Phone Number:</b> <span><%= Session["AppointmentPhone"].ToString() %></span>
                </td>
                <td style="border: 1px solid black;">
                    <b>Chosen service:</b> <span><%= Session["AppointmentService"].ToString() %></span>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: 1px solid black;">
                    <b>Comments:</b><br/>
                    <% if (Session["AppointmentComment"].ToString() == "&nbsp;") { %>
                        <span>No specific comments were provided.</span>
                    <% } else { %>
                        <span><%= Session["AppointmentComment"].ToString() %></span>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: 1px solid black;">
                    <b>Payment:</b><br/>
                    <div style="text-align: right;">
                        <b>Subtotal:</b> <span><%= Math.Round(price, 2) %> CAD</span><br/>
                        <b>HST/GST:</b> <span><%= Math.Round(price * 0.13m, 2) %> CAD</span><br/>
                        <b>Total:</b> <span><%= Math.Round(price + price * 0.13m, 2) %> CAD</span><br/>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
