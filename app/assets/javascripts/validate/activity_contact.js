$( "form[class $=_activity_contact]" ).validate({
    rules: {
        "activity_contact[contact_id]": {
            required: true
        },
    },
    messages: {
        "activity_contact[contact_id]": {
            required: "Seleccionar contacto es obligatorio"
        },
    }
});
