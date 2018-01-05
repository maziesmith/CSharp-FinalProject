﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="FinalProject.Appointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Page Header -->
    <div class="container-fluid page-header indigo lighten-1" style="padding-top: 90px;">
        <h2 class="h2-responsive" style="color: white;">Appointments</h2>
    </div>
    
    <!-- Content -->
    <div class="container" style="margin-top: 15px;">
        <!-- Search -->
        <div class="row">
            <div class="col-xs-12">
                <h3 class="h3-responsive">Search</h3>
                <div class="form-inline">
                    <div class="md-form form-group">
                        <asp:Label ID="lblSearch_Criteria" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlSearch_Criteria" runat="server" CssClass="mdb-select"
                                          OnSelectedIndexChanged="DdlSearch_Criteria_OnSelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Text="Customer Name" Value="Name"/>
                            <asp:ListItem Text="Appointment Date" Value="Date"/>
                        </asp:DropDownList>
                    </div>

                    <div id="search-customer" class="md-form form-group">
                        <!-- Search by customer name -->
                        <asp:Label ID="lblSearch_Customer" runat="server" Text="Customer name" 
                                   AssociatedControlID="txtSearch_Customer"></asp:Label>
                        <asp:TextBox ID="txtSearch_Customer" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                    <div id="search-date" class="md-form form-group">
                        <!-- Search by appointment date -->
                        <asp:DropDownList ID="ddlSearch_Date" runat="server" CssClass="mdb-select" Visible="False">
                            <asp:ListItem Text=">" Value=">"/>
                            <asp:ListItem Text="<" Value="<"/>
                            <asp:ListItem Text=">=" Value=">="/>
                            <asp:ListItem Text="<=" Value="<="/>
                            <asp:ListItem Text="=" Value="="/>
                            <asp:ListItem Text="!=" Value="!="/>
                            <asp:ListItem Text="!<" Value="!<"/>
                            <asp:ListItem Text="!>" Value="!>"/>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtSearch_Date" CssClass="form-control" runat="server" TextMode="DateTimeLocal" Visible="False" Enabled="False"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" 
                    OnClientClick="return validate();" OnClick="BtnSearch_OnClick"/>
            </div>
        </div>
        <div class="row">
            <!-- Data Table -->
            <div class="col-xs-12">
                <button id="btnClear" class="btn btn-flat" type="button" runat="server" OnServerClick="BtnClear_OnServerClick">
                    <i class="fa fa-close fa-lg mr-1"></i> Clear search conditions
                </button>
            </div>
            <div class="col-xs-12">
                <div class="container-max">
                    <asp:GridView ID="gvAppointments" CssClass="table table-responsive table-hover" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsAppointments" 
                    GridLines="None" AllowSorting="True" RowStyle-Wrap="False" EmptyDataText="No appointments found.">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                                <ControlStyle CssClass="btn btn-flat"></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:TemplateField HeaderText="E-mail" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone Number" SortExpression="Phone" />
                            <asp:TemplateField HeaderText="Date/Time" SortExpression="Date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditDate" TextMode="DateTimeLocal" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date", "{0:dd.MM.yyyy HH:mm}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Service" SortExpression="Service">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditService" CssClass="mdb-select" runat="server" Text='<%# Bind("Service") %>'>
                                        <asp:ListItem>List</asp:ListItem>
                                        <asp:ListItem>of</asp:ListItem>
                                        <asp:ListItem>services</asp:ListItem>
                                        <asp:ListItem>needed</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Service") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Comment" HeaderText="Comments" SortExpression="Comment"/>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="sdsAppointments" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Appointments]"
                                    DeleteCommand="DELETE FROM [Appointments] WHERE [Id] = @Id"
                                    UpdateCommand="UPDATE [Appointments] SET [Name] = @Name,
                                                                            [Email] = @Email,
                                                                            [Phone] = @Phone,
                                                                            [Date] = @Date,
                                                                            [Service] = @Service,
                                                                            [Comment] = @Comment
                                                                        WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32"/>
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"/>
                        <asp:Parameter Name="Email" Type="String"/>
                        <asp:Parameter Name="Phone" Type="String"/>
                        <asp:Parameter Name="Date" Type="DateTime"/>
                        <asp:Parameter Name="Service" Type="String"/>
                        <asp:Parameter Name="Comment" Type="String"/>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        function validate() {
            var select = document.getElementById('<%= ddlSearch_Criteria.ClientID %>');
            var option = select.options[select.selectedIndex].value;

            if (option === "NameDate")
                return validateDate();
            else
                return true;
        }

        function validateDate() {
            var value = document.getElementById('<%= txtSearch_Date.ClientID %>').value;

            if (value === "") {
                return false;
            }
            else
                return true;
        }
    </script>
</asp:Content>






























































































































































































































































