<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="FinalProject.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Page Header -->
    <div class="container-fluid page-header indigo lighten-1" style="padding-top: 90px;">
        <h2 class="h2-responsive" style="color: white;">Staff Management</h2>
    </div>
    
    <!-- New employee form -->
    <div id="new-employee-form" class="modal fade" role="dialog">
        <div class="modal-dialog cascading-modal modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header indigo">
                    <i class="fa fa-pencil fa-lg ml-auto text-white mr-2"></i>
                    <span class="font-up font-bold heading mr-auto text-white">New Appointment</span>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-address-card prefix"></i>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">
                                    Name
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-sort-amount-desc prefix"></i>
                                <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblPosition" runat="server" Text="Position" AssociatedControlID="txtPosition"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <p>All fields are mandatory</p>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"
                        OnClientClick="return validate();" OnClick="BtnSubmit_OnClick"/>
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" aria-label="Close">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Message about SQL manipulations in Staff table-->
    <div id="new-employee-modal" class="modal fade" role="dialog" data-backdrop="false">
        <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
            <div class="modal-content">
                <div class="row d-flex justify-content-center align-items-center">
                    <p id="message" class="pt-3 pr-2" style="color: #616161;"></p>
                    <a href="#" type="button" class="btn btn-primary-modal waves-effect waves-light" data-dismiss="modal">OK</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Content -->
    <div class="container" style="padding-top: 15px;">
        <h1 class="h1-responsive">All staff</h1>
        <div class="row">
            <!-- Data Table -->
            <div class="col-sm-9">
                <div class="container-max">
                    <asp:GridView ID="gvStaff" runat="server" AllowSorting="True" DataSourceID="sdsStaff"
                        RowStyle-Wrap="False" CssClass="table table-responsive table-sm"
                        GridLines="None" EmptyDataText="No staff employees found.">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                                <ControlStyle CssClass="btn btn-flat btn-sm squeeze"></ControlStyle>
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
                    <div class="col-12">
                        <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#new-employee-form">
                            <i class="fa fa-pencil mr-1"></i> Add new employee
                        </button>
                    </div>
                    <div class="col-12">
                        <a href="StaffSearch.aspx" class="btn btn-primary btn-block">
                            <i class="fa fa-search mr-1"></i> Search
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        function validate() {
            return validateName() && validatePosition();
        }

        function validateName() {
            var value = document.getElementById('<%= txtName.ClientID %>').value;

            if (value == null || value === "") {
                document.getElementById('<%= lblName.ClientID %>').style.color = 'red';
                return false;
            }

            document.getElementById('<%= lblName.ClientID %>').style.color = '#616161';
            return true;
        }

        function validatePosition() {
            var value = document.getElementById('<%= txtPosition.ClientID %>').value;

            if (value == null || value === "") {
                document.getElementById('<%= lblPosition.ClientID %>').style.color = 'red';
                return false;
            }

            document.getElementById('<%= lblPosition.ClientID %>').style.color = '#616161';
            return true;
        }

        function showMessage() {
            $('#new-employee-modal #message').text("<%= message %>");
            $('#new-employee-modal').modal('show');
        }
    </script>
</asp:Content>
