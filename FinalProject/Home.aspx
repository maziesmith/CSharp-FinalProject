<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Title page. Use data-jarallax-video="your_url_here" to add a video background if needed-->
    <div class="view intro hm-white-light jarallax" data-jarallax='{"speed": 0.1}'
        style="background-image: url(https://mdbootstrap.com/img/Photos/Others/img%20%2844%29.jpg); height: 100% !important;">
        <div class="full-bg-img">
            <!-- Foreground content -->
            <div class="container-fluid flex-center">
                <!-- Splash screen -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-center">
                            <h1 class="display-2 animated fadeInDown">APP NAME HERE</h1>
                            <h5 class="font-up font-bold animated fadeInDown">Some kind of brief description here.</h5>
                            
                            <a href="#" class="btn btn-indigo btn-lg animated fadeInDown"
                               data-toggle="modal" data-target="#appointment-form">Book an appointment</a>
                            <h5 class="font-up font-bold animated fadeInDown" style="margin-top: 30px; margin-bottom: 15px;">Or keep reading</h5>
                            <h5 class="animated fadeInDown infinite"><i class="fa fa-angle-down fa-2x"></i></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Appointment booking pop-up form -->
    <div id="appointment-form" class="modal fade" role="dialog">
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
                                <asp:Label ID="lblName" runat="server" Text="Name" AssociatedControlID="txtName"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-envelope prefix"></i>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:Label ID="lblEmail" runat="server" Text="E-mail (optional)" AssociatedControlID="txtEmail"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-phone prefix"></i>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                <asp:Label ID="lblPhone" runat="server" Text="Phone Number" AssociatedControlID="txtPhone"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-calendar prefix"></i>
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-center">
                    <button type="submit" runat="server" class="btn btn-primary">
                        <i class="fa fa-send mr-1"></i> Submit
                    </button>
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times mr-1"></i> Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Services -->
    <div class="container">
        <!-- A section for a service provided by the store. -->
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <!-- Placeholder image. Find an appropriate one later. -->
                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/img%20%2844%29.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Service Description</h1>
                <p>Some brief description about the service here. Several of these can be added.</p>
            </div>
        </div>
    </div>
</asp:Content>
