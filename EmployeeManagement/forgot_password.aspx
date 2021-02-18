<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="EmployeeManagement.forgot_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password | Work Permit</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />

    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>

        if (localStorage.getItem("login_details") != undefined || localStorage.getItem("login_details") != null) {
            window.location.replace("index.aspx");
        }
    </script>
</head>
<body>
    <div class="auth-box" style="max-height: 400px; width: 500px !important; margin-top: 10%;">
        <div class="content container">
            <div class="header">
                <div class="logo text-center">
                    <h3>Work Permit</h3>
                </div>

                <p class="lead">Reset Password</p>
            </div>
            <div class="alert" style="display: none"></div>
            <div class="form-group">
                <label class="control-label sr-only">Email</label>
                <input type="email" id="email" class="form-control" placeholder="Email" />
            </div>
            <div class="form-group">
                <label class="control-label sr-only">Login as</label>
                <select id="type" class="form-control">
                    <option value="select">Select account type</option>
                    <option value="admin">Admin</option>
                    <option value="employee">Employee</option>
                    <option value="client">Client</option>
                </select>
            </div>
            <button type="button" class="btn btn-success btn-lg btn-block">Reset Password</button>
            <div class="bottom col-lg-12" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-lg-6 text-left">
                        <i class="fa fa-arrow-left"></i><a href="login.aspx">Back to login page</a>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#email").focus();

            function generate_password() {
                var password = "";
                var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&";
                for (var i = 0; i < 8; i++) {
                    password += possible.charAt(Math.floor(Math.random() * possible.length));
                }
                return password;
            }

            $(document).on("click", ".btn-success", function () {
                $(".alert").attr("class", "alert");
                $(".alert").hide(200);
                if ($("#email").val() == "") {
                    $(".alert").attr("class", "alert alert-danger");
                    $(".alert").text("Email field is empty");
                    $(".alert").show(200);
                    $("#email").focus();
                    return;
                }

                if ($("#type").val() == "select") {
                    $(".alert").attr("class", "alert alert-danger");
                    $(".alert").text("Please select account type");
                    $(".alert").show(200);
                    $("#type").focus();
                    return;
                }
                var url = "check_admin_email";
                if ($("#type").val() == "employee") {
                    url = "check_employee_email";
                }
                if ($("#type").val() == "client") {
                    url = "api/check_client_email";
                }

                $.ajax({
                    url: localStorage.getItem("ApiLink") + url,
                    async: false,
                    method: 'GET',
                    data: {
                        email: $("#email").val()
                    },
                    success: function (response) {
                        var new_password = generate_password();
                        var EmailBody = "<h4>Your new password is <h3>" + new_password + "</h3></h4>";
                        var EmailAddress = $("#email").val();
                        var Subject = "Reset Password";
                        $.ajax({
                            url: localStorage.getItem("ApiLink") + "api/send_email",
                            async: false,
                            method: 'GET',
                            data: {
                                EmailBody: EmailBody,
                                EmailAddress: EmailAddress,
                                Subject: Subject,
                            },
                            success: function (response) {
                                var type = $("#type").val();
                                var url = localStorage.getItem("ApiLink") + "api/change_admin_password";
                                if (type == "client") {
                                    url = localStorage.getItem("ApiLink") + "api/change_client_password";
                                }
                                else if (type == "employee") {
                                    url = localStorage.getItem("ApiLink") + "api/change_employee_password";
                                }
                                $.ajax({
                                    url: url,
                                    async: false,
                                    method: 'PUT',
                                    data: {
                                        "email": $("#email").val(),
                                        "password": new_password
                                    },
                                    success: function (response) {
                                        $(".alert").attr("class", "alert alert-success");
                                        $(".alert").text("Your new password has been sent to your email address");
                                        $(".alert").show(200);
                                    },
                                    error: function (jqXHR, exception) {
                                        $(".alert").attr("class", "alert alert-danger");
                                        $(".alert").text("Oops! Someting went wrong");
                                        $(".alert").show(200);
                                        $("#email").focus();
                                    }
                                });
                            },
                            error: function (jqXHR, exception) {
                                $(".alert").attr("class", "alert alert-danger");
                                $(".alert").text("Oops! Someting went wrong");
                                $(".alert").show(200);
                                $("#email").focus();
                            }
                        });
                    },
                    error: function (jqXHR, exception) {
                        $(".alert").attr("class", "alert alert-danger");
                        $(".alert").text("Email is not registered");
                        $(".alert").show(200);
                        $("#email").focus();
                    }
                });
            });
        });
    </script>
</body>
</html>
