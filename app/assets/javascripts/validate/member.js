$( "form[class $=_member]" ).validate({
    rules: {
        "activity[primer_nombre]": {
            required: true
        },
        "activity[primer_apellido]": {
            required: true
        },
        "member[dui]": {
            required: true,
        },
    },
    messages: {
        "activity[primer_nombre]": {
            required: "El primer nombre es obligatorio."
        },
        "activity[primer_apellido]": {
            required: "El primer apellido es obligatorio"
        },
        "activity[dui]": {
            required: "El dui es obligatorio"
        },
    }
});
