<%@ Page Title="Industry Job Applications" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="industry_job_applications.aspx.cs" Inherits="EmployeeManagement.industry_job_applications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Industry Job Applications</h3>
            </div>
            <div class="panel-body">

                <ul class="nav nav-pills nav-justified">
                    <li class="active"><a data-toggle="tab" class="new" href="#new">New</a></li>
                    <li><a data-toggle="tab" class="approved" href="#approved">Approved</a></li>
                    <li><a data-toggle="tab" class="rejected" href="#rejected">Rejected</a></li>
                </ul>

                <div class="tab-content">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="new" class="tab-pane fade in active">
                                <div class="col-md-12 table-responsive">
                                </div>
                            </div>
                            <div id="approved" class="tab-pane fade" hidden="hidden">
                                <div class="col-md-12 table-responsive">
                                </div>
                            </div>
                            <div id="rejected" class="tab-pane fade" hidden="hidden">
                                <div class="col-md-12 table-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="modalViewDetails" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <table id="rowDetails" class="table table-responsive">
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
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

    <script>

        $(document).ready(function () {
            //$('#example').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobApplications").attr("class", "collapsed active");
            $(".nav-item:eq(12)").attr("class", "nav-item active");
            $("#job_applications").attr("class", "");

            getPendingApplicants();

            function getPendingApplicants() {
                $(".tab-pane").prop("hidden", true);
                $("#new").prop("hidden", false);
                $("#new .table-responsive").empty();
                $("#new .table-responsive").html('<table class="table table-striped table-bordered table-hover" ><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Sex</th><th>Contact</th><th>Details</th><th>Documents</th><th class="text-center">Actions</th></tr></thead></table>');
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/industry_job_applications_new",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": (index + 1),
                                "first_name": value.first_name,
                                "last_name": value.last_name,
                                "email": value.email,
                                "sex": value.sex,
                                "contact": "(+351) " + value.contact,
                                "details": "<a style='cursor: pointer;' class='viewDetails' data-id='" + value.applicant_id + "'>view</a>",
                                "documents": "<a style='cursor: pointer;' class='viewDocuments' data-id='" + value.applicant_id + "'>view</a>",
                                "actions": "<div class='text-center'><a style='margin-right: 2px;' class='btn btn-xs btn-success btnApprove' data-id='" + value.applicant_id + "'>Approve</a><a class='btn btn-xs btn-danger btnReject' data-id='" + value.applicant_id + "'>Reject</a></div>"
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

                $("#new table").DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "email" },
                        { "data": "sex" },
                        { "data": "contact" },
                        { "data": "details" },
                        { "data": "documents" },
                        { "data": "actions" }
                    ]
                });
            }

            function getApprovedApplicants() {
                $(".tab-pane").prop("hidden", true);
                $("#approved").prop("hidden", false);
                $("#approved .table-responsive").empty();
                $("#approved .table-responsive").html('<table class="table table-striped table-bordered table-hover" ><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Sex</th><th>Contact</th><th>Details</th><th>Documents</th></tr></thead></table>');
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/industry_job_applications_approved",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": (index + 1),
                                "first_name": value.first_name,
                                "last_name": value.last_name,
                                "email": value.email,
                                "sex": value.sex,
                                "contact": "(+351) " + value.contact,
                                "details": "<a style='cursor: pointer;' class='viewDetails' data-id='" + value.applicant_id + "'>view</a>",
                                "documents": "<a style='cursor: pointer;' class='viewDocuments' data-id='" + value.applicant_id + "'>view</a>",
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

                $("#approved table").DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "email" },
                        { "data": "sex" },
                        { "data": "contact" },
                        { "data": "details" },
                        { "data": "documents" },
                    ]
                });
            }

            function getRejectedApplicants() {
                $(".tab-pane").prop("hidden", true);
                $("#rejected").prop("hidden", false);
                $("#rejected .table-responsive").empty();
                $("#rejected .table-responsive").html('<table class="table table-striped table-bordered table-hover" ><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Sex</th><th>Contact</th><th>Details</th><th>Documents</th></tr></thead></table>');
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/industry_job_applications_rejected",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": (index + 1),
                                "first_name": value.first_name,
                                "last_name": value.last_name,
                                "email": value.email,
                                "sex": value.sex,
                                "contact": "(+351) " + value.contact,
                                "details": "<a style='cursor: pointer;' class='viewDetails' data-id='" + value.applicant_id + "'>view</a>",
                                "documents": "<a style='cursor: pointer;' class='viewDocuments' data-id='" + value.applicant_id + "'>view</a>",
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

                $("#rejected table").DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "email" },
                        { "data": "sex" },
                        { "data": "contact" },
                        { "data": "details" },
                        { "data": "documents" },
                    ]
                });
            }

            $(document).on("click", ".new", function () {
                getPendingApplicants();
            });

            $(document).on("click", ".approved", function () {

                getApprovedApplicants();
            });

            $(document).on("click", ".rejected", function () {
                getRejectedApplicants();
            });

            $(document).on("click", ".viewDetails", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_applicants/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#modalViewDetails").modal("show");
                        $(".modal-title").text(data.first_name + "'s Details");
                        $("#rowDetails").empty();
                        if (data.length == 0) {
                            $("#rowDetails").append("No Data Available");
                        }
                        else {
                            $("#rowDetails").append("<tr><td>First Name</td><td>" + data.first_name + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Last Name</td><td>" + data.last_name + "</td><tr>");
                            $("#rowDetails").append("<tr><td>DOB</td><td>" + data.dob + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Sex</td><td>" + data.sex + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Email</td><td>" + data.email + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Contact</td><td>" + data.contact + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Address</td><td>" + data.address + "</td><tr>");
                            $("#rowDetails").append("<tr><td>NIF Number</td><td>" + data.nif_number + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Nationality</td><td>" + data.nationality + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Passport Number</td><td>" + data.passport_number + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Passport Validity Year</td><td>" + data.passport_validity_year + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Medical Examination</td><td>" + data.medical_examination + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Examination Date</td><td>" + data.exam_date + "</td><tr>");
                            $("#rowDetails").append("<tr><td>Apply Date</td><td>" + data.apply_date + "</td><tr>");
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


            $(document).on("click", ".viewDocuments", function () {
                var id = $(this).attr("data-id");
                var count = 1;
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_applicants/" + id,
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

            $(document).on("click", ".btnApprove", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_applicants/" + $(this).attr("data-id"),
                    async: false,
                    method: 'PUT',
                    data: {
                        "status": "approved"
                    },
                    success: function (data) {
                        toastr.success("Applicant has been Approved");
                        getPendingApplicants();
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

            $(document).on("click", ".btnReject", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_applicants/" + $(this).attr("data-id"),
                    async: false,
                    method: 'PUT',
                    data: {
                        "status": "rejected"
                    },
                    success: function (data) {
                        toastr.success("Applicant has been Rejected");
                        getPendingApplicants();
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
