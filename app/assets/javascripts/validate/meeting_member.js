$( "form[class $=_meeting_member]" ).validate({
    rules: {
        "meeting_member[member_id]": {
            required: true
        },
    },
    messages: {
        "meeting_member[member_id]": {
            required: "Seleccionar miembro es obligatorio"
        },
    }
});
