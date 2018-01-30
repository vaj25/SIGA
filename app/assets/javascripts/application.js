// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery-1.11.3.min
//= require jquery.validate.min
//= require additional-methods.js
//= require semantic.min


$(document).on('turbolinks:load' ,function () {
    $("nav ul li span").click(function () {
        $(this).siblings("ul").toggle(50);
    });

    $('.ui.checkbox').checkbox();

    $(".pagination").addClass("ui right floated pagination menu");
    $(".pagination a").each(function () {
        $(this).addClass("item");
    });

    $(".pagination span").each(function () {
        $(this).addClass("item");
    });

    $(".pagination em").each(function () {
        $(this).addClass("item");
    });

    var message = document.body.querySelector('.message');

    if ( $.contains( document.body, message ) ) {
        
        $(".message .close").on('click', function () {
            $(this)
                .closest('.message')
                .transition('slide')
        });

        setTimeout( function () {
            $(".message").slideUp();
        }, 3000);

    }

});
