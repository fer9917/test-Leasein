<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Unidades;

class unidadesController extends Controller {
    public function __construct() {
        $this->unidades_model = new Unidades();
    }

    /**							get
	========================================================================
	*
	*	Consulta las unidades y las regresa en un JSON.
	*
	*	Parámetros que puede recibir:
	*	@param Int id_cliente						ID del cliente.
    *
    *   Return result of function.
    *   @return JSON              					JSON con los resultados.
    *
    ======================================================================== */
    public function get(Request $request) {
        $unidades = $this->unidades_model->getUnidades($request->all());
        if (!empty($unidades['error'])) {
            abort(500, json_encode([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $unidades,
            ]));

            return response([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $unidades,
            ]);
        }

        return json_encode($unidades);
    }

     /**							store
	========================================================================
	*
	*	Agrega una unidad a un cliente.
	*
	*	Parámetros que puede recibir:
	*	@param Int id_cliente						ID del cliente.
	*	@param Int id						        ID de la unidad.
    *
    *   Return result of function.
    *   @return JSON              					JSON con los resultados.
    *
    ======================================================================== */
    public function store(Request $request) {
        // Validaciones
        if (empty($request->id_asesor)) {
            abort(500, json_encode([
                'message' => 'No se encuentra el asesor [id_asesor]',
                'data' => $request->all(),
            ]));

            return response([
                'message' => 'No se encuentra el asesor [id_asesor]',
                'data' => $request->all(),
            ]);
        }
        if (empty($request->id_cliente)) {
            abort(500, json_encode([
                'message' => 'No se encuentra el cliente [id_cliente]',
                'data' => $request->all(),
            ]));

            return response([
                'message' => 'No se encuentra el cliente [id_cliente]',
                'data' => $request->all(),
            ]);
        }
        if (empty($request->id_unidad)) {
            abort(500, json_encode([
                'message' => 'No se encuentra la unidad [id_unidad]',
                'data' => $request->all(),
            ]));

            return response([
                'message' => 'No se encuentra la unidad [id_unidad]',
                'data' => $request->all(),
            ]);
        }

        // Agrega la unidad a la base de datos
        $resp = $this->unidades_model->storeUnidad($request->all());
        if (!empty($resp['error'])) {
            abort(500, json_encode([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $resp,
            ]));

            return response([
                'message' => 'Error al consultar los clientes',
                'data' => $request->all(),
                'log' => $resp,
            ]);
        }

        return json_encode($resp);
    }
}
