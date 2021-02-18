<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="EmployeeManagement.settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main">
        <div class="panel">
            <div class="panel-heading">
                <h3>Settings</h3>
            </div>
            <div class="panel-body">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-1">
                            <h4>Email: </h4>
                        </div>
                        <div class="col-lg-11">
                            <p style="padding-top: 10px" id="email"></p>
                        </div>
                    </div>
                </div>
               <div class="col-lg-12" id="divChangePassword">
                    <div class="row">
                        <div class="col-lg-1">
                            <h4>Password: </h4>
                        </div>
                        <div class="col-lg-11">
                            <p style="padding-top: 10px"><a style="cursor: pointer;">Change Password</a></p>
                            
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="panel" id="panelChangePassword" style="display: none;">
                    <div class="panel-heading bg-primary">
                        <h4>Change Password</h4>
                    </div>
                    <div class="panel-body">

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-2">Old Password:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="old_password" placeholder="Enter Old Password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">New Password:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="new_password" placeholder="Enter New Password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-2">Confirm Password:</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="confirm_password" placeholder="Re-enter Password" />
                                </div>
                            </div>
                        </div>
                        
                        <button class="btn btn-success pull-right margin-top-30">Confirm</button>
                        <button class="btn btn-light pull-right margin-top-30" style="margin-right: 5px;">Cancel</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".nav-item:eq(0)").attr("class", "nav-item");
            $("#linkJobs").attr("class", "collapsed");
            $("#settings a").attr("class", "nav-item active");
            var password = "";
            $("#email").text(JSON.parse(localStorage.getItem("login_details"))[0].email);

            getPassword();
            function getPassword() {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/get_password",
                    async: false,
                    method: 'GET',
                    data: {
                        id: JSON.parse(localStorage.getItem("login_details"))[0].id,
                        type: JSON.parse(localStorage.getItem("login_details"))[0].type
                    },
                    success: function (data) {
                        password = data.password;
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
            $(document).on("click", "#divChangePassword a", function () {
                $("#panelChangePassword .form-control").val("");
                $("#panelChangePassword").show(400);
                $("#divChangePassword").hide();
                
            });

            $(document).on("click", "#panelChangePassword .btn-light", function () {
                $("#panelChangePassword").hide(400);
                $("#divChangePassword").show(400);
            });

            $(document).on("click", "#panelChangePassword .btn-success", function () {
                if ($("#old_password").val() == "") {
                    toastr.error("Old password field is empty");
                    $("#old_password").focus();
                    return;
                }
                if ($("#new_password").val() == "") {
                    toastr.error("New password field is empty");
                    $("#new_password").focus();
                    return;
                }
                if ($("#confirm_password").val() == "") {
                    toastr.error("Confirm password field is empty");
                    $("#confirm_password").focus();
                    return;
                }

                if ($("#old_password").val() != password) {
                    toastr.error("Old password is not correct");
                    $("#old_password").focus();
                    return;
                }

                if ($("#new_password").val() != $("#confirm_password").val()) {
                    toastr.error("Password are not same");
                    $("#confirm_password").focus();
                    return;
                }

                var id = JSON.parse(localStorage.getItem("login_details"))[0].id;
                var type = JSON.parse(localStorage.getItem("login_details"))[0].type;
                var url = localStorage.getItem("ApiLink") + "api/change_admin_password/" + id;
                if (type == "client") {
                    url = localStorage.getItem("ApiLink") + "api/change_client_password/" + id;
                }
                else if (type == "employee") {
                    url = localStorage.getItem("ApiLink") + "api/change_employee_password/" + id;
                }

                $.ajax({
                    url: url,
                    async: false,
                    method: 'PUT',
                    data: {
                        "password": $("#new_password").val()
                    },
                    success: function (data) {
                        toastr.success("Password has been changed");
                        $("#panelChangePassword .btn-light").click();
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
