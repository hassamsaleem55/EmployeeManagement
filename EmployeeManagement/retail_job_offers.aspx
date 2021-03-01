<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="retail_job_offers.aspx.cs" Inherits="EmployeeManagement.retail_job_offers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table .btn-default {
            color: #d9534f !important;
            border: 0.5px solid #d9534f !important;
        }

            table .btn-default:hover {
                color: #fff !important;
                border: 0.5px solid #d9534f !important;
                background-color: #c9302c !important;
            }

        table #btnCloseJob {
            margin-left: 3px;
        }
    </style>
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Retail Job Offers</h3>
            </div>
            <div class="panel-body">

                <ul class="nav nav-pills nav-justified">
                    <li class="active"><a data-toggle="tab" class="new" href="#new">New</a></li>
                    <li><a data-toggle="tab" class="closed" href="#closed">Closed</a></li>
                </ul>

                <div class="tab-content">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="new" class="tab-pane fade in active">
                                <div class="col-md-12">
                                    <button id="btnShowModal" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i>New Job Offer</button>
                                </div>
                                <div class="col-md-12 table-responsive" style="margin-top: 15px;">
                                </div>
                            </div>
                            <div id="closed" class="tab-pane fade" hidden="hidden">
                                <div class="table-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="modalAddNew" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="addNewTitle">Add New Job Offer</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-3">Title:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="title" placeholder="Enter Title">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Details:</label>
                            <div class="col-sm-9">
                                <textarea rows="3" class="form-control" id="details" placeholder="Enter Details"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Last Date to Apply:</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="endDate">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Job shift:</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="shift">
                                    <option value="Morning">Morning</option>
                                    <option value="Afternoon">Afternoon</option>
                                    <option value="Night">Night</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">Location</label>
                            <div class="col-sm-9">
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
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobOffers").attr("class", "collapsed active");
            $(".nav-item:eq(11)").attr("class", "nav-item active");
            $("#job_offers").attr("class", "");
            $("#endDate").attr('min', formatDate(new Date()));
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


            getNewJobOffers();
            function getNewJobOffers() {
                $("#new .table-responsive").html('<table class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Last Date</th><th>Shift</th><th>Location</th><th>Details</th><th class="text-center">Actions</th></tr></thead></table>');
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/retail_job_offers_new",
                    async: false,
                    method: 'GET',
                    success: function (data) {

                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": index + 1,
                                "title": value.job_title,
                                "last_date": getFormatedDate(new Date(value.job_last_date)),
                                "shift": value.job_shift,
                                "location": value.job_location,
                                "details": "<a id='btnViewDetails' style='cursor: pointer;' data-details='" + value.job_details + "'>View</a>",
                                "actions": "<div class='text-center'><a id='btnDeleteJob' class='btn btn-xs btn-default' data-id='" + value.job_offer_id + "'><i class='fa fa-trash'></i></a><a id='btnCloseJob' class='btn btn-xs btn-default' data-id='" + value.job_offer_id + "'>Close Job</a></div>"
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

                $('#new table').DataTable({
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

            function getClosedJobOffers() {
                $("#closed .table-responsive").html('<table class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Title</th><th>Last Date</th><th>Shift</th><th>Location</th><th>Details</th></tr></thead></table>');
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/retail_job_offers_closed",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": index + 1,
                                "title": value.job_title,
                                "last_date": getFormatedDate(new Date(value.job_last_date)),
                                "shift": value.job_shift,
                                "location": value.job_location,
                                "details": "<a id='btnViewDetails' style='cursor: pointer;' data-details='" + value.job_details + "'>View</a>",
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

                $('#closed table').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "title" },
                        { "data": "last_date" },
                        { "data": "shift" },
                        { "data": "location" },
                        { "data": "details" },
                    ]
                });
            }
            $(document).on("click", ".new", function () {
                $("#new").show();
                $("#closed").hide();
                getNewJobOffers();
            });

            $(document).on("click", ".closed", function () {
                $("#closed").show();
                $("#new").hide();
                getClosedJobOffers();
            });

            $(document).on("click", "#btnShowModal", function () {
                $("#modalAddNew").modal("show");
            });

            $(document).on("click", "#btnSubmit", function () {
                var error = false;

                if ($("#title").val() == "") {
                    toastr.error("Title field cannot be empty");
                    error = true;
                }
                if ($("#details").val() == "") {
                    toastr.error("Details field cannot be empty");
                    error = true;
                }
                if ($("#endDate").val() == "") {
                    toastr.error("Please select the last date to apply");
                    error = true;
                }
                if ($("#location").val() == "select") {
                    toastr.error("Please select any location");
                    error = true;
                }
                if (error) {
                    return false;
                }

                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/job_offers",
                    data: {
                        "job_title": $("#title").val(),
                        "job_details": escape($("#details").val()),
                        "job_last_date": $("#endDate").val(),
                        "job_type": "retail",
                        "job_shift": $("#shift").val(),
                        "job_location": $("#location").val(),
                        "job_status": "open",
                        "created_at": formatDate(new Date())
                    },
                    async: false,
                    method: "POST",
                    success: function () {
                        $("#modalAddNew").modal("hide");
                        toastr.success("Job Offer has been added successfully");
                        getNewJobOffers();
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
                $("#modalViewDetails #viewDetailsTitle").html($(this).closest("tr").find("td:eq(1)").text() + "'s Details");
                $("#modalViewDetails #viewDetailsBody").html(unescape($(this).attr("data-details")));
                $("#modalViewDetails").modal("show");
            });

            $(document).on("click", "#btnCloseJob", function () {
                swal({
                    title: "Are you sure you want to close " + $(this).closest("tr").find("td:eq(1)").text() + " ?",
                    icon: "warning",
                    buttons: ["No, Cancel it", "Yes, I am sure"],
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).attr("data-id");
                            $.ajax({
                                url: localStorage.getItem("ApiLink") + "api/close_job_offer",
                                data: {
                                    "job_offer_id": id
                                },
                                async: false,
                                method: "PUT",
                                success: function () {
                                    toastr.success("Job Offer has been closed");
                                    getNewJobOffers();
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

            $(document).on("click", "#btnDeleteJob", function () {
                swal({
                    title: "Are you sure you want to delete " + $(this).closest("tr").find("td:eq(1)").text() + " ?",
                    icon: "warning",
                    buttons: ["No, Cancel it", "Yes, I am sure"],
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            var id = $(this).attr("data-id");
                            $.ajax({
                                url: localStorage.getItem("ApiLink") + "api/delete_job_offer",
                                data: {
                                    "job_offer_id": id
                                },
                                async: false,
                                method: "DELETE",
                                success: function () {
                                    toastr.success("Job Offer has been deleted successfully");
                                    getNewJobOffers();
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

        });
    </script>
</asp:Content>
