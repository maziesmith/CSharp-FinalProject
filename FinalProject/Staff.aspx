<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="FinalProject.Staff" %>
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
                <div class="container-max">
                    <asp:GridView ID="gvStaff" runat="server" AllowSorting="True" DataSourceID="sdsStaff"
                        RowStyle-Wrap="False" CssClass="table table-responsive table-hover"
                        GridLines="None" EmptyDataText="No staff employees found.">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                                <ControlStyle CssClass="btn btn-flat"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsStaff" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" 
                        SelectCommand="SELECT * FROM [Staff]"
                        DeleteCommand="DELETE FROM [Staff] WHERE [Id] = @Id"
                        UpdateCommand="UPDATE [Staff] SET [Name] = @Name, [Position] = @Position WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32"/>
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String"/>
                            <asp:Parameter Name="Position" Type="String"/>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
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
