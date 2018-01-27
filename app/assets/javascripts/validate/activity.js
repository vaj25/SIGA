$( "form[class $=_activity]" ).validate({
    rules: {
        "activity[tipo]": {
            required: true
        },
        "activity[descripcion]": {
            required: true
        },
        "activity[fecha_inicio]": {
            required: true,
            date: true
        },
        "activity[fecha_fin]": {
            required: true,
            date: true
        },
    },
    messages: {
        "activity[tipo]": {
            required: "El tipo de la actividad es obligatorio."
        },
        "activity[descripcion]": {
            required: "La descripción de la actividad es obligatoria."
        },
        "activity[fecha_inicio]": {
            required: "La fecha de inicio de la actividad es obligatoria.",
            date: "El valor debe ser una fecha valida."
        },
        "activity[fecha_fin]": {
            required: "La fecha final de la actividad es obligatoria.",
            date: "El valor debe ser una fecha valida."
        },
    }
});

$(function() {
  $('#activity_zone_id').submit(function () {
    if ($('zone_id-selector').val() == "") {
      $('zone_id-selector').attr('disabled', true);
    }
  })
});
