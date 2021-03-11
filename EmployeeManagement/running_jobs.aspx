<%@ Page Title="Running jobs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="running_jobs.aspx.cs" Inherits="EmployeeManagement.running_jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Running Jobs List</h3>
            </div>
            <div class="panel-body">
                <%--<div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"></i>New Job</button>
                </div>--%>
                <div class="col-md-12 table-responsive jobs_list" style="margin-top: 10px;">
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewLabors" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Assigned Labor's List</h4>
                </div>
                <div class="modal-body">
                    <button class="btn btn-sm btn-success pull-right" id="assignNewLabor"><i class="fa fa-plus"></i>Assign New Labor</button>
                    <div class="col-md-12 table-responsive assigned_labors_list" style="margin-top: 10px;">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <%--<button id="btnSubmit" data-id="0" type="button" class="btn btn-success">Add</button>--%>
                </div>
            </div>
        </div>
    </div>

    <div id="modalNewLabor" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Assigned New Labor</h4>
                </div>
                <div class="modal-body">
                    <div class="col-md-12 table-responsive unassigned_labors_list"></div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button id="btnAddLabor" data-id="0" type="button" class="btn btn-success">Add</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalUploadCutt" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Assign New Labor</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                    <button id="btnAddLaborWithCutt" type="button" class="btn btn-success">Add</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewDocuments" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="viewDocumentsTitle"></h4>
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

    <div id="modalViewDetails" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
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
        $(document).ready(function () {
            //$('#tblLabors').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobs").attr("class", "collapsed active");
            $(".nav-item:eq(2)").attr("class", "nav-item active");
            $("#subPages").attr("class", "");
            var cutt = [];

            //function getFormatedDate(value) {
            //    var date = new Date(value);
            //    return ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear();
            //}

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

            getJobsData();
            function getJobsData() {

                if (JSON.parse(localStorage.getItem("login_details"))[0].type == "admin") {
                    $("#assignNewLabor").show();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>End Date</th><th>Shift</th><th>Type</th><th>Labor</th><th>Details</th><th>Actions</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/running_jobs",
                        async: false,
                        method: 'GET',
                        success: function (data) {

                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "title": value.job_title,
                                    "client_name": value.client_name,
                                    "end_date": getFormatedDate(value.job_end_date),
                                    "shift": value.job_shift,
                                    "type": value.job_type,
                                    "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "' data-start-date='" + value.job_start_date + "' data-end-date='" + value.job_end_date + "'>View</a>",
                                    "details": "<a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                    "actions": "<a href='' class='btn btn-primary btn-sm btn-job-complete' data-id='" + value.job_id + "'>Finish Job</a>"
                                };
                                arrData.push(objData);
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


                    $('#tblJobs').DataTable({
                        "data": arrData,
                        "columns": [
                            { "data": "sr" },
                            { "data": "title" },
                            { "data": "client_name" },
                            { "data": "end_date" },
                            { "data": "shift" },
                            { "data": "type" },
                            { "data": "labor" },
                            { "data": "details" },
                            { "data": "actions" }
                        ]
                    });
                }

                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "client") {
                    $("#assignNewLabor").hide();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>End Date</th><th>Shift</th><th>Type</th><th>Labor</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/running_jobs",
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            var count = 0;
                            $(data).each(function (index, value) {
                                if (value.client_id == JSON.parse(localStorage.getItem("login_details"))[0].id) {
                                    var objData = {
                                        "sr": ++count,
                                        "title": value.job_title,
                                        "end_date": getFormatedDate(value.job_end_date),
                                        "shift": value.job_shift,
                                        "type": value.job_type,
                                        "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "' data-start-date='" + value.job_start_date + "' data-end-date='" + value.job_end_date + "'>View</a>",
                                        "details": "<a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                        //"actions": "<a href='' class='btn btn-primary btn-sm btn-job-complete' data-id='" + value.job_id + "'>Finish Job</a>"
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


                    $('#tblJobs').DataTable({
                        "data": arrData,
                        "columns": [
                            { "data": "sr" },
                            { "data": "title" },
                            { "data": "end_date" },
                            { "data": "shift" },
                            { "data": "type" },
                            { "data": "labor" },
                            { "data": "details" }
                        ]
                    });
                }

                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "employee") {
                    $("#btnShowModal").hide();
                    $("#assignNewLabor").hide();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>End Date</th><th>Shift</th><th>Type</th><th>Location</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/running_jobs_for_employee/" + JSON.parse(localStorage.getItem("login_details"))[0].id,
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "title": value.job_title,
                                    "client_name": value.client_name,
                                    "end_date": getFormatedDate(value.job_end_date),
                                    "shift": value.job_shift,
                                    "type": value.job_type,
                                    "location": value.job_location,
                                    "details": "<a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                };
                                arrData.push(objData);
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

                    $('#tblJobs').DataTable({
                        "data": arrData,
                        "columns": [
                            { "data": "sr" },
                            { "data": "title" },
                            { "data": "client_name" },
                            { "data": "end_date" },
                            { "data": "shift" },
                            { "data": "type" },
                            { "data": "location" },
                            { "data": "details" }
                        ]
                    });
                }
            }

            getClients();
            function getClients() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/clients_names",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#clients").html('<option value="select">Select</option>');
                        if (data.length != 0) {
                            $(data).each(function (index, value) {
                                $("#clients").append("<option value='" + value.id + "'>" + value.name + "</option>");
                            });
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
            }

            function getLabors(id) {
                if (JSON.parse(localStorage.getItem("login_details"))[0].type == "admin") {
                    $(".assigned_labors_list").html('<table id="tblLabors" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Employee Name</th><th>Documents</th><th>Action</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/assigned_employees/" + id,
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "name": value.name,
                                    "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a>",
                                    "actions": "<a id='btnRemoveEmployee' class='btn btn-sm btn-danger' data-id='" + value.id + "' data-job-id='" + id + "'>Remove</a>",
                                };
                                arrData.push(objData);
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

                    $('#tblLabors').DataTable({
                        "data": arrData,
                        "columns": [
                            { "data": "sr" },
                            { "data": "name" },
                            { "data": "documents" },
                            { "data": "actions" }
                        ]
                    });
                }
                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "client") {
                    $(".assigned_labors_list").html('<table id="tblLabors" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Employee Name</th><th>Documents</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/assigned_employees/" + id,
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "name": value.name,
                                    "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a>",

                                };
                                arrData.push(objData);
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

                    $('#tblLabors').DataTable({
                        "data": arrData,
                        "columns": [
                            { "data": "sr" },
                            { "data": "name" },
                            { "data": "documents" }
                        ]
                    });
                }
            }

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

            $(document).on("click", ".btn-job-complete", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/change_job_status/" + id,
                    async: false,
                    method: 'PUT',
                    data: {
                        job_status: "completed"
                    },
                    success: function () {
                        toastr.success("Job has been finished");
                        getJobsData();
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

            $(document).on("click", "#btnViewLabors", function () {
                $("#assignNewLabor").attr("data-start-date", $(this).attr("data-start-date"));
                $("#assignNewLabor").attr("data-end-date", $(this).attr("data-end-date"));
                $("#assignNewLabor").attr("data-job-id", $(this).attr("data-id"));
                getLabors($(this).attr("data-id"));
                $("#modalViewLabors").modal("show");
            });

            $(document).on("click", "#assignNewLabor", function () {
                var arrData = [];
                var job_id = $(this).attr("data-job-id");
                var job_start_date = $(this).attr("data-start-date");
                var job_end_date = $(this).attr("data-end-date");
                var count = 0;
                $(".unassigned_labors_list").html('<table id="tblLaborsList" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Employee Name</th><th>Documents</th><th>Select</th></tr></thead></table>');
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/unassigned_employees",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        if (data.length == 0) {
                            $("#btnAddLabor").hide();
                        }
                        else {
                            $("#btnAddLabor").show();
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": ++count,
                                    "name": value.name,
                                    "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a>",
                                    "select": "<input type='checkbox' class='checkbox' data-id='" + value.id + "' data-job-id='" + job_id + "'/>",
                                };
                                arrData.push(objData);
                            });
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

                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/assigned_employees_from_jobs_log",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        if (data.length == 0) {
                            $("#btnAddLabor").hide();
                        }
                        else {
                            $("#btnAddLabor").show();
                            $(data).each(function (index, value) {
                                if (new Date(job_end_date.split("T")[0]) < new Date(value.start_date.split("T")[0]) || new Date(job_start_date.split("T")[0]) > new Date(value.end_date.split("T")[0])) {
                                    var objData = {
                                        "sr": ++count,
                                        "name": value.name,
                                        "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a>",
                                        "select": "<input type='checkbox' class='checkbox' data-id='" + value.id + "' data-job-id='" + job_id + "'/>",
                                    };
                                    arrData.push(objData);
                                }
                            });
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

                $('#tblLaborsList').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "name" },
                        { "data": "documents" },
                        { "data": "select" }
                    ]
                });
                $("#modalNewLabor").modal("show");
            });

            $(document).on("click", "#btnAddLabor", function () {
                if ($(".checkbox:checked").length == 0) {
                    toastr.error("No employee is selected to add");
                    return false;
                }

                $("#modalUploadCutt").find(".modal-body").empty();

                $(".checkbox:checked").each(function (index, value) {
                    var employee_id = $(this).attr("data-id");
                    var job_id = $(this).attr("data-job-id");
                    $("#modalUploadCutt").find(".modal-body").append('<div class="form-group"><label class="control-label col-sm-12">Upload ' + $(this).closest("tr").find("td:eq(1)").text() + '\'s CUTT<sup class="text-danger"> *</sup></label><div class="col-sm-12 row"><div class="col-sm-11"><input type="file" class="form-control" data-employee-id="' + employee_id + '" data-job-id="' + job_id + '"/></div><div class="col-sm-1"><button class="btn btn-xs btn-info btnUploadCutt" data-index="' + index + '">Upload</button></div></div>');

                });

                $("#modalUploadCutt").find(".modal-body").append("<div class='clearfix'></div>");
                $(".btnUploadCutt").text("Upload");
                $(".btnUploadCutt").attr("disabled", false);
                $(".btnUploadCutt").attr("class", "btn btn-xs btn-info btnUploadCutt");
                $(".btnUploadCutt").css("color", "#fff");

                $("#modalUploadCutt").modal("show");
            });

            $(document).on("change", "#modalUploadCutt .form-control", function () {
                $(this).closest(".form-group").find(".btnUploadCutt").text("Upload");
                $(this).closest(".form-group").find(".btnUploadCutt").attr("disabled", false);
                $(this).closest(".form-group").find(".btnUploadCutt").attr("class", "btn btn-xs btn-info btnUploadCutt");
                $(this).closest(".form-group").find(".btnUploadCutt").css("color", "#fff");
            });

            $(document).on("click", ".btnUploadCutt", function () {
                if ($(this).closest(".form-group").find(".form-control").val() == "") {
                    toastr.error("Choose any file first");
                    return;
                }

                $(this).attr("disabled", "disabled");
                $(this).text("Uploading...");

                var cuttPath = uploadFile($(this).closest(".form-group").find(".form-control").get(0).files);

                if (cuttPath == "Invalid file type") {
                    toastr.error(cuttPath);
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else if (cuttPath == "") {
                    toastr.error("Something went wrong");
                    $(this).text("Upload");
                    $(this).attr("disabled", false);
                }
                else {
                    $(this).text("");
                    $(this).attr("class", "btn btn-xs btn-success btnUploadCutt");
                    $(this).append("<i class='fa fa-check'></i>");
                    //cutt.push(cuttPath);
                    cutt[$(this).attr("data-index")] = cuttPath;
                }
            });

            $(document).on("click", "#btnAddLaborWithCutt", function () {
                var error = 0;
                $("#modalUploadCutt").find(".btnUploadCutt").each(function () {
                    if ($(this).hasClass("btn-info")) {
                        toastr.error("CUTT of " + $(this).closest(".form-group").find("label").text().replace("'s CUTT *", "").replace("Upload ", "") + " is not uploaded");
                        error = 1;
                    }
                });

                if (error == 1) {
                    return false;
                }

                var job_id = "";

                $("#modalUploadCutt").find(".form-control").each(function (index, value) {
                    var employee_id = $(this).attr("data-employee-id");
                    job_id = $(this).attr("data-job-id");
                    var cuttPath = cutt[index];
                    var employee_name = $(this).closest(".form-group").find("label").text().split("s CUTT")[0];

                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/assign_employee_to_job",
                        async: false,
                        method: 'POST',
                        data: {
                            "employee_id": employee_id,
                            "job_id": job_id,
                            "cutt": cuttPath
                        },
                        success: function (response) {
                            toastr.success(employee_name + " have been assigned successfully");
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

                getLabors(job_id);
                $("#modalUploadCutt").modal("hide");
                $("#modalNewLabor").modal("hide");
            });

            $(document).on("click", "#btnRemoveEmployee", function () {
                var id = $(this).attr("data-id");
                var job_id = $(this).attr("data-job-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/assigned_employees/" + id,
                    async: false,
                    method: 'DELETE',
                    success: function (response) {
                        getLabors(job_id);
                        //$("#modalNewLabor").modal("hide");
                        toastr.success("Employees have been removed successfully");
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

            $(document).on("click", "#viewDocuments", function () {
                var id = $(this).attr("data-id");
                var count = 1;
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employees/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#modalViewDocuments").modal("show");
                        $("#viewDocumentsTitle").text(data.first_name + "'s Documents");
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

            $(document).on("click", "#btnViewDetails", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#viewDetailsTitle").text(data.job_title + "'s details");
                        $("#viewDetailsBody").text(data.job_details);
                        $("#modalViewDetails").modal("show");
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
