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
                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                    <table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Client Name</th>
                                <th>End Date</th>
                                <th>Shift</th>
                                <th>Type</th>
                                <th>Labor</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                    </table>
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
                    <button class="btn btn-sm btn-primary pull-right" id="assignNewLabor"><i class="fa fa-plus"></i>Assign New Labor</button>
                    <div id="divTblLabors" style="margin-top: 50px;">
                        <table id="tblLabors" class="table table-responsive table-striped table-bordered table-hover" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Employee Name</th>
                                    <th>Documents</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
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
                    <table id="tblLaborsList" class="table table-responsive table-striped table-bordered table-hover" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Employee Name</th>
                                <th>Documents</th>
                                <th>Select</th>
                            </tr>
                        </thead>
                        <tbody id="rowLaborsList">
                        </tbody>
                    </table>
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
            //$('#tblLabors').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $(".nav-item:eq(1)").attr("class", "collapsed nav-item active");
            $(".nav-item:eq(3)").attr("class", "nav-item active");
            $("#subPages").attr("class", "");

            function getFormatedDate(value) {
                var date = new Date(value);
                return ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear();
            }

            getJobsData();
            function getJobsData() {
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
                                "labor": "<a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                "details": "<a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a>",
                                //"actions": "<a id='btnEdit' class='btn btn-xs btn-warning' data-id='" + value.employee_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' class='btn btn-xs btn-danger ml-2' data-id='" + value.employee_id + "'><i class='fa fa-trash'></i></a>"
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
                        { "data": "details" }
                    ]
                });
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
                if ($("#startDate").val() != "" && $("#endDate").val() != "") {
                    startDate = new Date($("#startDate").val());
                    endDate = new Date($("#endDate").val());
                    if (endDate >= startDate) {
                        diff = (endDate - startDate) / (1000 * 60 * 60 * 24) + 1;
                    }
                }
                return diff;
            }

            function getLabors(id) {
                var arrData = []
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
                                "actions": "<a id='btnRemoveEmployee' class='btn btn-sm btn-danger' data-id='" + value.id + "' data-job-id='" + id + "'>Remove</a>"
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

                $("#modalViewLabors #divTblLabors").empty();
                $("#modalViewLabors #divTblLabors").html('<table id="tblLabors" class="table table-responsive table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Employee Name</th><th>Documents</th><th>Action</th></tr></thead></table>');

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

            //$(document).on("click", "#btnShowModal", function () {
            //    $("#addNewTitle").text("Add New Job");
            //    $("#btnSubmit").text("Add");
            //    $("#title").val("");
            //    $("#clients").val("select");
            //    $("#details").val("");
            //    $("#startDate").val("");
            //    $("#endDate").val("");
            //    $("#duration").val("0");
            //    $("#type").val("");
            //    $("#shift").val("Day");
            //    $("#clients").attr("disabled", false);
            //    $("#btnSubmit").attr("data-id", "0");
            //    $("#modalAddNew").modal("show");
            //});

            //$("#endDate").change(function () {
            //    $("#duration").val(getDuration());
            //});

            //$("#startDate").change(function () {
            //    $("#duration").val(getDuration());
            //});

            //$(document).on("click", "#btnSubmit", function () {
            //    //var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            //    if ($("#title").val() == "") {
            //        toastr.error("Title field cannot be empty");
            //        $("#title").focus();
            //        return;
            //    }
            //    if ($("#clients").val() == "select") {
            //        toastr.error("Please select a client");
            //        $("#clients").focus();
            //        return;
            //    }
            //    if ($("#details").val() == "") {
            //        toastr.error("Details field cannot be empty");
            //        $("#details").focus();
            //        return;
            //    }
            //    if ($("#startDate").val() == "") {
            //        toastr.error("Please select a start date");
            //        $("#startDate").focus();
            //        return;
            //    }
            //    if ($("#endDate").val() == "") {
            //        toastr.error("Please select an end date");
            //        $("#endDate").focus();
            //        return;
            //    }

            //    var startDate = new Date($("#startDate").val());
            //    var endDate = new Date($("#endDate").val());

            //    if (endDate < startDate) {
            //        toastr.error("End date cannot be less than start date");
            //        $("#endDate").focus();
            //        return;
            //    }
            //    if ($("#type").val() == "") {
            //        toastr.error("Type field cannot be empty");
            //        $("#type").focus();
            //        return;
            //    }
            //    var id = $("#btnSubmit").attr("data-id");
            //    var url = localStorage.getItem("ApiLink") + "api/upcoming_jobs";
            //    var method = "POST";
            //    var successMsg = "Job has been added successfully";
            //    if (id != 0) {
            //        url = localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id;
            //        method = "PUT";
            //        successMsg = "Job details has been updated successfully";
            //    }
            //    $.ajax({
            //        url: url,
            //        data: {
            //            "job_title": $("#title").val(),
            //            "job_details": $("#details").val(),
            //            "job_start_date": $("#startDate").val(),
            //            "job_end_date": $("#endDate").val(),
            //            "job_duration": $("#duration").val(),
            //            "job_type": $("#type").val(),
            //            "job_shift": $("#shift").val(),
            //            "client_id": $("#clients").val(),
            //            "job_status": "upcoming",
            //        },
            //        async: false,
            //        method: method,
            //        success: function () {
            //            //$("#modalAddNew").modal("hide");
            //            toastr.success(successMsg);
            //            getJobsData();
            //        },
            //        error: function (jqXHR, exception) {
            //            swal({
            //                icon: 'error',
            //                title: 'Oops...',
            //                text: exception,
            //                timer: 1800
            //            });
            //        }
            //    });
            //});

            //$(document).on("click", "#btnEdit", function () {
            //    var id = $(this).attr("data-id");
            //    $.ajax({
            //        url: localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id,
            //        async: false,
            //        method: 'GET',
            //        success: function (data) {
            //            //var date = new Date(data.job_start_date);
            //            $("#title").val(data.job_title);
            //            $("#clients").val(data.client_id);
            //            $("#details").val(data.job_details);
            //            $("#startDate").val(data.job_start_date.split("T")[0]);
            //            $("#endDate").val(data.job_end_date.split("T")[0]);
            //            $("#duration").val(data.job_duration);
            //            $("#type").val(data.job_type);
            //            $("#shift").val(data.job_shift);
            //            $("addNewTitle").text("Update Job");
            //            $("#clients").attr("disabled", true);
            //            $("#btnSubmit").text("Update");
            //            $("#btnSubmit").attr("data-id", id);
            //            $("#modalAddNew").modal("show");
            //        },
            //        error: function (jqXHR, exception) {
            //            swal({
            //                icon: 'error',
            //                title: 'Oops...',
            //                text: exception,
            //                timer: 1800
            //            });
            //        }
            //    });
            //});

            //$(document).on("click", "#btnDelete", function () {
            //    swal({
            //        title: "Are you sure?",
            //        icon: "warning",
            //        buttons: ["No, Cancel it", "Yes, I am sure"],
            //        dangerMode: true,
            //    })
            //        .then((willDelete) => {
            //            if (willDelete) {
            //                var id = $(this).attr("data-id");
            //                $.ajax({
            //                    url: localStorage.getItem("ApiLink") + "api/upcoming_jobs/" + id,
            //                    async: false,
            //                    method: 'DELETE',
            //                    success: function (response) {
            //                        toastr.success("Admin has been removed successfully");
            //                        getJobsData();
            //                    },
            //                    error: function (jqXHR, exception) {
            //                        swal({
            //                            icon: 'error',
            //                            title: 'Oops...',
            //                            text: exception,
            //                            timer: 1800
            //                        });
            //                    }
            //                });
            //            }
            //        });
            //});

            $(document).on("click", "#btnViewLabors", function () {
                $("#assignNewLabor").attr("data-shift", $(this).closest("tr").find("td:eq(4)").text());
                $("#assignNewLabor").attr("data-job-id", $(this).attr("data-id"));
                getLabors($(this).attr("data-id"));
                $("#modalViewLabors").modal("show");
            });

            $(document).on("click", "#assignNewLabor", function () {
                var job_id = $(this).attr("data-job-id");
                var shift = $(this).attr("data-shift");
                $("#btnAddLabor").hide();
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/unassigned_employees/" + shift,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        if (data.length != 0) {
                            $("#btnAddLabor").show();
                            $("#rowLaborsList").empty();
                            $(data).each(function (index, value) {
                                $("#rowLaborsList").append("<tr><td>" + (index + 1) + "</td><td>" + value.name + "</td><td><a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a></td><td><input type='checkbox' class='checkbox' data-id='" + value.id + "' data-job-id='" + job_id + "'/></td></tr>");
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
