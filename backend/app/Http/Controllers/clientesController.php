<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Clientes;

class clientesController extends Controller {
    public function __construct() {
        $this->clientes_model = new Clientes();
    }

    /**							get
	========================================================================
	*
	*	Consulta los clientes y los regresa en un JSON.
	*
	*	Parámetros que puede recibir:
    *
    *   Return result of function.
    *   @return JSON              					JSON con los resultados.
    *
    ======================================================================== */
    public function get(Request $request) {
        $clientes = $this->clientes_model->getClientes($request->all());
        if (!empty($clientes['error'])) {
            abort(500, json_encode([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $clientes,
            ]));

            return response([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $clientes,
            ]);
        }

        return json_encode($clientes);
    }
}
