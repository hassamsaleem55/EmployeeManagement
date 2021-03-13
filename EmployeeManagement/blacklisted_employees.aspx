<%@ Page Title="Blacklisted Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="blacklisted_employees.aspx.cs" Inherits="EmployeeManagement.blacklisted_employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @media only screen and (max-width: 600px) {
            .btn-info {
                float: right;
            }

            #generatePassword {
                float: right;
            }
        }
    </style>

    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Blacklisted Employees List</h3>
            </div>

            <div class="panel-body">
                <%--   <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i>New Employee</button>
                </div>--%>
                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewDocuments" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <table id="rowDocuments" class="table table-responsive">
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalBlacklist" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">

                    <label>Comments:</label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success" data-dismiss="modal">Reactivate</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalComments" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            var nifPath = "";
            var nissPath = "";
            var passportPath = "";
            var visaPath = "";
            var residenceCardPath = "";
            var sefPath = "";
            var boardingPassPath = "";

            //$('#example').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkEmployees").attr("class", "collapsed active");
            $(".nav-item:eq(6)").attr("class", "nav-item active");
            $("#subPages1").attr("class", "");
            getEmployeesData();
            function getEmployeesData() {
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employees",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            if (value.status == "blacklisted") {
                                var objData = {
                                    "sr": index + 1,
                                    "first_name": value.first_name,
                                    "last_name": value.last_name,
                                    "nif_number": value.nif_number,
                                    "email": value.email,
                                    "password": value.password,
                                    "contact": value.contact,
                                    "documents": "<a style='cursor: pointer;' class='viewDocuments' data-id='" + value.employee_id + "'>view</a>",
                                    "comments": "<a style='cursor: pointer;' class='viewComments' data-name='" + value.first_name + "' data-comments='" + value.comments + "'>view</a>",
                                    "actions": "<div class='text-center'><a id='btnEdit' style='margin-right: 2px;' class='btn btn-xs btn-warning' data-id='" + value.employee_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' style='margin-right: 2px;' class='btn btn-xs btn-danger ml-2' data-id='" + value.employee_id + "'><i class='fa fa-trash'></i></a><a style='margin-right: 2px; border: 0.5px solid green' class='btn btn-xs btn-default btnChangeStatus' data-id='" + value.employee_id + "'>Reactivate</a></div>"
                                };
                                arrData.push(objData);
                            }
                        });
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
                $(".table-responsive").empty();
                $(".table-responsive").html('<table id="example" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th>NIF Number<th>Email</th><th>Password</th><th>Contact</th><th>Documents</th><th>Comments</th><th class="text-center">Actions</th></tr></thead></table>');
                $('#example').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "nif_number" },
                        { "data": "email" },
                        { "data": "password" },
                        { "data": "contact" },
                        { "data": "documents" },
                        { "data": "comments"},
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
                        console.log(response);
                    },
                });
                return result;
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
                    accept_numbers_only(e)
                });

            $(document).on("click", ".viewComments", function () {
                $("#modalComments .modal-title").html("Why " + $(this).attr("data-name") + " was blocked ?");
                $("#modalComments .modal-body").html($(this).attr("data-comments"));
                $("#modalComments").modal("show");
            });

            $(".btnChangeStatus").hover(function () {
                $(this).attr("class", "btn btn-xs btn-success btnChangeStatus");
            });

            $(".btnChangeStatus").mouseleave(function () {
                $(this).attr("class", "btn btn-xs btn-default btnChangeStatus");
            });

            $(document).on("click", ".btnChangeStatus", function () {
                $("#modalBlacklist .modal-title").html("Reactivate " + $(this).closest("tr").find("td:eq(1)").text() + " " + $(this).closest("tr").find("td:eq(2)").text() + " ?");
                $("#modalBlacklist .btn-success").attr("data-id", $(this).attr("data-id"));
                $("#modalBlacklist .form-control").val("");
                $("#modalBlacklist").modal("show");
            });

            $(document).on("click", "#modalBlacklist .btn-success", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/change_employee_status/" + $(this).attr("data-id"),
                    async: false,
                    method: 'PUT',
                    data: {
                        "status": "unassigned",
                        "comments": $("#modalBlacklist .form-control").val()
                    },
                    success: function (data) {
                        toastr.success("Employee has been Reactivated");
                        getEmployeesData();
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

            $(document).on("show.bs.modal", "#modalAddNew", function () {
                $("#divUploadNif").html('<input type="file" id="nif" class="form-control" />');
                $("#divUploadNiss").html('<input type="file" id="niss" class="form-control" />');
                $("#divUploadPassport").html('<input type="file" id="passport" class="form-control" />');
                $("#divUploadVisa").html('<input type="file" id="visa" class="form-control" />');
                $("#divUploadResidenceCard").html('<input type="file" id="residenceCard" class="form-control" />');
                $("#divUploadSef").html('<input type="file" id="sef" class="form-control" />');
                $("#divUploadBoardingPass").html('<input type="file" id="boardingPass" class="form-control" />');
            });

            $(document).on("click", "#btnShowModal", function () {
                $("#firstName").val("");
                $("#lastName").val("");
                $("#email").val("");
                $("#password").val("");
                $("#contact").val("");
                $("#address").val("");
                $("#workingShift").val("day");

                $("#generatePassword").attr("class", "btn btn-xs btn-info pull-right");
                $("#generatePassword").css("color", "#fff");
                $("#generatePassword").text("Generate Password");

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

                $(".modal-title").text("Add New Employee");
                $("#btnSubmit").text("Add");
                $("#btnSubmit").attr("data-id", "0");
                $("#modalAddNew").modal("show");
            });

            $(document).on("click", "#generatePassword", function () {
                var password = "";
                var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&";
                for (var i = 0; i < 8; i++) {
                    password += possible.charAt(Math.floor(Math.random() * possible.length));
                }
                $("#password").val(password);
            });

            $(document).on("click", "#uploadNif", function () {
                if ($("#nif").val() == '') {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                nifPath = uploadFile($("#nif").get(0).files);

                if (nifPath == "Invalid file type") {
                    toastr.error(nifPath);
                    nifPath = "";
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (nifPath == "") {
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

                residenceCardPath = uploadFile($("#residenceCard").get(0).files);

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

            $(document).on("click", "#btnSubmit", function () {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var error = false;
                if ($("#firstName").val() == "") {
                    toastr.error("First name field cannot be empty");
                    //$("#firstName").focus();
                    //return;
                    error = true;
                }

                if ($("#lastName").val() == "") {
                    toastr.error("Last name field cannot be empty");
                    //$("#lastName").focus();
                    //return;
                    error = true;
                }

                if ($("#email").val() == "") {
                    toastr.error("Email field cannot be empty");
                    //$("#email").focus();
                    //return;
                    error = true;
                }

                if (!regex.test($("#email").val())) {
                    toastr.error("Invalid Email Address");
                    //$("#email").focus();
                    //return;
                    error = true;
                }

                if ($("#password").val() == "") {
                    toastr.error("Password field cannot be empty");
                    //$("#password").focus();
                    //return;
                    error = true;
                }

                if ($("#contact").val() == "") {
                    toastr.error("Contact field cannot be empty");
                    //$("#contact").focus();
                    //return;
                    error = true;
                }

                if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    //$("#address").focus();
                    //return;
                    $("#address").focus();
                    return;
                }
                if (error) {
                    return;
                }

                var id = $("#btnSubmit").attr("data-id");
                var url = localStorage.getItem("ApiLink") + "api/employees/" + id;
                var method = "PUT";
                var successMsg = "Employee details has been updated successfully";

                if (id == 0) {
                    url = localStorage.getItem("ApiLink") + "api/employees";
                    method = "POST";
                    successMsg = "Employee has been added successfully";

                    if (nifPath == '') {
                        toastr.error("Upload nif document first");
                        return;
                    }

                    if (nissPath == '') {
                        toastr.error("Upload niss document first");
                        return;
                    }

                    if (passportPath == '') {
                        toastr.error("Upload passport document first");
                        return;
                    }

                    if (visaPath == '') {
                        toastr.error("Upload visa document first");
                        return;
                    }

                    if (residenceCardPath == '') {
                        toastr.error("Upload residence card first");
                        return;
                    }

                    if (sefPath == '') {
                        toastr.error("Upload sef document first");
                        return;
                    }

                    if (boardingPassPath == '') {
                        toastr.error("Upload boarding pass document first");
                        return;
                    }
                }
                else {
                    if (nifPath == '') {
                        nifPath = $("#nifDocument").attr("href");
                    }

                    if (nissPath == '') {
                        nissPath = $("#nissDocument").attr("href");
                    }

                    if (passportPath == '') {
                        passportPath = $("#passportDocument").attr("href");
                    }

                    if (visaPath == '') {
                        visaPath = $("#visaDocument").attr("href");
                    }

                    if (residenceCardPath == '') {
                        residenceCardPath = $("#residenceCardDocument").attr("href");
                    }

                    if (sefPath == '') {
                        sefPath = $("#sefDocument").attr("href");
                    }

                    if (boardingPassPath == '') {
                        boardingPassPath = $("#boardingPassDocument").attr("href");
                    }
                }

                $.ajax({
                    url: url,
                    data: {
                        "first_name": $("#firstName").val(),
                        "last_name": $("#lastName").val(),
                        "email": $("#email").val(),
                        "password": $("#password").val(),
                        "contact": $("#contact").val(),
                        "address": $("#address").val(),
                        "NIF": nifPath,
                        "NISS": nissPath,
                        "passport": passportPath,
                        "visa": visaPath,
                        "residence_card": residenceCardPath,
                        "SEF": sefPath,
                        "boarding_pass": boardingPassPath,
                        "working_shift": $("#workingShift").val(),
                        "status": "unassigned"
                    },
                    async: false,
                    method: method,
                    success: function () {
                        $("#modalAddNew").modal("hide");
                        toastr.success(successMsg);
                        getEmployeesData();
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

            $(document).on("click", "#btnEdit", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employees/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#firstName").val(data.first_name);
                        $("#lastName").val(data.last_name);
                        $("#email").val(data.email);
                        $("#password").val(data.password);
                        $("#contact").val(data.contact);
                        $("#address").val(data.address);
                        $("#workingShift").val(data.working_shift);

                        $("#generatePassword").attr("class", "btn btn-xs btn-warning");
                        $("#generatePassword").css("color", "black");
                        $("#generatePassword").text("New Password");

                        $("#nifDocument").attr("href", data.NIF);
                        $("#nifDocument").attr("hidden", false);
                        $("#uploadNif").text("Upload");
                        $("#uploadNif").attr("disabled", false);
                        $("#uploadNif").attr("class", "btn btn-xs btn-warning");
                        $("#uploadNif").css("color", "black");
                        $("#uploadNif").text("New Upload");

                        $("#nissDocument").attr("href", data.NISS);
                        $("#nissDocument").attr("hidden", false);
                        $("#uploadNiss").text("Upload");
                        $("#uploadNiss").attr("disabled", false);
                        $("#uploadNiss").attr("class", "btn btn-xs btn-warning");
                        $("#uploadNiss").css("color", "black");
                        $("#uploadNiss").text("New Upload");

                        $("#passportDocument").attr("href", data.passport);
                        $("#passportDocument").attr("hidden", false);
                        $("#uploadPassport").text("Upload");
                        $("#uploadPassport").attr("disabled", false);
                        $("#uploadPassport").attr("class", "btn btn-xs btn-warning");
                        $("#uploadPassport").css("color", "black");
                        $("#uploadPassport").text("New Upload");

                        $("#visaDocument").attr("href", data.visa);
                        $("#visaDocument").attr("hidden", false);
                        $("#uploadVisa").text("Upload");
                        $("#uploadVisa").attr("disabled", false);
                        $("#uploadVisa").attr("class", "btn btn-xs btn-warning");
                        $("#uploadVisa").css("color", "black");
                        $("#uploadVisa").text("New Upload");

                        $("#residenceCardDocument").attr("href", data.residence_card);
                        $("#residenceCardDocument").attr("hidden", false);
                        $("#uploadResidenceCard").text("Upload");
                        $("#uploadResidenceCard").attr("disabled", false);
                        $("#uploadResidenceCard").attr("class", "btn btn-xs btn-warning");
                        $("#uploadResidenceCard").css("color", "black");
                        $("#uploadResidenceCard").text("New Upload");

                        $("#sefDocument").attr("href", data.SEF);
                        $("#sefDocument").attr("hidden", false);
                        $("#uploadSef").text("Upload");
                        $("#uploadSef").attr("disabled", false);
                        $("#uploadSef").attr("class", "btn btn-xs btn-warning");
                        $("#uploadSef").css("color", "black");
                        $("#uploadSef").text("New Upload");

                        $("#boardingPassDocument").attr("href", data.boarding_pass);
                        $("#boardingPassDocument").attr("hidden", false);
                        $("#uploadBoardingPass").text("Upload");
                        $("#uploadBoardingPass").attr("disabled", false);
                        $("#uploadBoardingPass").attr("class", "btn btn-xs btn-warning");
                        $("#uploadBoardingPass").css("color", "black");
                        $("#uploadBoardingPass").text("New Upload");

                        $(".modal-title").text("Update Employee");
                        $("#btnSubmit").text("Update");
                        $("#btnSubmit").attr("data-id", id);
                        $("#modalAddNew").modal("show");
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

            $(document).on("click", "#btnDelete", function () {
                swal({
                    title: "Are you sure?",
                    icon: "warning",
                    buttons: ["No, Cancel it", "Yes, I am sure"],
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).attr("data-id");
                            $.ajax({
                                url: localStorage.getItem("ApiLink") + "api/employees/" + id,
                                async: false,
                                method: 'DELETE',
                                success: function (response) {
                                    toastr.success("Employee has been removed successfully");
                                    getEmployeesData();
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
                    });
            });

            $(document).on("click", ".viewDocuments", function () {
                var id = $(this).attr("data-id");
                var count = 1;
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employees/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#modalViewDocuments").modal("show");
                        $(".modal-title").text(data.first_name + "'s Documents");
                        $("#rowDocuments").empty();
                        if (data.length != 0) {
                            if (data.NIF != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td><a href='" + data.NIF + "' target='_blank'>" + data.NIF.split("/")[data.NIF.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.NIF + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.NISS != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td><a href='" + data.NISS + "' target='_blank'>" + data.NISS.split("/")[data.NISS.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.NISS + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.passport != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td><a href='" + data.passport + "' target='_blank'>" + data.passport.split("/")[data.passport.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.passport + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.visa != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td><a href='" + data.visa + "' target='_blank'>" + data.visa.split("/")[data.visa.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.visa + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.residence_card != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td><a href='" + data.residence_card + "' target='_blank'>" + data.residence_card.split("/")[data.residence_card.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.residence_card + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.SEF != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td><a href='" + data.SEF + "' target='_blank'>" + data.SEF.split("/")[data.SEF.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.SEF + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td>Not Available</td><td></td><tr>");
                            }

                            if (data.boarding_pass != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td><a href='" + data.boarding_pass + "' target='_blank'>" + data.boarding_pass.split("/")[data.boarding_pass.split("/").length - 1] + "</a></td><td><a class='download_document' href='" + data.boarding_pass + "'>Download</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td>Not Available</td><td></td><tr>");
                            }
                        }
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

            $(document).on("click", ".download_document", function () {
                e.preventDefault();
                window.location.href = $(this).attr("href");
            });
        });
    </script>
</asp:Content>
