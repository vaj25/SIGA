$( "form[class $=_meeting]" ).validate({
    rules: {
        "meeting[descripcion]": {
            required: true
        },
        "meeting[activity_id]": {
            required: true
        },

    },
    messages: {
        "meeting[descripcion": {
            required: "Descripción obligatoria"
        },

        "meeting[activity_id]": {
            required: "Actividad obligatoria."
        },
    }
});
