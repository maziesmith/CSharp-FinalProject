<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffSearch.aspx.cs" Inherits="FinalProject.StaffSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Page Header -->
    <div class="container-fluid page-header indigo lighten-1" style="padding-top: 90px;">
        <h2 class="h2-responsive" style="color: white;">Staff Search</h2>
    </div>
    
    <!-- Content -->
    <div class="container" style="margin-top: 15px;">
        <div class="row">
            <div class="col-xs-12">
                <div class="form-inline">
                    <h3 class="h3-responsive">Search</h3>
                    <div class="form-inline">
                        <div class="md-form form-group">
                            <asp:Label ID="lblSearch_Criteria" runat="server"></asp:Label>
                            <asp:DropDownList ID="ddlSearch_Criteria" runat="server" CssClass="mdb-select"
                                              OnSelectedIndexChanged="DdlSearch_Criteria_OnSelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="Employee Name" Value="Name"/>
                                <asp:ListItem Text="Employee Position" Value="Position"/>
                            </asp:DropDownList>
                        </div>
                        
                        <!-- Search by name -->
                        <div id="search-name" class="md-form form-group">
                            <asp:Label ID="lblSearch_Name" runat="server" Text="Employee name" 
                                       AssociatedControlID="txtSearch_Name"></asp:Label>
                            <asp:TextBox ID="txtSearch_Name" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        
                        <!-- Search by position -->
                        <div id="search-position" class="md-form form-group">
                            <asp:Label ID="lblSearch_Position" runat="server" Text="Employee position" 
                                       AssociatedControlID="txtSearch_Position" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtSearch_Position" CssClass="form-control" runat="server" Visible="False" Enabled="False"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search"
                    OnClick="BtnSearch_OnClick"/>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="container-max">
                    <asp:GridView ID="gvStaffSearch" runat="server" CssClass="table table-responsive"
                                  RowStyle-Wrap="False" GridLines="None" EmptyDataText="No staff employees found." 
                                  AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsStaffSearch">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsStaffSearch" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
