$(document).ready(function () {
    "use strict";
    $("#submit").click(function () {

        var username = $("#username").val(), password = $("#password").val(), tapel = $("#tapel").val(), smt = $("#smt").val();

        if ((username === "") || (password === "")) {
            $("#errors-wrap").html("<div class=\"alert alert-danger alert-dismissable\" role=\"alert\"><h3 class=\"alert-heading font-size-h4 font-w400\">Error</h3><p class=\"mb-0\">Nama Pengguna atau Kata Sandi tidak boleh kosong!</p></div>");
        } else {
            $.ajax({
                type: "POST",
                url: "checklogin.php",
                data: "username=" + username + "&password=" + password + "&tapel=" + tapel + "&smt=" + smt,
                dataType: 'JSON',
                success: function (html) {
                    //console.log(html.response + ' ' + html.username+ ' ' + html.lokasi);
                    if (html.response === 'true') {
                        $("#errors-wrap").html("<div class=\"alert alert-success alert-dismissable\" role=\"alert\"><h3 class=\"alert-heading font-size-h4 font-w400\">Sukses</h3><p class=\"mb-0\">Tunggu sebentar.... Anda akan dialihkan ke Halaman Admin</p></div>");
						$("#login-form").hide();
						setTimeout(function () {
							location.href="../";
						},3000);
						return html.username;
                    } else {
                        $("#errors-wrap").html("<div class=\"alert alert-info alert-dismissable\" role=\"alert\"><p class=\"mb-0\">"+html.response+"<br/><a class=\"alert-link\" href=\"./\">Coba Lagi</a></p></div>");
						//$("#login-form").show();
                    }
                },
                error: function (textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log(errorThrown);
                },
                beforeSend: function () {
                    $("#errors-wrap").html('<div class="spinner-grow spinner-grow text-primary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-secondary" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-success" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-danger" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-warning" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-info" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-light" role="status"><span class="sr-only">Loading...</span></div><div class="spinner-grow spinner-grow text-dark" role="status"><span class="sr-only">Loading...</span></div>');
					$("#login-form").hide();
                }
            });
        }
        return false;
    });
});