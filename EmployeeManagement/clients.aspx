<%@ Page Title="Clients" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="clients.aspx.cs" Inherits="EmployeeManagement.clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Client List</h3>
            </div>

            <div class="panel-body">
                <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"></i>New Client</button>
                </div>
                <div class="col-md-12 table-responsive" style="margin-top: 10px;">
                    <table id="example" class="table table-striped table-bordered table-hover" style="width: 100%;">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Contact</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="rowTable">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div id="modalAddNew" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #333d4d; color: #F3F5F8">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
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
                                <input type="text" readonly="readonly" class="form-control" id="password" >
                            </div>
                            <button class="col-sm-2 btn btn-info" id="generatePassword">Generate Password</button>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Contact:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="contact" placeholder="Enter Contact">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Address:</label>
                            <div class="col-sm-10">
                                <textarea rows="3" class="form-control" id="address" placeholder="Enter Address"></textarea>
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
            $('#example').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $(".nav-item:eq(7)").attr("class", "nav-item active");

            getClientsData();
            function getClientsData() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/clients",
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#rowTable").empty();
                        if (data.length != 0) {
                            $(data).each(function (index, value) {
                                $("#rowTable").append("<tr><td>" + (index + 1) + "</td><td>" + value.first_name + "</td><td>" + value.last_name + "</td><td>" + value.email + "</td><td>" + value.password + "</td><td>" + value.contact + "</td><td><a id='btnEdit' class='btn btn-xs btn-warning' data-id='" + value.client_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' class='btn btn-xs btn-danger ml-2' data-id='" + value.client_id + "'><i class='fa fa-trash'></i></a></td><tr>");
                            });
                        }
                        else {
                            $("#rowTable").append("<tr><td colspan='7' class='text-center'>No record found</td><tr>");
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

            $(document).on("click", "#btnShowModal", function () {
                $(".modal-title").text("Add New Client");
                $("#btnSubmit").text("Add");
                $("#firstName").val("");
                $("#lastName").val("");
                $("#email").val("");
                $("#password").val("");
                $("#contact").val("");
                $("#address").val("");
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

            $(document).on("click", "#btnSubmit", function () {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                console.log();
                if ($("#firstName").val() == "") {
                    toastr.error("First name field cannot be empty");
                    $("#firstName").focus();
                    return;
                }
                else if ($("#lastName").val() == "") {
                    toastr.error("Last name field cannot be empty");
                    $("#lastName").focus();
                    return;
                }
                else if ($("#email").val() == "") {
                    toastr.error("Email field cannot be empty");
                    $("#email").focus();
                    return;
                }
                else if (!regex.test($("#email").val())) {
                    toastr.error("Invalid Email Address");
                    $("#email").focus();
                    return;
                }
                else if ($("#password").val() == "") {
                    toastr.error("Password field cannot be empty");
                    $("#password").focus();
                    return;
                }
                else if ($("#contact").val() == "") {
                    toastr.error("Contact field cannot be empty");
                    $("#contact").focus();
                    return;
                }
                else if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    $("#address").focus();
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
                $.ajax({
                    url: url,
                    data: {
                        "first_name": $("#firstName").val(),
                        "last_name": $("#lastName").val(),
                        "email": $("#email").val(),
                        "password": $("#password").val(),
                        "contact": $("#contact").val(),
                        "address": $("#address").val(),
                    },
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
                        $("#contact").val(data.contact);
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
