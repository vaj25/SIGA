$( "form[class $=_zone]" ).validate({
    rules: {
        "zone[nombre]": {
            required: true
        },
        "zone[area]": {
            required: true,
            number: true
        }

    },
    messages: {
        "zone[nombre]": {
            required: "El nombre de la zona es obligatorio."
        },
        "zone[area]": {
            required: "El area de la zona es obligatoria.",
            number: "El valor del área debe ser numérico."
        }
    }
});