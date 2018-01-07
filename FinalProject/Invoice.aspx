<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="FinalProject.Invoice" EnableEventValidation="False" %>
<%@ Import Namespace="System.Globalization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Page Header -->
    <div class="container-fluid page-header indigo lighten-1" style="padding-top: 90px;">
        <h2 class="h2-responsive" style="color: white;">Invoice</h2>
    </div>
    
    <!-- Invoice -->
    <div class="container" style="margin-top: 15px;">
        <!-- Header -->
        <div class="row">
            <div class="col-12">
                <h1 class="h1-responsive">Invoice for <%= Session["AppointmentName"].ToString() %></h1>
                <h5 class="h5-responsive">Date: <%= ((DateTime)Session["AppointmentDate"]).ToString("MMMM dd, yyyy", new CultureInfo("en-CA")) %></h5>
            </div>
        </div>
        
        <!-- Information -->
        <div class="row">
            <!-- Customer -->
            <div class="col-sm-6">
                <div class="card full-height">
                    <div class="card-header indigo darken-1 white-text">
                        Customer Information
                    </div>

                    <div class="card-body">
                        <b>E-mail:</b> <span><%= Session["AppointmentEmail"].ToString() %></span><br/>
                        <b>Phone Number:</b> <span><%= Session["AppointmentPhone"].ToString() %></span>
                    </div>
                </div>
            </div>
            
            <!-- Service -->
            <div class="col-sm-6">
                <div class="card full-height">
                    <div class="card-header indigo darken-1 white-text">
                        Services
                    </div>

                    <div class="card-body">
                        <h4 class="card-title">Chosen service:</h4>
                        <p class="card-text"><%= Session["AppointmentService"].ToString() %></p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Comment -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header indigo darken-1 white-text">
                        Comments
                    </div>
                    
                    <div class="card-body">
                        <% if (Session["AppointmentComment"].ToString() == "&nbsp;") { %>
                               <h4 class="card-title">No specific comments were provided.</h4>
                        <% } else { %>
                               <p class="card-text"><%= Session["AppointmentComment"].ToString() %></p>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Payment -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header indigo darken-1 white-text">
                        Payment
                    </div>

                    <div class="card-body text-right">
                        <b>Subtotal:</b> <span><%= Math.Round(price, 2) %> CAD</span><br/>
                        <b>HST/GST:</b> <span><%= Math.Round(price * 0.13m, 2) %> CAD</span><br/>
                        <b>Total:</b> <span><%= Math.Round(price + price * 0.13m, 2) %> CAD</span><br/>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Export button -->
        <div class="row">
            <div class="col-12 flex-center">
                <asp:Button ID="btnExport" runat="server" Text="Export to PDF" CssClass="btn btn-primary btn-lg" 
                    OnClick="BtnExport_OnClick"/>
            </div>
        </div>
    </div>
</asp:Content>
