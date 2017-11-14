
$(document).ready(function () {
    $("nav ul li span").click(function () {
        $(this).siblings("ul").toggle(50);
    });
});