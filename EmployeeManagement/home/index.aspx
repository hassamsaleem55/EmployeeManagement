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
                                <a href="mailto:info@espark.com"><i class="fa fa-envelope"></i>info@workpermit.com</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-phone"></i>Tel: (123) 456-7890</a>
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
                    <div class="col-md-2 col-sm-2">
                        <div class="logo">
                            <a href="#">
                                <img src="images/wp_logo.svg" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- MAIN MENU START -->
                    <div class="col-md-10 col-sm-10">
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
                                        <a href="#contact">contact</a>
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
    <section class="slider-area" id="home">
        <div class="slider-wrapper">
            <div id="slider" class="nivoSlider">
                <img src="images/slider1.jpg" alt="" title="#htmlcaption1" />
                <img src="images/slider2.jpg" alt="" title="#htmlcaption2" />
            </div>
            <!-- CAPTION 1 -->
            <div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content">
                                <!-- Direction 1 -->
                                <div class="wow bounceInRight" data-wow-duration="1.5" data-wow-delay=".5s ">
                                    <h1 class="title1">welcome to <span class="color">work permit</span></h1>
                                </div>
                                <!-- Direction 2 -->
                                <div class="wow bounceInRight" data-wow-duration="2" data-wow-delay=".7s ">
                                    <p class="title2">We are a Recruitement Agency</p>
                                </div>
                                <!-- Direction 3 -->
                                <div class="wow bounceInUp" data-wow-duration="1.5" data-wow-delay=".9s ">
                                    <a href="#" class="ready-btn">read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CAPTION 1 END -->
            <!-- CAPTION 2 START -->
            <div id="htmlcaption2" class="nivo-html-caption slider-caption-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-content">
                                <!-- Direction 1 -->
                                <div class="wow slideInLeft" data-wow-duration="1.5" data-wow-delay=".5s ">
                                    <h1 class="title1">explore your <span class="color">dream</span> business</h1>
                                </div>
                                <!-- Direction 2 -->
                                <div class="wow slideInLeft" data-wow-duration="2" data-wow-delay=".7s ">
                                    <p class="title2">we are ready to lessen your work </p>
                                </div>
                                <!-- Direction 3 -->
                                <div class="wow bounceInUp" data-wow-duration="1.5" data-wow-delay=".9s ">
                                    <a href="#" class="ready-btn">read more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- CAPTION 2 END -->
        </div>
    </section>
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
    <section class="fun-area" style="background-image:url(images/port7.jpg)">
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
    <section class="about-area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-text">
                        <h2 class="section-title">About <span class="color">us</span></h2>

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
    <div class="contact-us-area section-padding" id="contact">
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
                <div class="col-md-6 col-sm-6">
                    <div id="google-map"></div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="contact-us-form">
                        <div id="form-messages"></div>
                        <form id="ajax-contact" method="post" action="https://espark.netlify.app/espark/green/mailer.php">
                            <div class="field">
                                <label class="field-label" for="name">your name</label>
                                <input class="field-input" type="text" id="name" name="name" required>
                            </div>

                            <div class="field">
                                <label class="field-label" for="email">your email</label>
                                <input class="field-input" type="email" id="email" name="email" required>
                            </div>

                            <div class="field">
                                <label class="field-label" for="message">massage</label>
                                <textarea id="massage" class="field-input" name="message" required></textarea>
                            </div>
                            <button type="submit">submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTACT US AREA END HERE -->
</asp:Content>
