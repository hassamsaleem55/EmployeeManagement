<%@ Page Title="Admins" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admins.aspx.cs" Inherits="EmployeeManagement.admins" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Admins List</h3>
            </div>

            <div class="panel-body">
                <div class="col-md-12">
                    <button id="btnShowModal" type="button" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"></i>  New Admin</button>
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
                    <h4 class="modal-title">Add New Admin</h4>
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
            //$('#example').DataTable();
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $(".nav-item:eq(5)").attr("class", "nav-item active");
            getadminsData();
            function getadminsData()
            {
                var arrData = [];
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/admins",
                    async: false,
                    method: 'GET',
                    success: function (data) {

                        $(data).each(function (index, value) {
                            var objData = {
                                "sr": index + 1,
                                "first_name": value.first_name,
                                "last_name": value.last_name,
                                "email": value.email,
                                "password": value.password,
                                "contact": value.contact,
                                "actions": "<a id='btnEdit' class='btn btn-xs btn-warning' data-id='" + value.admin_id + "'><i class='fa fa-pencil'></i></a><a id='btnDelete' class='btn btn-xs btn-danger ml-2' data-id='" + value.admin_id + "'><i class='fa fa-trash'></i></a>"
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
                $(".table-responsive").empty();
                $(".table-responsive").html('<table id="example" class="table table-striped table-bordered table-hover" style="width: 100%;"><thead><tr><th>#</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Password</th><th>Contact</th><th>Actions</th></tr></thead></table>');
                $('#example').DataTable({
                    "data": arrData,
                    "columns": [
                        { "data": "sr" },
                        { "data": "first_name" },
                        { "data": "last_name" },
                        { "data": "email" },
                        { "data": "password" },
                        { "data": "contact" },
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

            $(document).on("keypress", "#contact",
                function (
                    e) {
                    accept_numbers_only(e)
                });

            $(document).on("click", "#btnShowModal", function () {
                $(".modal-title").text("Add New Admin");
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
                var error = false;
                if ($("#firstName").val() == "") {
                    toastr.error("First name field cannot be empty");
                    ////$("#firstName").focus();
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
                 if ($("#contact").val() == "") {
                    toastr.error("Contact field cannot be empty");
                    //$("#contact").focus();
                    //return;
                    error = true;
                }
                 if ($("#address").val() == "") {
                    toastr.error("Address field cannot be empty");
                    //$("#address").focus();
                    //return;
                    error = true;
                }
                if (error) {
                    return;
                }
                var id = $("#btnSubmit").attr("data-id");
                var url = localStorage.getItem("ApiLink") + "api/admins";
                var method = "POST";
                var successMsg = "Admin has been added successfully";
                if (id != 0) {
                    url = localStorage.getItem("ApiLink") + "api/admins/" + id;
                    method = "PUT";
                    successMsg = "Admin details has been updated successfully";
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
                        getadminsData();
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
                    url: localStorage.getItem("ApiLink") + "api/admins/" + id,
                    async: false,
                    method: 'GET',
                    success: function (data) {
                        $("#firstName").val(data.first_name);
                        $("#lastName").val(data.last_name);
                        $("#email").val(data.email);
                        $("#password").val(data.password);
                        $("#contact").val(data.contact);
                        $("#address").val(data.address);

                        $(".modal-title").text("Update Admin");
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
                                url: localStorage.getItem("ApiLink") + "api/admins/" + id,
                                async: false,
                                method: 'DELETE',
                                success: function (response) {
                                    toastr.success("Admin has been removed successfully");
                                    getadminsData();
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
