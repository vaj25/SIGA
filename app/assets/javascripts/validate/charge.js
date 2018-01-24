$( "form[class $=_charge]" ).validate({
    rules: {
        "activity[nombre]": {
            required: true
        },
        "activity[descripcion]": {
            required: true
        },
    },
    messages: {
        "activity[nombre]": {
            required: "El nombre es obligatorio."
        },
        "activity[descripcion]": {
            required: "La descripción es obligatoria"
        },
    }
});
