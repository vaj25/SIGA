$( "form[class $=_detail_income]" ).validate({
    rules: {
        "detail_income[tree_id]": {
            required: true
        },
        "detail_income[cantidad]": {
            required: true,
            number: true
        },
        "detail_income[precio]": {
            required: true,
            number: true
        }

    },
    messages: {
        "detail_income[tree_id]": {
            required: "El árbol del ingreso es obligatoria."
        },
        "detail_income[cantidad]": {
            required: "La cantidad del ingreso es obligatoria.",
            number: "La cantidad debe ser numérica."
        },
        "detail_income[precio]": {
            required: "El precio del ingreso es obligatorio.",
            number: "El precio debe ser numérico."
        }
    }
});