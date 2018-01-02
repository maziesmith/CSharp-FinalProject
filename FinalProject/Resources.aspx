<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="FinalProject.Resources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Page Header -->
    <div class="container-fluid page-header indigo lighten-1" style="padding-top: 90px;">
        <h2 class="h2-responsive">Staff Management</h2>
    </div>
    
    <!-- Content -->
    <div class="container" style="padding-top: 15px;">
        <h1 class="h1-responsive">All staff</h1>
        <div class="row">
            <!-- Data Table -->
            <div class="col-sm-9">
                <p>Data Table: GridView</p>
                <asp:SqlDataSource ID="sdsResources" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Resources]"></asp:SqlDataSource>
                <asp:GridView ID="gvResources" CssClass="table table-responsive table-sm table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsResources">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    </Columns>
                </asp:GridView>
            </div>
            
            <!-- Buttons -->
            <div class="col-sm-3">
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn btn-primary btn-block">
                            <i class="fa fa-pencil mr-1"></i> Add new employee</button>
                    </div>
                    <div class="col-xs-12">
                        <button class="btn btn-primary btn-block">
                            <i class="fa fa-search mr-1"></i> Search
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
