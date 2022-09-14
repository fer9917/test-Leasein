<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Asesores;

class asesoresController extends Controller {
    public function __construct() {
        $this->asesores_model = new Asesores();
    }

    /**							get
	========================================================================
	*
	*	Consulta los asesores y los regresa en un JSON.
	*
	*	Parámetros que puede recibir:
    *
    *   Return result of function.
    *   @return JSON              					JSON con los resultados.
    *
    ======================================================================== */
    public function get() {
        $asesores = $this->asesores_model->getAsesores();
        if (!empty($asesores['error'])) {
            abort(500, json_encode([
                'message' => 'Error al consultar los asesores',
                'log' => $asesores,
            ]));

            return response([
                'message' => 'Error al consultar los asesores',
                'log' => $asesores,
            ]);
        }

        return json_encode($asesores);
    }
}
