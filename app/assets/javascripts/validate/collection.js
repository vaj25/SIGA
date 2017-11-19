$( "form[class $=_collection]" ).validate({
    rules: {
        "collection[concepto]": {
            required: true,
            number: true
        },
        "collection[descripcion]": {
            required: true
        },
        "collection[activity_id]": {
            required: true
        }

    },
    messages: {
        "collection[concepto]": {
            required: "El concepto de la recaudación es obligatorio.",
            number: "El valor del recaudación debe ser numérico."
        },
        "collection[descripcion]": {
            required: "La descripción de la recaudación es obligatoria."
        },
        "collection[activity_id]": {
            required: "La actividad de la recaudación es obligatoria."
        }
    }
});