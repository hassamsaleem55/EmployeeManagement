<%@ Page Title="Completed Jobs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="completed_jobs.aspx.cs" Inherits="EmployeeManagement.completed_jobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Completed Jobs List</h3>
            </div>
            <div class="panel-body">

                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                    <table id="tblJobs" class="table table-striped table-bordered table-hover" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Client Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Duration</th>
                                <th>Shift</th>
                                <th>Type</th>
                                <th>Labor</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody id="rowJobsTable">
                        </tbody>
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
                    <h4 class="modal-title">Labor's List</h4>
                </div>
                <div class="modal-body">
                    <div style="margin-top: 50px;">
                        <table id="tblLabors" class="table table-responsive table-striped table-bordered table-hover" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Employee Name</th>
                                    <th>Documents</th>
                                </tr>
                            </thead>
                            <tbody id="rowLabors">
                            </tbody>
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
            $(".nav-item:eq(1)").attr("class", "collapsed nav-item active");
            $(".nav-item:eq(4)").attr("class", "nav-item active");
            $("#subPages").attr("class", "");

            function getFormatedDate(value) {
                var date = new Date(value);
                return ((date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))) + '/' + ((date.getDate() > 9) ? date.getDate() : ('0' + date.getDate())) + '/' + date.getFullYear();
            }

            getJobsData();
            function getJobsData() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/completed_jobs",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#rowJobsTable").empty();
                        if (data.length != 0) {
                            $(data).each(function (index, value) {
                                $("#rowJobsTable").append("<tr><td>" + (index + 1) + "</td><td>" + value.job_title + "</td><td>" + value.client_name + "</td><td>" + getFormatedDate(value.job_start_date) + "</td><td>" + getFormatedDate(value.job_end_date) + "</td><td>" + value.job_duration + " days</td><td>" + value.job_shift + "</td><td>" + value.job_type + "</td><td><a id='btnViewLabors' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a></td><td><a id='btnViewDetails' style='cursor: pointer;' data-id='" + value.job_id + "'>View</a></td><tr>");
                            });
                        }
                        else {
                            $("#rowJobsTable").append("<tr><td colspan='11' class='text-center'>No record found</td><tr>");
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
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/assigned_employees/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#rowLabors").empty();
                        if (data.length != 0) {
                            $(data).each(function (index, value) {
                                $("#rowLabors").append("<tr><td>" + (index + 1) + "</td><td>" + value.name + "</td><td><a id='viewDocuments' style='cursor: pointer;' data-id='" + value.id + "'>view</a></td></tr>");
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

            $(document).on("click", "#btnViewLabors", function () {
                $("#assignNewLabor").attr("data-shift", $(this).closest("tr").find("td:eq(6)").text());
                $("#assignNewLabor").attr("data-job-id", $(this).attr("data-id"));
                getLabors($(this).attr("data-id"));
                $("#modalViewLabors").modal("show");
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
