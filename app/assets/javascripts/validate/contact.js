$( "form[class $=_contact]" ).validate({
    rules: {
        "contact[nombre]": {
            required: true
        },
        "contact[celular]": {
            required: true
        },
        "contact[organizacion]": {
            required: true
        },

    },
    messages: {
        "contact[nombre]": {
            required: "El nombre es obligatorio"
        },

        "contact[celular]": {
            required: "El telefono celular es obligatorio."
        },
        "contact[organizacion]": {
            required: "La organización es obligatoria."
        },
    }
});
