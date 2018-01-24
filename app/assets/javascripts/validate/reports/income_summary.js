$( "form" ).validate({
    rules: {
        "fecha_inicial": {
            required: true,
            minordate: true,
            date: true
        },
        "fecha_final": {
            required: true,
            depend: 'fecha_inicial',
            comparedate: 'fecha_inicial',
            date: true
        }
    },
    messages: {
        "fecha_inicial": {
            required: "La fecha de inicio de la actividad es obligatoria.",
            date: "El valor debe ser una fecha valida."
        },
        "fecha_final": {
            required: "La fecha final de la actividad es obligatoria.",
            date: "El valor debe ser una fecha valida."
        }
    }
});