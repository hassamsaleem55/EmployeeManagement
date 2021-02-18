<%@ Page Title="Upcoming Jobs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="upcoming_jobs.aspx.cs" Inherits="EmployeeManagement.jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Upcoming Jobs List</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i>New Job</button>
                </div>

                <div class="col-md-12 table-responsive jobs_list" style="margin-top: 10px;">
                </div>
            </div>
        </div>
    </div>

    <div id="modalAddNew" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="addNewTitle">Add New Job</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Title:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="title" placeholder="Enter Title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Client:</label>
                            <div class="col-sm-10">
                                <select id="clients" class="form-control">
                                    <option value="select">Select</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Details:</label>
                            <div class="col-sm-10">
                                <textarea rows="3" class="form-control" id="details" placeholder="Enter Details"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Start Date:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="startDate">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">End Date:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="endDate">
                            </div>
                        </div>
                        <div class="form-group" id="divDuration">
                            <label class="control-label col-sm-2">Duration:</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="duration" value="0" disabled="disabled">
                            </div>
                            days
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Job shift:</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="shift">
                                    <option value="Morning">Morning</option>
                                    <option value="Afternoon">Afternoon</option>
                                    <option value="Night">Night</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Type:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="type" placeholder="Enter Job Type">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Location</label>
                            <div class="col-sm-10">
                                <select id="location" class="form-control">
                                    <option value="select">Select</option>
                                    <option value="Aveiro">Aveiro</option>
                                    <option value="Beja">Beja</option>
                                    <option value="Benavente">Benavente</option>
                                    <option value="Faro">Faro</option>
                                    <option value="Lisboa">Lisboa</option>
                                    <option value="Lousado">Lousado - Vila Nova de Famalicao</option>
                                    <option value="Maia">Maia</option>
                                    <option value="Matosinhos">Matosinhos</option>
                                    <option value="Montijo">Montijo</option>
                                    <option value="Oeiras">Oeiras</option>
                                    <option value="Palmela">Palmela</option>
                                    <option value="Pombal">Pombal</option>
                                    <option value="Portalegre">Portalegre</option>
                                    <option value="Porto">Porto</option>
                                    <option value="Povoa">Povoa de Varzim</option>
                                    <option value="Santo">Santo Tirso</option>
                                    <option value="Setubal">Setubal</option>
                                    <option value="Sintra">Sintra</option>
                                    <option value="Savira">Tavira</option>
                                    <option value="Trofa">Trofa</option>
                                    <option value="Valongo">Valongo</option>
                                    <option value="Vila_do_conde">Vila do Vonde</option>
                                    <option value="Vila_flor">Vila Flor</option>
                                    <option value="Vila_nova_de_famalicao">Vila Nova de Famalicao</option>
                                    <option value="Vila_nova_de_gaia">Vila Nova de Gaia</option>
                                    <option value="Viseu">Viseu</option>
                                </select>
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
            //$('#tblJobs').DataTable();
            $('#tblLabors').DataTable();
            $('#tblLaborsList').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobs").attr("class", "collapsed active");
            $(".nav-item:eq(1)").attr("class", "nav-item active");
            $("#subPages").attr("class", "");

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
                    $("#btnShowModal").show();
                    $("#assignNewLabor").show();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Location</th><th>Labor</th><th>Details</th><th class="text-center">Actions</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/upcoming_jobs",
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "title": value.job_title,
                                    "client_name": value.client_name,
                                    "start_date": getFormatedDate(value.job_start_date),
                                    "end_date": getFormatedDate(value.job_end_date),
                                    "duration": value.job_duration + " days",
                                    "shift": value.job_shift,
                                    "type": value.job_type,
                                    "location": value.job_location,
                                    "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "' data-start-date='" + value.job_start_date + "' data-end-date='" + value.job_end_date + "'>View</a>",
                                    "details": "<a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                    "actions": "<div class='text-center'><a href='' class='btn btn-primary btn-sm btn-job-start' style='margin-right: 5px;' data-id='" + value.job_id + "'>Start Job</a><a id='btnEdit' class='btn btn-xs btn-warning' data-id='" + value.job_id + "' style='margin-right: 5px;'><i class='fa fa-pencil'></i></a><a id='btnDelete' class='btn btn-xs btn-danger ml-2' data-id='" + value.job_id + "'><i class='fa fa-trash'></i></a></div>"
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
                            { "data": "start_date" },
                            { "data": "end_date" },
                            { "data": "duration" },
                            { "data": "shift" },
                            { "data": "type" },
                            { "data": "location" },
                            { "data": "labor" },
                            { "data": "details" },
                            { "data": "actions" }
                        ]
                    });
                }

                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "client") {
                    $("#btnShowModal").hide();
                    $("#assignNewLabor").hide();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Labor</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/upcoming_jobs",
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            var count = 0;
                            $(data).each(function (index, value) {
                                if (value.client_id == JSON.parse(localStorage.getItem("login_details"))[0].id) {
                                    var objData = {
                                        "sr": ++count,
                                        "title": value.job_title,
                                        "start_date": getFormatedDate(value.job_start_date),
                                        "end_date": getFormatedDate(value.job_end_date),
                                        "duration": value.job_duration + " days",
                                        "shift": value.job_shift,
                                        "type": value.job_type,
                                        "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "' data-start-date='" + value.job_start_date + "'>View</a>",
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
                            { "data": "start_date" },
                            { "data": "end_date" },
                            { "data": "duration" },
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
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Location</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/upcoming_jobs_for_employee/" + JSON.parse(localStorage.getItem("login_details"))[0].id,
                        async: false,
                        method: 'GET',
                        success: function (data) {
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
                                    "title": value.job_title,
                                    "client_name": value.client_name,
                                    "start_date": getFormatedDate(value.job_start_date),
                                    "end_date": getFormatedDate(value.job_end_date),
                                    "duration": value.job_duration + " days",
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
                            { "data": "start_date" },
                            { "data": "end_date" },
                            { "data": "duration" },
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

            function getDuration() {
                var startDate = 0;
                var endDate = 0;
                var diff = 0;
                if ($("#startDate").val() != " " && $("#endDate").val() != "") {
                    startDate = new Date($("#startDate").val());
                    endDate = new Date($("#endDate").val());
                    if (endDate >= startDate) {
                        diff = (endDate - startDate) / (1000 * 60 * 60 * 24) + 1;
                    }
                }
                return diff;
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

            $(document).on("click", "#btnShowModal", function () {
                $("#addNewTitle").text("Add New Job");
                $("#btnSubmit").text("Add");
                $("#title").val("");
                $("#clients").val("select");
                $("#details").val("");
                $("#startDate").val("");
                $("#startDate").attr('min', formatDate(new Date()));
                $("#endDate").prop("disabled", true);
                $("#shift").val("Morning");
                $("#duration").val("0");
                $("#type").val("");
                $("#location").val("select");
                $("#clients").attr("disabled", false);
                $("#btnSubmit").attr("data-id", "0");
                $("#modalAddNew").modal("show");
            });

            $("#endDate").change(function () {
                $("#duration").val(getDuration());
            });

            $("#startDate").change(function () {
                $("#endDate").attr('min', formatDate(new Date($(this).val())));
                $("#endDate").prop("disabled", false);
                $("#duration").val(getDuration());
            });

            $(document).on("click", "#btnSubmit", function () {
                //var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var error = false;

                if ($("#title").val() == "") {
                    toastr.error("Title field cannot be empty");
                    //$("#title").focus();
                    //return;
                    error = true;
                }
                if ($("#clients").val() == "select") {
                    toastr.error("Please select a client");
                    //$("#clients").focus();
                    //return;
                    error = true;
                }
                if ($("#details").val() == "") {
                    toastr.error("Details field cannot be empty");
                    //$("#details").focus();
                    //return;
                    error = true;
                }
                if ($("#startDate").val() == "") {
                    toastr.error("Please select a start date");
                    //$("#startDate").focus();
                    //return;
                    error = true;
                }
                if ($("#endDate").val() == "") {
                    toastr.error("Please select an end date");
                    //$("#endDate").focus();
                    //return;
                    error = true;
                }
                if (error) {
                    return;
                }

                var startDate = new Date($("#startDate").val());
                var endDate = new Date($("#endDate").val());

                if (endDate < startDate) {
                    toastr.error("End date cannot be less than start date");
                    $("#endDate").focus();
                    return;
                }
                if ($("#type").val() == "") {
                    toastr.error("Type field cannot be empty");
                    $("#type").focus();
                    return;
                }

                if ($("#location").val() == "select") {
                    toastr.error("Please select any location");
                    $("#location").focus();
                    return;
                }
                var id = $("#btnSubmit").attr("data-id");
                var url = localStorage.getItem("ApiLink") + "api/upcoming_jobs";
                var method = "POST";
                var successMsg = "Job has been added successfully";
                if (id != 0) {
                    url = localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id;
                    method = "PUT";
                    successMsg = "Job details has been updated successfully";
                }
                $.ajax({
                    url: url,
                    data: {
                        "job_title": $("#title").val(),
                        "job_details": $("#details").val(),
                        "job_start_date": $("#startDate").val(),
                        "job_end_date": $("#endDate").val(),
                        "job_duration": $("#duration").val(),
                        "job_type": $("#type").val(),
                        "job_shift": $("#shift").val(),
                        "job_location": $("#location").val(),
                        "client_id": $("#clients").val(),
                        "job_status": "upcoming",
                    },
                    async: false,
                    method: method,
                    success: function () {
                        $("#modalAddNew").modal("hide");
                        toastr.success(successMsg);
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

            $(document).on("click", ".btn-job-start", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/change_job_status/" + id,
                    async: false,
                    method: 'PUT',
                    data: {
                        job_status: "running"
                    },
                    success: function () {
                        toastr.success("Job has been started");
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

            $(document).on("click", "#btnEdit", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        //var date = new Date(data.job_start_date);
                        $("#title").val(data.job_title);
                        $("#clients").val(data.client_id);
                        $("#details").val(data.job_details);
                        $("#startDate").val(data.job_start_date.split("T")[0]);
                        $("#endDate").val(data.job_end_date.split("T")[0]);
                        $("#duration").val(data.job_duration);
                        $("#type").val(data.job_type);
                        $("#shift").val(data.job_shift);
                        $("#location").val(data.job_location);
                        $("addNewTitle").text("Update Job");
                        $("#clients").attr("disabled", true);
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
                                url: localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id,
                                async: false,
                                method: 'DELETE',
                                success: function (response) {
                                    toastr.success("Job has been deleted successfully");
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
                $(".unassigned_labors_list").html('<table id="tblLaborsList" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Employee Name</th><th>Documents</th><th>Select</th></tr></thead></table>');
                $("#btnAddLabor").hide();
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/unassigned_employees",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        if (data.length != 0) {
                            $("#btnAddLabor").show();
                            $(data).each(function (index, value) {
                                var objData = {
                                    "sr": index + 1,
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
                        if (data.length != 0) {
                            $("#btnAddLabor").show();
                            $(data).each(function (index, value) {
                                if (new Date(job_end_date.split("T")[0]) < new Date(value.start_date.split("T")[0]) || new Date(job_start_date.split("T")[0]) > new Date(value.end_date.split("T")[0])) {
                                    var objData = {
                                        "sr": index + 1,
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
                $(".checkbox:checked").each(function () {
                    var employee_id = $(this).attr("data-id");
                    var job_id = $(this).attr("data-job-id");
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/assign_employee_to_job",
                        async: false,
                        method: 'POST',
                        data: {
                            "employee_id": employee_id,
                            "job_id": job_id
                        },
                        success: function (response) {
                            getLabors(job_id);
                            $("#modalNewLabor").modal("hide");
                            toastr.success("Employees have been assigned successfully");
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
