<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EmployeeManagement.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | Work Permit</title>
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
    <div id="wrapper">
        <div class="vertical-align-wrap">
            <div class="vertical-align-middle">
                <div class="auth-box ">
                    <div class="left">
                        <div class="content">
                            <div class="header">
                                <div class="logo text-center">
                                    <%--<img src="assets/img/logo-dark.png" alt="Klorofil Logo">--%>
                                    <h3>Work Permit</h3>
                                </div>

                                <p class="lead">Login to your account</p>
                            </div>
                            <%--<form class="form-auth-small" action="index.php">--%>
                            <div class="form-group">
                                <label class="control-label sr-only">Email</label>
                                <input type="email" id="email" class="form-control" placeholder="Email" />
                            </div>
                            <div class="form-group">
                                <label class="control-label sr-only">Password</label>
                                <input type="password" id="pass" class="form-control" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <label class="control-label sr-only">Login as</label>
                                <select id="type" class="form-control">
                                    <%--<option value="select">Login as</option>--%>
                                    <option value="admin">Admin</option>
                                    <option value="employee">Employee</option>
                                    <option value="client">Client</option>
                                </select>
                            </div>
                            <%--<div class="form-group clearfix">
                                    <label class="fancy-checkbox element-left">
                                        <input type="checkbox">
                                        <span>Remember me</span>
                                    </label>
                                </div>--%>
                            <button type="button" class="btn btn-success btn-lg btn-block">LOGIN</button>
                            <div style="margin-top: 50px;">
                                <i class="fa fa-arrow-left"></i><a href="home/index.html"> Back to home page</a>
                            </div>
                            <%--<div class="bottom">
                                    <span class="helper-text"><i class="fa fa-lock"></i><a href="#"> Forgot password?</a></span>
                                </div>--%>
                            <%--</form>--%>
                            
                        </div>
                    </div>
                    <div class="right">
                        <div class="overlay">
                            <img src="https://www.workpermit.pt/public/workpermit/images/workpermit-inicio.jpg" style="height: 100%; max-width: 100%""/>
                        </div>
                        <div class="content text">
                            <%--<h1 class="heading">Free Bootstrap dashboard template</h1>
                            <p>by The Develovers</p>--%>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(document).on("click", ".btn-success", function () {
                $.ajax({
                    url: localStorage.getItem("ApiLink") + "api/login",
                    async: false,
                    method: 'GET',
                    data: {
                        "email": $("#email").val(),
                        "pass": $("#pass").val(),
                        "type": $("#type").val()
                    },
                    success: function (data) {
                        if (data.length == 0) {
                            toastr.error("Invalid credentials");
                            return;
                        }
                        localStorage.setItem("login_details", JSON.stringify(data));
                        window.location.replace("index.aspx");
                    },
                    error: function (jqXHR, exception) {
                        toastr.error("Something went wrong");
                    }
                });
            });
        });
    </script>
</body>
</html>
