$( "form[class $=_general_meeting]" ).validate({
    rules: {
        "general_meeting[num_asistentes]": {
            required: true
        },
        "general_meeting[activity_id]": {
            required: true
        },

    },
    messages: {
        "general_meeting[num_asistentes]": {
            required: "Cantidad de asistentes obligatorio"
        },

        "general_meeting[activity_id]": {
            required: "Actividad obligatoria."
        },
    }
});
