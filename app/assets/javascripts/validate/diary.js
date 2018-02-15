$( "form[class $=_diary]" ).validate({
    rules: {
        "diary[discusion]": {
            required: true
        },
    },
    messages: {
        "diary[discusion]": {
            required: "El punto a tratar es obligatorio."
        },
    }
});
