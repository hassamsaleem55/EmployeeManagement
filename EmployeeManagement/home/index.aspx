<%@ Page Title="Home - Work Permit" Language="C#" MasterPageFile="~/homeMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EmployeeManagement.home.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- START SITE PRELOADER -->
    <div id="preloader-container">
        <div class="preloader">
            <span class="bubble-01"></span>
            <span class="bubble-02"></span>
            <span class="bubble-03"></span>
        </div>
    </div>
    <!-- END SITE PRELOADER -->
    <!-- HEADER AREA START HERE -->
    <header class="header-area" id="#home">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-sm-9">
                        <ul class="welcom-top">
                            <li>
                                <a href="mailto:info@espark.com"><i class="fa fa-envelope"></i>geral@workpermit.pt</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-phone"></i>Tel: +351 917 773 737</a>
                            </li>
                            <li><i class="fa fa-clock-o"></i>Monday to Friday: 9am to 12:30pm and 2pm to 6:30pm</li>
                        </ul>
                    </div>
                    <!-- HEADER TOP SOCIAL -->
                    <div class="col-md-3 col-sm-3">
                        <div class="header-social pull-right">
                            <ul>
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- HEADER TOP END HERE -->
        <!-- MENU AREA START HERE -->
        <div class="main-menu-area">
            <div class="container">
                <div class="row">
                    <!-- FOR LOGO -->
                    <div class="col-md-3 col-sm-3">
                        <div class="logo">
                            <a href="#">
                                <img src="images/3dlogo_2mb.gif" alt="" style="width: 15%" />
                                <img src="images/work_permit_3.png" style="height: 50%" />
                                <%-- <img src="images/work_permit_high_res.png" style="height: 50%" />--%>
                            </a>
                        </div>
                    </div>
                    <!-- MAIN MENU START -->
                    <div class="col-md-9 col-sm-9">
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="smooth-menu">
                                        <a href="index.aspx">home</a>

                                    </li>
                                    <li class="smooth-menu">
                                        <a href="#about">about</a>
                                    </li>
                                    <li class="smooth-menu">
                                        <a href="#contact_us">contact</a>
                                    </li>
                                    <li class="smooth-menu">
                                        <a href="jobs.aspx">Jobs</a>
                                    </li>
                                    <li class="smooth-menu">
                                        <a href="../login.aspx">Login</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- MENU AREA END HERE -->
        <!-- MOBILE-MENU-AREA START -->
        <div class="mobile-menu-area">
            <div class="mobile-menu">
                <div class="logo">
                    <a href="#">
                        <img src="images/logo.png" alt="">
                    </a>
                </div>
                <nav id="dropdown">
                    <ul>
                        <li class="smooth-menu">
                            <a href="#">home</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="#about">about</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="#contact">contact</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="jobs.html">Jobs</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="../login.aspx">Login</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- MOBILE-MENU-AREA START -->
    </header>
    <!-- HEADER AREA END HERE -->
    <!-- SLIDER AREA START HERE -->
    <%--<section class="slider-area" id="home">--%>
    <img src="images/animation_high_res.gif" />

    <%--</section>--%>
    <!-- SLIDER AREA END HERE -->

    <section id="what_we_deo">
        <div class="container" style="margin-top: 150px; margin-bottom: 150px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-text">
                        <h2 class="section-title">what we <span class="color">do</span></h2>
                        <!--<p class="s-title">Espark sit amet consectetur adipisicing elit. Corporis, perferendis! Lorem ipsum. adipisicing elit. Corporis, perferendis! Lorem ipsum.</p>-->
                    </div>
                </div>
                <!-- SINGLE ABOUT START HERE -->
                <div class="col-md-4 col-sm-6">
                    <div class="single-about" style="height: 425px;">
                        <span><i class="fa fa-heart"></i></span>
                        <h3>Temporary job</h3>
                        <p>We respond to the demand for temporary services, with guaranteed compliance with the law and due contractual management. A solution suited to your needs and the scale of your project, ensuring benefits and gains for your company.</p>
                    </div>
                </div>
                <!-- SINGLE ABOUT START HERE -->
                <div class="col-md-4 col-sm-6">
                    <div class="single-about" style="height: 425px;">
                        <span><i class="fa fa-flask"></i></span>
                        <h3>Services provision</h3>
                        <p>The Provision of Services aims to free companies from various burdens and concerns so that they can focus on their core business and thus improve the performance and quality of their offer.</p>
                    </div>
                </div>
                <!-- SINGLE ABOUT START HERE -->
                <div class="col-md-4 col-sm-6">
                    <div class="single-about">
                        <span><i class="fa fa-gift"></i></span>
                        <h3>Recruitment</h3>
                        <p>
                            Identifying and selecting the ideal profiles for your projects, implies in-depth knowledge of the sectors of activity in which it operates. Recognizing the specifics allows you to identify the right team for each role. In this sense, our consultants are an extension of your team.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FUN AREA END HERE -->
    <section class="fun-area" style="background-image: url(images/animation_high_res.gif)">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="fun-entry">
                        <span><i class="fa fa-diamond"></i></span>
                        <h2 class="funcounter">2</h2>
                        <p>Offices</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="fun-entry">
                        <span><i class="fa fa-download"></i></span>
                        <h2 class="funcounter">600</h2>
                        <p>Employees</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="fun-entry">
                        <span><i class="fa fa-graduation-cap"></i></span>
                        <h2 class="funcounter">132</h2>
                        <p>Partners</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-12">
                    <div class="fun-entry">
                        <span><i class="fa fa-users"></i></span>
                        <h2 class="funcounter">100</h2>
                        <p>Satisfied Clients</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FUN AREA END HERE -->
    <!-- ABOUT AREA START HERE -->
    <section class="about-area" id="about" style="background-color: #80c223">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-text">
                        <h2 class="section-title section-title-about-us">About <span class="color-white">us</span></h2>

                    </div>
                </div>
                <div class="container">
                    <p>
                        We were born from a business opportunity combined with the experience in Human Resources of its staff, with access to qualified and less qualified labor, having a prompt response to requests, combining this response to the main objective of efficiency in our partners, as well as maximizing the production of resources presented by our partners.


                        A recent company but with years of experience dealing with people and projects and already proven in the job market.


                        The Work Permit ® recruits and selects candidates for temporary features or limited duration projects. The company was born out of a business opportunity combined with the needs of the labor market, namely cost control, the temporary need for labor, the quick and efficient response to companies, the qualification and experience of its staff.


                        The Work Permit ® is based on the constant monitoring of its customers with fast response and efficient market needs, works hard to maximize the results of their employees, based always on RIGOR and PRODUCTIVITY thereof. We are in the market with the commitment and dedication that our customers oblige us, the projects in which we are involved go beyond the selection and assignment of labor, always going through the analysis and production objectives of our customers.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!-- ABOUT AREA END HERE -->
    <!-- BRAND AREA START HERE -->
    <div class="brand-area section-padding" style="background-color: #4a4a4a !important;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand owl-carousel">
                        <!-- SINGLE ITEM START -->
                        <div class="single-brand">
                            <a href="#">
                                <img src="images/client-1.svg" alt="brand">
                            </a>
                        </div>
                        <!-- SINGLE ITEM START -->
                        <div class="single-brand">
                            <a href="#">
                                <img src="images/client-2.png" alt="brand">
                            </a>
                        </div>
                        <!-- SINGLE ITEM START -->
                        <div class="single-brand">
                            <a href="#">
                                <img src="images/client-3.svg" alt="brand">
                            </a>
                        </div>
                        <!-- SINGLE ITEM START -->
                        <div class="single-brand">
                            <a href="#">
                                <img src="images/client-4.svg" alt="brand">
                            </a>
                        </div>
                        <!-- SINGLE ITEM START -->
                        <div class="single-brand">
                            <a href="#">
                                <img src="images/client-5.svg" alt="brand">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- BRAND AREA END HERE -->
    <!-- CONTACT US AREA START HERE -->
    <div class="contact-us-area section-padding" id="contact_us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-text">
                        <h2 class="section-title">contact with <span class="color">us</span></h2>
                        <!--<p class="s-title">Espark sit amet consectetur adipisicing elit. Corporis, perferendis! Lorem ipsum. adipisicing elit. Corporis, perferendis! Lorem ipsum.</p>-->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6" style="height: 200px">
                    <%--<div id="google-map"></div>--%>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3090.523323771552!2d-8.690329284741868!3d39.230990479520585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd18ee6e96bc4081%3A0xc7e64720660cd89b!2sR.%20Eng.%20Ant%C3%B3nio%20Jos%C3%A9%20Souto%20Barreiros%20Mota%2014%2C%202000-014%20Santar%C3%A9m%2C%20Portugal!5e0!3m2!1sen!2s!4v1616609996220!5m2!1sen!2s" width="580" height="325" style="border: 0;"></iframe>

                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label col-sm-12">Your Name</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="name" placeholder="Enter Your Name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-12">Your Email</label>
                        <div class="col-sm-12">
                            <input type="email" class="form-control" id="email_address" placeholder="Enter Your Email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-12">Message</label>
                        <div class="col-sm-12">
                            <textarea class="form-control" rows="7" id="message" placeholder="Enter Your Message"></textarea>
                        </div>
                    </div>


                    <%-- <div class="contact-us-form">
                        <div id="form-messages"></div>
                        <form id="ajax-contact" method="post" action="https://espark.netlify.app/espark/green/mailer.php">
                            <div class="field">
                                <label class="field-label" for="name">your name</label>
                                <input class="field-input" type="text" id="name" name="name" required>
                            </div>

                            <div class="field">
                                <label class="field-label" for="email">your email</label>
                                <input class="field-input" type="email" id="email_address" name="email" required>
                            </div>

                            <div class="field">
                                <label class="field-label" for="message">massage</label>
                                <textarea id="massage" class="field-input" name="message" required></textarea>
                            </div>
                            <button type="submit">submit</button>
                        </form>
                    </div>--%>
                </div>
                <div class="contact-us-form col-md-12 col-sm-12">
                    <button type="submit" id="submit_inquiry">submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewJobs" class="modal fade" role="dialog">
        <div class="modal-dialog " style="width: 90%;">
            <div class="modal-content">
                <div class="modal-body" style="overflow: auto;">
                    <div style="width: 100%;">
                        <div class="section-text">
                            <h2 class="section-title">job <span class="color">openings</span></h2>
                        </div>


                        <ul class="nav nav-pills nav-justified">
                            <li class="bg-success active"><a data-toggle="tab" class="agriculture" href="#agriculture">Agriculture</a></li>
                            <li class="bg-success"><a data-toggle="tab" class="industry" href="#industry">Industry</a></li>
                            <li class="bg-success"><a data-toggle="tab" class="retail" href="#retail">Retail</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="agriculture" class="tab-pane fade in active">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="industry" class="tab-pane fade">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="retail" class="tab-pane fade">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="modalApplyNow" class="modal fade" role="dialog">
        <div class="modal-dialog " style="width: 95%;">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d !important; color: #F3F5F8 !important">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="addNewTitle">Add New Job Offer</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">First Name<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="firstName" placeholder="Enter First Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Last Name<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Email<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" placeholder="Enter Email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Driving License</label>
                            <div class="col-sm-10">
                                <select class="form-control">
                                    <option value="no">No</option>
                                    <option value="yes">Yes</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">NIF Number<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nif_number" placeholder="Enter NIF Number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Passport Number<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="passport_number" placeholder="Enter Passport Number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Passport Validity Year<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="passport_validity_year">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Residence Card Number</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="residence_card_number" placeholder="Enter Residence Card Number">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Medical Examination Number</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="medical_examination" placeholder="Enter Medical Examination Number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Medical Examination Date</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="exam_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">DOB<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="dob">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Sex<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <select id="sex" class="form-control">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Contact<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon">+351</span>
                                    <input type="text" class="form-control" id="contact" placeholder="Enter Contact">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nationality<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nationality" placeholder="Enter Nationality">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Address<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <textarea rows="4" class="form-control" id="address" placeholder="Enter Address"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">NIF<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="nifDocument" class="col-sm-3" hidden="hidden">NIF document</a>
                            <div class="col-sm-5" id="divUploadNif">
                                <input type="file" id="nif" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadNif">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">NISS<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="nissDocument" class="col-sm-3" hidden="hidden">NISS document</a>
                            <div class="col-sm-5" id="divUploadNiss">
                                <input type="file" id="niss" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadNiss">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Passport<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="passportDocument" class="col-sm-3" hidden="hidden">Passport document</a>
                            <div class="col-sm-5" id="divUploadPassport">
                                <input type="file" id="passport" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadPassport">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Visa<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="visaDocument" class="col-sm-3" hidden="hidden">Visa document</a>
                            <div class="col-sm-5" id="divUploadVisa">
                                <input type="file" id="visa" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadVisa">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Residence Card</label>
                            <a href="#" target="_blank" id="residenceCardDocument" class="col-sm-3" hidden="hidden">Residence card document</a>
                            <div class="col-sm-5" id="divUploadResidenceCard">
                                <input type="file" id="residenceCard" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadResidenceCard">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">SEF<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="sefDocument" class="col-sm-3" hidden="hidden">SEF document</a>
                            <div class="col-sm-5" id="divUploadSef">
                                <input type="file" id="sef" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadSef">Upload</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">Boarding Pass<sup class="text-danger"> *</sup></label>
                            <a href="#" target="_blank" id="boardingPassDocument" class="col-md-3" hidden="hidden">Boarding Pass document</a>
                            <div class="col-sm-5" id="divUploadBoardingPass">
                                <input type="file" id="boardingPass" class="form-control" />
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info" id="uploadBoardingPass">Upload</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button id="btnSubmit" data-id="0" type="button" class="btn btn-success">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewDetails" class="modal fade" role="dialog">
        <div class="modal-dialog " style="width: 90%;">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d !important; color: #F3F5F8 !important">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="viewDetailsTitle"></h4>
                </div>
                <div class="modal-body" id="viewDetailsBody">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(window).on('load', function () {
            $("#modalViewJobs").modal("show");
        });
        $(document).ready(function () {

            $("#endDate").attr('min', formatDate(new Date()));
            //$("#passport_validity_year").attr('max', formatDate(new Date()));
            $("input[type='date']").attr('max', formatDate(new Date()));
            var nifPath = "";
            var nissPath = "";
            var passportPath = "";
            var visaPath = "";
            var residenceCardPath = "";
            var sefPath = "";
            var boardingPassPath = "";

            function formatDate(date) {
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var year = date.getFullYear();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                date = year + '-' + month + '-' + day;
                return date;
            }

            function getFormatedDate(value) {
                var date = new Date(value);
                var arrMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                var month = date.getMonth();
                var day = date.getDate();
                var year = date.getFullYear();
                // if (month < 10)
                //     month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                date = arrMonth[month] + ' ' + day + ', ' + year;
                return date;
            }

            function accept_letters_only(e) {
                if (e.which != 8 && e.which != 9 && e.which != 32 && (e.which < 65 || e.which > 122 || e
                    .which == 96)) {
                    e.preventDefault();
                }
            }

            function accept_numbers_only(e) {
                if (e.which != 8 && (e.which < 48 || e.which > 57)) {
                    e.preventDefault();
                }
            }

            function accept_letters_and_numbers_only(e) {
                //if (e.which != 8 && e.which != 9 && e.which != 32 && (e.which < 65 || e.which > 122 || e
                //    .which == 96) && (e.which < 48 || e.which > 57)) {

                if (e.which != 8 && e.which != 9 && e.which != 32 && (e.which < 65 || e.which > 57 || e.which == 96)) {
                    e.preventDefault();
                }
            }

            function createDataTable(data, component) {
                var arrAppliedJobs = JSON.parse(localStorage.getItem("applied_jobs"));
                console.log(arrAppliedJobs);
                $(component + " .table-responsive").html('<table class="table table-striped table-bordered table-hover table-scrollable" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Last Date</th><th>Shift</th><th>Location</th><th>Details</th><th class="text-center">Actions</th></tr></thead></table>');
                var arrData = [];
                $(data).each(function (index, value) {
                    var objData = {
                        "sr": (index + 1),
                        "title": value.job_title,
                        "last_date": getFormatedDate(new Date(value.job_last_date)),
                        "shift": value.job_shift,
                        "location": value.job_location,
                        "details": "<a id='btnViewDetails' style='cursor: pointer;' data-details='" + value.job_details + "'>View</a>",
                        "actions": "<div class='text-center'><a id='btnApply' data-type='" + value.job_type + "' class='btn btn-sm btn-primary' data-id='" + value.job_offer_id + "'>Apply Now</a></div>"
                    };
                    if ($.inArray(value.job_offer_id, arrAppliedJobs) != -1) {
                        objData.actions = "<div class='text-center'><a class='btn btn-sm btn-success'>Applied</a></div>"
                    }
                    arrData.push(objData);
                });

                $(component + ' table').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "title" },
                        { "data": "last_date" },
                        { "data": "shift" },
                        { "data": "location" },
                        { "data": "details" },
                        { "data": "actions" }
                    ]
                });
            }

            function uploadFile(files) {
                var data = new FormData();
                var result = "";
                // Add the uploaded image content to the form data collection
                if (files.length > 0) {
                    data.append("UploadedImage", files[0]);
                }
                // Make Ajax request with the contentType = false, and procesDate = false
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/file_upload",
                    async: false,
                    type: 'POST',
                    method: 'POST',
                    contentType: false,
                    processData: false,
                    data: data,
                    success: function (response) {
                        result = response;
                    },
                    error: function (exception) {
                        if (exception == "") {
                            toastr.error("File Upload Error Please try again");
                        }
                        else {
                            toastr.error(exception.responseJSON.ExceptionMessage);
                        }
                    }
                });
                return result;
            }

            function checkFileType(file) {
                var ext = file.val().split('.').pop().toLowerCase();
                if ($.inArray(ext, ['jpg', 'jpeg', 'pdf', 'doc', 'docx']) == -1) {
                    toastr.error("Invalid file type. Please upload only jpg, jpeg, pdf, doc, docx format files");
                    return true;
                }
                return false;
            }

            getNewAgricultureJobOffers();
            function getNewAgricultureJobOffers() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/agriculture_job_offers_new",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        createDataTable(data, "#agriculture");
                    },
                    error: function (jqXHR, exception) {
                        swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: exception,
                            timer: 1800
                        });
                    }
                });
            }

            function getNewIndustryJobOffers() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/industry_job_offers_new",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        createDataTable(data, "#industry");
                    },
                    error: function (jqXHR, exception) {
                        swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: exception,
                            timer: 1800
                        });
                    }
                });
            }

            function getNewRetailJobOffers() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/retail_job_offers_new",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        createDataTable(data, "#retail");
                    },
                    error: function (jqXHR, exception) {
                        swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: exception,
                            timer: 1800
                        });
                    }
                });
            }

            $(document).on("click", ".agriculture", function () {
                getNewAgricultureJobOffers();
            });

            $(document).on("click", ".industry", function () {
                getNewIndustryJobOffers()
            });

            $(document).on("click", ".retail", function () {
                getNewRetailJobOffers()
            });


            $(document).on("click", "#btnApply", function () {
                $("#firstName").val("");
                $("#lastName").val("");
                $("#email").val("");
                $("#driving_license").val("no");
                $("#nif_number").val("");
                $("#passport_number").val("");
                $("#passport_validity_year").val("");
                $("#residence_card_number").val("");
                $("#medical_examination").val("");
                $("#exam_date").val("");
                $("#dob").val("");
                $("#sex").val("male");
                $("#contact").val("");
                $("#nationality").val("");
                $("#address").val("");
                nifPath = "";
                nissPath = "";
                passportPath = "";
                visaPath = "";
                residenceCardPath = "";
                sefPath = "";
                boardingPassPath = "";


                $("#nifDocument").attr("href", "#");
                $("#nifDocument").attr("hidden", "hidden");
                $("#uploadNif").text("Upload");
                $("#uploadNif").attr("disabled", false);
                $("#uploadNif").attr("class", "btn btn-xs btn-info");
                $("#uploadNif").css("color", "#fff");
                $("#uploadNif").text("Upload");

                $("#nissDocument").attr("href", "#");
                $("#nissDocument").attr("hidden", "hidden");
                $("#uploadNiss").text("Upload");
                $("#uploadNiss").attr("disabled", false);
                $("#uploadNiss").attr("class", "btn btn-xs btn-info");
                $("#uploadNiss").css("color", "#fff");
                $("#uploadNiss").text("Upload");

                $("#passportDocument").attr("href", "#");
                $("#passportDocument").attr("hidden", "hidden");
                $("#uploadPassport").text("Upload");
                $("#uploadPassport").attr("disabled", false);
                $("#uploadPassport").attr("class", "btn btn-xs btn-info");
                $("#uploadPassport").css("color", "#fff");
                $("#uploadPassport").text("Upload");

                $("#visaDocument").attr("href", "#");
                $("#visaDocument").attr("hidden", "hidden");
                $("#uploadVisa").text("Upload");
                $("#uploadVisa").attr("disabled", false);
                $("#uploadVisa").attr("class", "btn btn-xs btn-info");
                $("#uploadVisa").css("color", "#fff");
                $("#uploadVisa").text("Upload");

                $("#residenceCardDocument").attr("href", "#");
                $("#residenceCardDocument").attr("hidden", "hidden");
                $("#uploadResidenceCard").text("Upload");
                $("#uploadResidenceCard").attr("disabled", false);
                $("#uploadResidenceCard").attr("class", "btn btn-xs btn-info");
                $("#uploadResidenceCard").css("color", "#fff");
                $("#uploadResidenceCard").text("Upload");

                $("#sefDocument").attr("href", "#");
                $("#sefDocument").attr("hidden", "hidden");
                $("#uploadSef").text("Upload");
                $("#uploadSef").attr("disabled", false);
                $("#uploadSef").attr("class", "btn btn-xs btn-info");
                $("#uploadSef").css("color", "#fff");
                $("#uploadSef").text("Upload");

                $("#boardingPassDocument").attr("href", "#");
                $("#boardingPassDocument").attr("hidden", "hidden");
                $("#uploadBoardingPass").text("Upload");
                $("#uploadBoardingPass").attr("disabled", false);
                $("#uploadBoardingPass").attr("class", "btn btn-xs btn-info");
                $("#uploadBoardingPass").css("color", "#fff");
                $("#uploadBoardingPass").text("Upload");


                $("#modalApplyNow #btnSubmit").attr("data-id", $(this).attr("data-id"));
                $("#modalApplyNow #btnSubmit").attr("data-type", $(this).attr("data-type"));
                $("#modalApplyNow").modal("show");
            });

            $(document).on("click", "#btnViewDetails", function () {
                $("#modalViewDetails #viewDetailsTitle").html($(this).closest("tr").find("td:eq(1)").text() + "'s Details");
                $("#modalViewDetails #viewDetailsBody").html(unescape($(this).attr("data-details")));
                $("#modalViewDetails").modal("show");
            });

            $(document).on("keypress", "#firstName",
                function (
                    e) {
                    accept_letters_only(e);
                });

            $(document).on("keypress", "#lastName",
                function (
                    e) {
                    accept_letters_only(e);
                });

            $(document).on("keypress", "#contact",
                function (
                    e) {
                    accept_numbers_only(e);
                });

            $(document).on("keypress", "#nif_number",
                function (
                    e) {
                    accept_numbers_only(e);
                });

            $(document).on("keypress", "#nationality",
                function (
                    e) {
                    accept_letters_only(e);
                });

            $(document).on("keypress", "#passport",
                function (
                    e) {
                    accept_letters_and_numbers_only(e);
                });

            $(document).on("click", "#uploadNif", function () {
                if ($("#nif").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                if (checkFileType($("#nif"))) {
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                nifPath = uploadFile($("#nif").get(0).files);
                if (nifPath == "") {
                    //toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadNiss", function () {
                if ($("#niss").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                nissPath = uploadFile($("#niss").get(0).files);

                if (nissPath == "Invalid file type") {
                    toastr.error(nissPath);
                    nissPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (nissPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadPassport", function () {
                if ($("#passport").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                passportPath = uploadFile($("#passport").get(0).files);

                if (passportPath == "Invalid file type") {
                    toastr.error(passportPath);
                    passportPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (passportPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadVisa", function () {
                if ($("#visa").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                visaPath = uploadFile($("#visa").get(0).files);

                if (visaPath == "Invalid file type") {
                    toastr.error(visaPath);
                    visaPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (visaPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadResidenceCard", function () {
                if ($("#residenceCard").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                residenceCardPath = uploadFile($("#visa").get(0).files);

                if (residenceCardPath == "Invalid file type") {
                    toastr.error(residenceCardPath);
                    residenceCardPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (residenceCardPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadSef", function () {
                if ($("#sef").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                sefPath = uploadFile($("#sef").get(0).files);

                if (sefPath == "Invalid file type") {
                    toastr.error(sefPath);
                    sefPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (sefPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#uploadBoardingPass", function () {
                if ($("#boardingPass").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                boardingPassPath = uploadFile($("#boardingPass").get(0).files);

                if (boardingPassPath == "Invalid file type") {
                    toastr.error(boardingPassPath);
                    boardingPassPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (boardingPassPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success");
                    $(this).append("<i class='fa fa-check'></i>");
                }
            });

            $(document).on("click", "#modalApplyNow #btnSubmit", function () {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var error = false;
                if ($("#firstName").val() == "") {
                    toastr.error("First name field cannot be empty");
                    error = true;
                }

                if ($("#lastName").val() == "") {
                    toastr.error("Last name field cannot be empty");
                    error = true;
                }

                if ($("#email").val() == "") {
                    toastr.error("Email field cannot be empty");
                    error = true;
                }

                if (!regex.test($("#email").val())) {
                    toastr.error("Invalid Email Address");
                    error = true;
                }

                if ($("#nif_number").val() == "") {
                    toastr.error("NIF number field cannot be empty");
                    error = true;
                }

                if ($("#passport_number").val() == "") {
                    toastr.error("Passport number field cannot be empty");
                    error = true;
                }

                if ($("#passport_validity_year").val() == "") {
                    toastr.error("Passport Validity Year field cannot be empty");
                    error = true;
                }

                //if ($("#medical_examination").val() == "") {
                //    toastr.error("Medical Examination field cannot be empty");
                //    error = true;
                //}

                if ($("#medical_examination").val() != "" && $("#exam_date").val() == "") {
                    toastr.error("Medical Examination date field cannot be empty");
                    error = true;
                }

                if ($("#dob").val() == "") {
                    toastr.error("DOB field cannot be empty");
                    error = true;
                }

                if ($("#contact").val() == "") {
                    toastr.error("Contact field cannot be empty");
                    error = true;
                }

                if ($("#nationality").val() == "") {
                    toastr.error("Nationality field cannot be empty");
                    error = true;
                }

                if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    error = true;
                }

                if (nifPath == '') {
                    toastr.error("Upload NIF document first");
                    error = true;
                }

                if (nissPath == '') {
                    toastr.error("Upload NISS document first");
                    error = true;
                }

                if (passportPath == '') {
                    toastr.error("Upload Passport document first");
                    error = true;
                }

                if (visaPath == '') {
                    toastr.error("Upload Visa document first");
                    error = true;
                }

                if (boardingPassPath == '') {
                    toastr.error("Upload Boarding Pass document first");
                    error = true;
                }

                if (sefPath == '') {
                    toastr.error("Upload SEF document first");
                    error = true;
                }

                if (boardingPassPath == '') {
                    toastr.error("Upload Boarding Pass document first");
                    error = true;
                }

                if (error) {
                    return;
                }

                var id = $(this).attr("data-id");
                var type = $(this).attr("data-type");

                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_applicants",
                    data: {
                        "first_name": $("#firstName").val(),
                        "last_name": $("#lastName").val(),
                        "email": $("#email").val(),
                        "driving_license": $("#driving_license").val(),
                        "nif_number": $("#nif_number").val(),
                        "passport_number": $("#passport_number").val(),
                        "passport_validity_year": $("#passport_validity_year").val(),
                        "residence_card_number": $("#residence_card").val(),
                        "medical_examination": $("#medical_examination").val(),
                        "exam_date": $("#exam_date").val(),
                        "dob": $("#dob").val(),
                        "sex": $("#sex").val(),
                        "contact": $("#contact").val(),
                        "nationality": $("#nationality").val(),
                        "address": $("#address").val(),
                        "NIF": nifPath,
                        "NISS": nissPath,
                        "passport": passportPath,
                        "visa": visaPath,
                        "residence_card": residenceCardPath,
                        "NISS": sefPath,
                        "boarding_pass": boardingPassPath,
                        "status": "pending",
                        "job_offer_type": type,
                        "job_offer_id": id,
                        "apply_date": formatDate(new Date())
                    },
                    async: false,
                    method: "POST",
                    success: function () {
                        $("#modalApplyNow").modal("hide");
                        toastr.success("You have successfully applied for this job");
                        var ids = JSON.parse(localStorage.getItem("applied_jobs"));
                        ids.push(Number(id));
                        localStorage.setItem("applied_jobs", JSON.stringify(ids));
                        getNewAgricultureJobOffers();
                        getNewIndustryJobOffers();
                        getNewRetailJobOffers();
                    },
                    error: function (jqXHR, exception) {
                        swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: exception,
                            timer: 1800
                        });
                    }
                });
            });

            $(document).on("keypress", "#name",
                function (
                    e) {
                    accept_letters_only(e);
                });

            $(document).on("click", "#submit_inquiry", function () {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var error = false;

                if ($("#name").val() == "") {
                    toastr.error("Please enter your name");
                    error = true;
                }

                if ($("#email_address").val() == "") {
                    toastr.error("Please enter your email address");
                    error = true;
                }

                if (!regex.test($("#email_address").val())) {
                    toastr.error("Invalid Email Address");
                    error = true;
                }

                if ($("#message").val() == "") {
                    toastr.error("Please type something in message box");
                    error = true;
                }

                if (error) {
                    return false;
                }


                var EmailBody = "<h4>" + $("#name").val() + " (" + $("#email_address").val() + ") asked something!</h4><p>" + $("#message").val() + "</p>";
                var EmailAddress = "akashaus2020@gmail.com";
                var Subject = "Visitor's Inquiry from workpermit.pt";
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/send_email",
                    async: false,
                    method: 'GET',
                    data: {
                        EmailBody: EmailBody,
                        EmailAddress: EmailAddress,
                        Subject: Subject,
                    },
                    success: function (response) {
                        toastr.success("Your inquiry has been submitted successfully");
                        $("#name").val("");
                        $("#email_address").val("");
                        $("#message").val("");
                    },
                    error: function (jqXHR, exception) {
                        toastr.error("Something went wrong");
                    }
                });
            });
        });
    </script>
    <!-- CONTACT US AREA END HERE -->
    <%--</div>--%>
</asp:Content>
