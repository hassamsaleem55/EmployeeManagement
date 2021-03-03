<%@ Page Title="Jobs" Language="C#" MasterPageFile="~/homeMaster.Master" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="EmployeeManagement.home.jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .single-brand {
            max-height: 100px;
        }

            .single-brand img {
                max-height: 90px;
            }

        .nav-pills li.active a {
            color: #fff !important;
            background-color: #80c223 !important
        }

        .nav-pills li a:hover {
            border: 0.5px solid #80c223 !important;
            color: #80c223 !important;
            background-color: #fff !important
        }

        .nav-pills li.active a:hover {
            color: #fff !important;
            background-color: #80c223 !important
        }

        .nav-pills li a {
            color: #808080 !important;
        }

        #btnViewDetails:hover {
            color: #80c223 !important;
        }
    </style>

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
                                        <a href="index.aspx#about">about</a>
                                    </li>
                                    <li class="smooth-menu">
                                        <a href="index.aspx#contact">contact</a>
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
                            <a href="index.html">home</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="index.html#about">about</a>
                        </li>
                        <li class="smooth-menu">
                            <a href="index.html#contact">contact</a>
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

    <section id="content">
        <div class="container" style="margin-top: 70px; margin-bottom: 255px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-text">
                        <h2 class="section-title">job <span class="color">openings</span></h2>
                        <!--<p class="s-title">Espark sit amet consectetur adipisicing elit. Corporis, perferendis! Lorem ipsum. adipisicing elit. Corporis, perferendis! Lorem ipsum.</p>-->
                    </div>
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

        <div id="modalApplyNow" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
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
                                    <input type="text" class="form-control" id="passport_validity_year" placeholder="Enter Passport Validity Year">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Medical Examination<sup class="text-danger"> *</sup></label>
                                <div class="col-sm-10">
                                    <textarea rows="4" class="form-control" id="medical_examination" placeholder="Enter Medical Examination Details"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Medical Examination Date<sup class="text-danger"> *</sup></label>
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
            <div class="modal-dialog modal-lg">
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

    </section>

    <script>


        $(document).ready(function () {

            $("#endDate").attr('min', formatDate(new Date()));
            var nifPath = "";
            var nissPath = "";
            $("input[type='date']").attr('max', formatDate(new Date()));
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

            function createDataTable(data, component) {
                var arrAppliedJobs = JSON.parse(localStorage.getItem("applied_jobs"));
                console.log(arrAppliedJobs);
                $(component + " .table-responsive").html('<table class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Last Date</th><th>Shift</th><th>Location</th><th>Details</th><th class="text-center">Actions</th></tr></thead></table>');
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
                $("#nif_number").val("");
                $("#passport_number").val("");
                $("#passport_validity_year").val("");
                $("#medical_examination").val("");
                $("#exam_date").val("");
                $("#dob").val("");
                $("#sex").val("male");
                $("#contact").val("");
                $("#nationality").val("");
                $("#address").val("");

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

                if ($("#medical_examination").val() == "") {
                    toastr.error("Medical Examination field cannot be empty");
                    error = true;
                }

                if ($("#exam_date").val() == "") {
                    toastr.error("Medical Examination Dates field cannot be empty");
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
                    toastr.error("Upload nif document first");
                    error = true;
                }

                if (nissPath == '') {
                    toastr.error("Upload niss document first");
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
                        "nif_number": $("#nif_number").val(),
                        "passport_number": $("#passport_number").val(),
                        "passport_validity_year": $("#passport_validity_year").val(),
                        "medical_examination": $("#medical_examination").val(),
                        "exam_date": $("#exam_date").val(),
                        "dob": $("#dob").val(),
                        "sex": $("#sex").val(),
                        "contact": $("#contact").val(),
                        "nationality": $("#nationality").val(),
                        "address": $("#address").val(),
                        "NIF": nifPath,
                        "NISS": nissPath,
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
        });
    </script>
</asp:Content>
