<%@ Page Title="Clients" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="clients.aspx.cs" Inherits="EmployeeManagement.clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        a {
            cursor: pointer;
        }
    </style>
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Client List</h3>
            </div>

            <div class="panel-body">
                <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-plus"></i>New Client</button>
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
                    <button type="button" class="close text-danger" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add New Client</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">First Name:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="firstName" placeholder="Enter First Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Last Name:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email" placeholder="Enter Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Password:</label>
                            <div class="col-sm-7">
                                <input type="text" readonly="readonly" class="form-control" id="password">
                            </div>
                            <button class="col-sm-2 btn btn-info" id="generatePassword">Generate Password</button>
                        </div>
                        <%-- <div class="form-group">
                            <label class="control-label col-sm-2">Contact:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="contact" placeholder="Enter Contact">
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Address:</label>
                            <div class="col-sm-10">
                                <textarea rows="3" class="form-control" id="address" placeholder="Enter Address"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading"><strong>Contact Details</strong></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Contact Name</th>
                                            <th>Contact Number</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <input type="text" class="form-control contact_name" placeholder="Enter Contact Name" />
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon">+351</span>
                                                    <input type="text" class="form-control contact_number" placeholder="Enter Contact Number" />
                                                </div>
                                            </td>
                                            <td>
                                                <a class="text-danger text-center"><i class="fa fa-times"></i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <%--<tfoot>
                                        <tr>
                                            <td colspan="4">
                                                <div class="text-right">
                                                    <button class="btn btn-sm btn-success">Add New Contact</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tfoot>--%>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="text-right">
                                <button class="btn btn-sm btn-success">Add New Contact</button>
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

    <script>
        $(document).ready(function () {
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $(".nav-item:eq(8)").attr("class", "nav-item active");

            getClientsData();
            function getClientsData() {
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/clients",
                    async: false,
                    method: 'GET',
                    success: function (data) {

                        $(data).each(function (index, value) {
                            var contact = "";
                            $(value.contact.split(",")).each(function (ind, val) {
                                if ((ind + 1) != value.contact.split(",").length) {
                                    contact += "<div class='col-lg-12 row text-center'><div class='col-lg-6'>" + val.split(":")[0] + "</div><div class='col-lg-6'>(+351) " +  + val.split(":")[1] + "</div></div>";
                                }
                            });
                            var objData = {
                                "sr": index + 1,
                                "client_name": value.first_name + " " + value.last_name,
                                "contact_details": contact,
                                "actions": "<div class='text-center'><a id='btnEdit' class='btn btn-xs btn-warning' data-id='" + value.client_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' class='btn btn-xs btn-danger ml-2' data-id='" + value.client_id + "'><i class='fa fa-trash'></i></a></div>"
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
                $(".main .table-responsive").empty();
                $(".main .table-responsive").html('<table id="example" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>Client Name</th><th width="400" class="text-center">Contact Details</th><th class="text-center">Actions</th></tr></thead></table>');

                $('#example').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "client_name" },
                        { "data": "contact_details" },
                        { "data": "actions" }
                    ]
                });
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

            $(document).on("keypress", "#modalAddNew tbody .form-control:eq(0)",
                function (
                    e) {
                    accept_letters_only(e);
                });

            $(document).on("keypress", "#modalAddNew tbody .form-control:eq(1)",
                function (
                    e) {
                    if ($(this).val().length == 9) {
                        e.preventDefault();
                        return;
                    }
                    accept_numbers_only(e);
                });

            $(document).on("click", "#btnShowModal", function () {
                $(".modal-title").text("Add New Client");
                $("#btnSubmit").text("Add");
                $(".form-control").val("");
                $("#btnSubmit").attr("data-id", "0");
                $("#modalAddNew tbody tr").each(function (index, value) {
                    if (index != 0) {
                        $(this).remove();
                    }
                });
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

            $(document).on("click", ".panel-footer .btn-success", function () {
                var element = $(this);
                var len = element.closest(".panel").find("tbody tr").length;
                element.closest(".panel").find("tbody").append(
                    '<tr style="display:none"><td>' + (len + 1) +
                    '</td><td><input type="text" class="form-control contact_name" placeholder="Enter Contact Name"></td><td><div class="input-group"><span class="input-group-addon">+351</span><input type="text" class="form-control contact_number" placeholder="Enter Contact Number" /></div></td><td><a class="text-danger text-center"><i class="fa fa-times"></i></a></td></tr>'
                );
                element.closest(".panel").find("tbody tr").last().show(600);
            });

            $(document).on("click", "#modalAddNew tbody .text-danger", function () {
                var element = $(this);
                var len = element.closest("table").find("tbody tr").length;
                if (len > 1) {
                    element.closest("tr").hide(400);
                    setTimeout(function () {
                        element.closest("tr").remove();

                        $("#modalAddNew tr").each(function (index, value) {
                            $(this).find("td:eq(0)").html(index);
                        });
                    }, 500);
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

                if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    //$("#address").focus();
                    //return;
                    error = true;
                }

                $("#modalAddNew tbody tr").each(function () {
                    if ($(this).find(".contact_name").val() == "") {
                        toastr.error("Contact name field cannot be empty");
                        //$("#contact").focus();
                        //return;
                        error = true;
                    }

                    if ($(this).find(".contact_number").val() == "") {
                        toastr.error("Contact number field cannot be empty");
                        //$("#contact").focus();
                        //return;
                        error = true;
                    }
                });

                if (error) {
                    return;
                }
                var id = $("#btnSubmit").attr("data-id");
                var url = localStorage.getItem("ApiLink") + "api/clients";
                var method = "POST";
                var successMsg = "Client has been added successfully";
                if (id != 0) {
                    url = localStorage.getItem("ApiLink") + "api/clients/" + id;
                    method = "PUT";
                    successMsg = "Client details has been updated successfully";
                }

                var contact = "";

                $("#modalAddNew tbody tr").each(function () {
                    contact += $(this).find(".contact_name").val() + ":" + $(this).find(".contact_number").val() + ",";
                });

                var data = {
                    "first_name": $("#firstName").val(),
                    "last_name": $("#lastName").val(),
                    "email": $("#email").val(),
                    "password": $("#password").val(),
                    "address": $("#address").val(),
                    "contact": contact,
                };

                $.ajax({
                    url: url,
                    data: data,
                    async: false,
                    method: method,
                    success: function () {
                        $("#modalAddNew").modal("hide");
                        toastr.success(successMsg);
                        getClientsData();
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
                    url: localStorage.getItem("ApiLink") + "api/clients/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#firstName").val(data.first_name);
                        $("#lastName").val(data.last_name);
                        $("#email").val(data.email);
                        $("#password").val(data.password);
                        $("#modalAddNew .panel").find("tbody").empty();
                        $(data.contact.split(",")).each(function (index, value) {
                            if ((index + 1) != data.contact.split(",").length) {
                                $("#modalAddNew .panel").find("tbody").append(
                                    '<tr><th scope="row">' + (index + 1) +
                                    '</th><td><input type="text" class="form-control contact_name" placeholder="Enter Contact Name" value="' + value.split(":")[0] + '"></td><td><input type="text" class="form-control contact_number" placeholder="Enter Contact Number" value="' + value.split(":")[1] + '"></td><td><a class="text-danger text-center"><i class="fa fa-times"></i></a></td></tr>');
                            }
                        });
                        $("#address").val(data.address);

                        $(".modal-title").text("Update Client");
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
                                url: localStorage.getItem("ApiLink") + "api/clients/" + id,
                                async: false,
                                method: 'DELETE',
                                success: function (response) {
                                    toastr.success("Client has been removed successfully");
                                    getClientsData();
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
