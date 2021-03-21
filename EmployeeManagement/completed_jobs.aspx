<%@ Page Title="Completed Jobs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="completed_jobs.aspx.cs" Inherits="EmployeeManagement.completed_jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Completed Jobs List</h3>
            </div>
            <div class="panel-body">

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
                    <%--<button class="btn btn-sm btn-success pull-right" id="assignNewLabor"><i class="fa fa-plus"></i>Assign New Labor</button>--%>
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
            $('#tblJobs').DataTable();
            $('#tblLabors').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobs").attr("class", "collapsed active");
            $(".nav-item:eq(3)").attr("class", "nav-item active");
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
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Labor</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/completed_jobs",
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
                                    "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "' data-start-date='" + value.job_start_date + "'>View</a>",
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
                            { "data": "labor" },
                            { "data": "details" },
                        ]
                    });
                }

                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "client") {
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Labor</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/completed_jobs",
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
                            { "data": "details" },
                        ]
                    });
                }

                else if (JSON.parse(localStorage.getItem("login_details"))[0].type == "employee") {
                    $("#btnShowModal").hide();
                    $("#assignNewLabor").hide();
                    $(".jobs_list").html('<table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Client Name</th><th>Start Date</th><th>End Date</th><th>Duration</th><th>Shift</th><th>Type</th><th>Location</th><th>Details</th></tr></thead></table>');
                    var arrData = [];
                    $.ajax({
                        url: localStorage.getItem("ApiLink") + "api/completed_jobs_for_employee/" + JSON.parse(localStorage.getItem("login_details"))[0].id,
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

            function getLabors(id) {
                if (JSON.parse(localStorage.getItem("login_details"))[0].type == "admin") {
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
                                    "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "' data-job-id='" + id + "'>view</a>",
                                    //"actions": "<a id='btnRemoveEmployee' class='btn btn-sm btn-danger' data-id='" + value.id + "' data-job-id='" + id + "'>Remove</a>",
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
                            //{ "data": "actions" }
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
                                    "documents": "<a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "' data-job-id='" + id + "'>view</a>",
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

            $(document).on("click", "#btnViewLabors", function () {
                getLabors($(this).attr("data-id"));
                $("#modalViewLabors").modal("show");
            });

            $(document).on("click", "#viewDocuments", function () {
                var emp_id = $(this).attr("data-id");
                var job_id = $(this).attr("data-job-id");

                var count = 1;
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/employee_documents/" + emp_id + "/" + job_id,
                    async: false,
                    method: 'GET',
                    //data: {
                    //    employee_id: id,
                    //    job_id: job_id
                    //},
                    success: function (data) {
                        $("#modalViewDocuments").modal("show");
                        $("#viewDocumentsTitle").text(data[0].first_name + "'s Documents");
                        $("#rowDocuments").empty();
                        if (data[0].length != 0) {
                            if (data[0].NIF != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td><a href='" + data[0].NIF + "' target='_blank'>" + data[0].NIF.split("/")[data[0].NIF.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NIF</td><td>Not Available</td><tr>");
                            }

                            if (data[0].NISS != null) {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td><a href='" + data[0].NISS + "' target='_blank'>" + data[0].NISS.split("/")[data[0].NISS.split("/").length - 1] + "</a></td><tr>");
                            }
                            else {
                                $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>NISS</td><td>Not Available</td><tr>");
                            }

                            if (JSON.parse(localStorage.getItem("login_details"))[0].type != "client") {
                                if (data[0].passport != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td><a href='" + data[0].passport + "' target='_blank'>" + data[0].passport.split("/")[data[0].passport.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Passport</td><td>Not Available</td><tr>");
                                }

                                if (data[0].visa != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td><a href='" + data[0].visa + "' target='_blank'>" + data[0].visa.split("/")[data[0].visa.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Visa</td><td>Not Available</td><tr>");
                                }

                                if (data[0].residence_card != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td><a href='" + data[0].residence_card + "' target='_blank'>" + data[0].residence_card.split("/")[data[0].residence_card.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Residence Card</td><td>Not Available</td><tr>");
                                }

                                if (data[0].SEF != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td><a href='" + data[0].SEF + "' target='_blank'>" + data[0].SEF.split("/")[data[0].SEF.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>SEF</td><td>Not Available</td><tr>");
                                }

                                if (data[0].boarding_pass != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td><a href='" + data[0].boarding_pass + "' target='_blank'>" + data[0].boarding_pass.split("/")[data[0].boarding_pass.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>Boarding Pass</td><td>Not Available</td><tr>");
                                }
                            }

                            if (JSON.parse(localStorage.getItem("login_details"))[0].type != "employee") {
                                if (data[0].CUTT != null) {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>CUTT</td><td><a href='" + data[0].CUTT + "' target='_blank'>" + data[0].CUTT.split("/")[data[0].CUTT.split("/").length - 1] + "</a></td><tr>");
                                }
                                else {
                                    $("#rowDocuments").append("<tr><td>" + (count++) + "</td><td>CUTT</td><td>Not Available</td><tr>");
                                }
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
