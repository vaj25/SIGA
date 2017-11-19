$( "form[class $=_tree]" ).validate({
    rules: {
        "tree[nombre_comun]": {
            required: true
        },
        "tree[nombre_cientifico]": {
            required: true
        }

    },
    messages: {
        "tree[nombre]": {
            required: "El nombre común del árbol es obligatorio."
        },
        "tree[nombre_cientifico]": {
            required: "El nombre cientifico del árbol es obligatorio."
        }

    }
});