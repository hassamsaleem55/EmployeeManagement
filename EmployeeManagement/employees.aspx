<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employees.aspx.cs" Inherits="EmployeeManagement.employee" %>

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
                <h3>Employees List</h3>
            </div>

            <div class="panel-body">
                <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i>New Employee</button>
                </div>
                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                </div>
            </div>
        </div>
    </div>

    <div id="modalAddNew" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add New Employee</h4>
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
                            <label class="control-label col-sm-2">Password<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-8">
                                <input type="text" readonly="readonly" class="form-control" id="password">
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-xs btn-info pull-right" id="generatePassword">Generate Password</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">NIF Number<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nif_number" placeholder="Enter NIF Number">
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
                            <label class="control-label col-sm-2">Driving License<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <select id="driving_license" class="form-control">
                                    <option value="no">No</option>
                                    <option value="yes">Yes</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Contact<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="contact" placeholder="Enter Contact">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nationality<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nationality" placeholder="Enter Nationality">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Location<sup class="text-danger"> *</sup></label>
                            <div class="col-sm-10">
                                <select id="location" class="form-control">
                                    <option value="select">Select</option>
                                    <option value="aveiro">Aveiro</option>
                                    <option value="beja">Beja</option>
                                    <option value="benavente">Benavente</option>
                                    <option value="faro">Faro</option>
                                    <option value="lisboa">Lisboa</option>
                                    <option value="lousado">Lousado - Vila Nova de Famalicao</option>
                                    <option value="maia">Maia</option>
                                    <option value="matosinhos">Matosinhos</option>
                                    <option value="montijo">Montijo</option>
                                    <option value="oeiras">Oeiras</option>
                                    <option value="palmela">Palmela</option>
                                    <option value="pombal">Pombal</option>
                                    <option value="portalegre">Portalegre</option>
                                    <option value="porto">Porto</option>
                                    <option value="povoa">Povoa de Varzim</option>
                                    <option value="santo">Santo Tirso</option>
                                    <option value="setubal">Setubal</option>
                                    <option value="sintra">Sintra</option>
                                    <option value="tavira">Tavira</option>
                                    <option value="trofa">Trofa</option>
                                    <option value="valongo">Valongo</option>
                                    <option value="vila_do_conde">Vila do Vonde</option>
                                    <option value="vila_flor">Vila Flor</option>
                                    <option value="vila_nova_de_famalicao">Vila Nova de Famalicao</option>
                                    <option value="vila_nova_de_gaia">Vila Nova de Gaia</option>
                                    <option value="viseu">Viseu</option>
                                </select>
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
                            <label class="control-label col-sm-2">Residence Card<sup class="text-danger"> *</sup></label>
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
                    <button id="btnSubmit" data-id="0" type="button" class="btn btn-success">Add</button>
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

                    <label>Comments<sup class="text-danger"> *</sup></label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Blacklist</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalInactive" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">

                    <label>Comments<sup class="text-danger"> *</sup></label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Inactive</button>
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
            $(".nav-item:eq(5)").attr("class", "nav-item active");
            $("#subPages1").attr("class", "");

            getEmployeesData();

            restrictDates();
            function restrictDates() {
                var dtToday = new Date();

                var month = dtToday.getMonth() + 1;
                var day = dtToday.getDate();
                var year = dtToday.getFullYear();
                if (month < 10)
                    month = '0' + month.toString();
                if (day < 10)
                    day = '0' + day.toString();

                var maxDate = year + '-' + month + '-' + day;
                $('#dob').attr('max', maxDate);
            }

            function getEmployeesData() {
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employees",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            if (value.status != "blacklisted" && value.status != "inactivated") {
                                var objData = {
                                    "sr": index + 1,
                                    "first_name": value.first_name,
                                    "last_name": value.last_name,
                                    "email": value.email,
                                    "password": value.password,
                                    "contact": value.contact,
                                    "documents": "<a style='cursor: pointer;' class='viewDocuments' data-id='" + value.employee_id + "'>view</a>",
                                    "actions": "<div class='text-center'><a id='btnEdit' style='margin-right: 2px;' class='btn btn-xs btn-warning' data-id='" + value.employee_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' style='margin-right: 2px;' class='btn btn-xs btn-danger' data-id='" + value.employee_id + "'><i class='fa fa-trash'></i></a><a style='margin-right: 2px; border: 0.5px solid red' class='btn btn-xs btn-default btnBlacklist' data-id='" + value.employee_id + "'>Blacklist</a><a style='border: 0.5px solid red' class='btn btn-xs btn-default btnInactive' data-id='" + value.employee_id + "'>Inactive</a></div>"
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
                $(".table-responsive").html('<table id="example" class="table table-striped table-bordered table-hover" ><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Password</th><th>Contact</th><th>Documents</th><th class="text-center">Actions</th></tr></thead></table>');
                $('#example').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "email" },
                        { "data": "password" },
                        { "data": "contact" },
                        { "data": "documents" },
                        { "data": "actions" }
                    ]
                });
            }

            function checkFileType(file) {
                var ext = file.val().split('.').pop().toLowerCase();
                if ($.inArray(ext, ['jpg', 'jpeg', 'pdf', 'doc', 'docx']) == -1) {
                    toastr.error("Invalid file type. Please upload only jpg, jpeg, pdf, doc, docx format files");
                    return true;
                }
                return false;
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

            $(".btnBlacklist").hover(function () {
                $(this).attr("class", "btn btn-xs btn-danger btnBlacklist");
            });

            $(".btnBlacklist").mouseleave(function () {
                $(this).attr("class", "btn btn-xs btn-default btnBlacklist");
            });

            $(document).on("click", ".btnBlacklist", function () {
                $("#modalBlacklist .modal-title").html("Blacklist " + $(this).closest("tr").find("td:eq(1)").text() + " " + $(this).closest("tr").find("td:eq(2)").text() + " ?");
                $("#modalBlacklist .btn-danger").attr("data-id", $(this).attr("data-id"));
                $("#modalBlacklist").modal("show");
            });

            $(document).on("click", "#modalBlacklist .btn-danger", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/change_employee_status/" + $(this).attr("data-id"),
                    async: false,
                    method: 'PUT',
                    data: {
                        "status": "blacklisted",
                        "comments": $("#modalBlacklist .form-control").val()
                    },
                    success: function (data) {
                        toastr.success("Employee has been Blaclisted");
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

            $(".btnInactive").hover(function () {
                $(this).attr("class", "btn btn-xs btn-danger btnInactive");
            });

            $(".btnInactive").mouseleave(function () {
                $(this).attr("class", "btn btn-xs btn-default btnInactive");
            });

            $(document).on("click", ".btnInactive", function () {
                $("#modalInactive .modal-title").html("Inactive " + $(this).closest("tr").find("td:eq(1)").text() + " " + $(this).closest("tr").find("td:eq(2)").text() + " ?");
                $("#modalInactive .btn-danger").attr("data-id", $(this).attr("data-id"));
                $("#modalInactive").modal("show");
            });

            $(document).on("click", "#modalInactive .btn-danger", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/change_employee_status/" + $(this).attr("data-id"),
                    async: false,
                    method: 'PUT',
                    data: {
                        "status": "inactivated",
                        "comments": $("#modalInactive .form-control").val()
                    },
                    success: function (data) {
                        toastr.success("Employee has been Inactivated");
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
                $("#nif_number").val("");
                $("#dob").val("");
                $("#sex").val("male");
                $("#driving_license").val("no");
                $("#contact").val("");
                $("#nationality").val("");
                $("#localtion").val("select");
                $("#address").val("");

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

                if ($("#password").val() == "") {
                    toastr.error("Password field cannot be empty");
                    error = true;
                }

                if ($("#nif_number").val() == "") {
                    toastr.error("NIF number field cannot be empty");
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

                if ($("#location").val() == "select") {
                    toastr.error("Please select any location");
                    error = true;
                }

                if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    $("#address").focus();
                    return;
                }

                if (error) {
                    return;
                }

                var id = $("#btnSubmit").attr("data-id");
                var data = {
                    "first_name": $("#firstName").val(),
                    "last_name": $("#lastName").val(),
                    "email": $("#email").val(),
                    "password": $("#password").val(),
                    "nif_number": $("#nif_number").val(),
                    "dob": $("#dob").val(),
                    "sex": $("#sex").val(),
                    "driving_license": $("#driving_license").val(),
                    "contact": $("#contact").val(),
                    "nationality": $("#nationality").val(),
                    "location": $("#location").val(),
                    "address": $("#address").val(),
                    "NIF": nifPath,
                    "NISS": nissPath,
                    "passport": passportPath,
                    "visa": visaPath,
                    "residence_card": residenceCardPath,
                    "SEF": sefPath,
                    "boarding_pass": boardingPassPath,
                    "status": "unassigned",
                };
                if (id == 0) {
                    var url = localStorage.getItem("ApiLink") + "api/employees";
                    var method = "POST";
                    var successMsg = "Employee has been added successfully";
                    data.created_at = new Date();

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
                    var url = localStorage.getItem("ApiLink") + "api/employees/" + id;
                    var method = "PUT";
                    var successMsg = "Employee details has been updated successfully";
                    data.modified_at = new Date();

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
                    data: data,
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
                        $("#nif_number").val(data.nif_number);
                        $("#dob").val(data.dob);
                        $("#sex").val(data.sex);
                        $("#driving_license").val(data.driving_license);
                        $("#contact").val(data.contact);
                        $("#nationality").val(data.nationality);
                        $("#location").val(data.location);
                        $("#address").val(data.address);

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
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td><a href='" + data.NIF + "' target='_blank'>" + data.NIF.split("/")[data.NIF.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td>Not Available</td><tr>");
                            }

                            if (data.NISS != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td><a href='" + data.NISS + "' target='_blank'>" + data.NISS.split("/")[data.NISS.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td>Not Available</td><tr>");
                            }

                            if (data.passport != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td><a href='" + data.passport + "' target='_blank'>" + data.passport.split("/")[data.passport.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td>Not Available</td><tr>");
                            }

                            if (data.visa != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td><a href='" + data.visa + "' target='_blank'>" + data.visa.split("/")[data.visa.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td>Not Available</td><tr>");
                            }

                            if (data.residence_card != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td><a href='" + data.residence_card + "' target='_blank'>" + data.residence_card.split("/")[data.residence_card.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td>Not Available</td><tr>");
                            }

                            if (data.SEF != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td><a href='" + data.SEF + "' target='_blank'>" + data.SEF.split("/")[data.SEF.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td>Not Available</td><tr>");
                            }

                            if (data.boarding_pass != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td><a href='" + data.boarding_pass + "' target='_blank'>" + data.boarding_pass.split("/")[data.boarding_pass.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td>Not Available</td><tr>");
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
        });
    </script>
</asp:Content>
