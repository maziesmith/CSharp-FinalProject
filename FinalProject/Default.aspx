<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Title page. Use data-jarallax-video="your_url_here" to add a video background if needed-->
    <div class="view intro hm-white-light jarallax" data-jarallax='{"speed": 0.1}'
        style="background-image: url('https://www.sunrita.ru/uploads/images/2fons.ru-58691_(1).jpg'); height: 100% !important;">
        <div class="full-bg-img">
            <!-- Foreground content -->
            <div class="container-fluid flex-center">
                <!-- Splash screen -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-center">
                            <h1 class="display-2 animated fadeInDown text-uppercase">Cosmetology Spa & Beauty</h1>
                            
                            <a href="#" class="btn btn-indigo btn-lg animated fadeInDown"
                               data-toggle="modal" data-target="#appointment-form">Book an appointment</a>
                            <h5 class="font-up font-bold animated fadeInDown" style="margin-top: 30px; margin-bottom: 15px;">Learn more</h5>
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
                                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">
                                    Name <span class="mandatory">*</span>
                                </asp:Label>
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
                                <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone">
                                    Phone Number <span class="mandatory">*</span>
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-calendar prefix"></i>
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-magic prefix"></i>
                                <asp:DropDownList ID="ddlService" runat="server" CssClass="mdb-select" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                                <asp:Label ID="lblService" runat="server" AssociatedControlID="ddlService">
                                    Service <span class="mandatory">*</span>
                                </asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="md-form">
                                <i class="fa fa-comment prefix"></i>
                                <asp:TextBox ID="txtComment" runat="server" CssClass="form-control md-textarea comment-area" TextMode="MultiLine"></asp:TextBox>
                                <asp:Label ID="lblComment" runat="server" Text="Comments (optional)" AssociatedControlID="txtComment"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-center">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"
                        OnClientClick="return validate();" OnClick="BtnSubmit_OnClick"/>
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" aria-label="Close">
                        Cancel</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Message about appointment -->
    <div id="appointment-modal" class="modal fade" role="dialog" data-backdrop="false">
        <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
            <div class="modal-content">
                <div class="row d-flex justify-content-center align-items-center">
                    <p id="message" class="pt-3 pr-2" style="color: #616161;"></p>
                    <a href="#" type="button" class="btn btn-primary-modal waves-effect waves-light" data-dismiss="modal">OK</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Services -->
    <div class="container">
        <br/>
        <div class="row">
            <div class="col-12">
                <h1 class="display-2 text-center text-uppercase">Services</h1>
            </div>
        </div>
        <!-- A section for a service provided by the store. -->
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <img class="img-fluid" src="https://i.pinimg.com/474x/52/94/49/529449217029ab31f244361abb121464--homemade-facial-mask-homemade-facials.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Facial</h1>
                <p>We offer facial and body treatments, like a Vitamin C Antioxidant Facial and Pevonia’s Anti- free Radical Treatment.</p>
            </div>
        </div>
        
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <img class="img-fluid" src="https://ak2.picdn.net/shutterstock/videos/3984382/thumb/1.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Manicure</h1>
                <p>Our store provides different types of manicures like Diamond and Gold Manicures, Pine Mud Manicure, Luxe Manicure etc.</p>
            </div>
        </div>
        
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <img class="img-fluid" src="https://ak4.picdn.net/shutterstock/videos/1782014/thumb/1.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Massage</h1>
                <p>
                    We offer massage in variety of styles: 
                    <ul>
                        <li>Traditional Swedish Massage</li>
                        <li>Deep Tissue work</li>
                        <li>Hot Stone Massage</li>
                        <li>Reflexology</li>
                        <li>Sports</li>
                        <li>Pregnancy and others</li>
                    </ul>
                </p>
            </div>
        </div>
        
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <img class="img-fluid" src="https://i.pinimg.com/564x/1b/a3/7e/1ba37ec37d466503db63d105528c94bc--nail-spa-spas.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Pedicure</h1>
                <p>The various types of pedicure provided are Kneipp’s Arnica, Calendula Foot and Leg Reflexology Treatment.</p>
            </div>
        </div>
        
        <div class="row service">
            <div class="col-md-6 service-thumbnail">
                <img class="img-fluid" src="https://s3-media1.fl.yelpcdn.com/bphoto/hPEWjxjyttY70RJKXVcL4g/l.jpg"/>
            </div>
            <div class="col-sm-12 col-md-6">
                <h1 class="service-title">Spray Tan</h1>
                <p>We provide organic airbrush tanning varying from full body to face, neck, arms and legs.</p>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        function validate() {
            if (!(validateName() && validatePhone() && validateDate() && validateService()))
                return false;

            return true;
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

        function validatePhone() {
            var value = document.getElementById('<%= txtPhone.ClientID %>').value;
            if (value == null || value === "") {
                document.getElementById('<%= lblPhone.ClientID %>').style.color = 'red';
                return false;
            } else if (isNaN(value)) {
                document.getElementById('<%= lblPhone.ClientID %>').style.color = 'red';
                return false;
            } else if (value.length > 10) {
                document.getElementById('<%= lblPhone.ClientID %>').style.color = 'red';
                return false;
            }

            document.getElementById('<%= lblPhone.ClientID %>').style.color = '#616161';
            return true;
        }

        function validateDate() {
            var value = document.getElementById('<%= txtDate.ClientID %>').value;
            if (value == null || value === "") {
                document.getElementById('<%= txtDate.ClientID %>').style.color = 'red';
                return false;
            }

            document.getElementById('<%= txtDate.ClientID %>').style.color = '#616161';
            return true;
        }

        function validateService() {
            var value = document.getElementById('<%= ddlService.ClientID %>').value;
            if (value === "Select Service...") {
                document.getElementById('<%= lblService.ClientID %>').style.color = 'red';
                return false;
            }

            document.getElementById('<%= lblService.ClientID %>').style.color = '#616161';
            return true;
        }

        function showMessage() {
            $('#appointment-modal #message').text("<%= message %>");
            $('#appointment-modal').modal('show');
        }
    </script>
</asp:Content>
