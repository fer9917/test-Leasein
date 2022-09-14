<?php
namespace App\Models;

use DB;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Database\Eloquent\Model;

class Unidades extends Model{
    use HasFactory;

	/**							getUnidades
	========================================================================
	*
	*	Consulta las unidades en la DB.
	*
	*	Parámetros que puede recibir:
	*	@param Int id_cliente						ID del cliente.
	*	@param Boolean libre						SI la unidad esta libre.
    *
    *   Regresa el resultado de la consulta.
    *   @return Array              					Resultado de la consulta.
    *
    ======================================================================== */
	public function getUnidades($data){
        try {
			// Filters
			$where = [];
			if (!empty($data['id_cliente'])) $where[] = ['id_cliente', $data['id_cliente']];
			if (!empty($data['libre'])) $where[] = ['id_cliente', NULL];
			
			$resp = DB::table('unidades_de_alquiler')
				->where($where)
				->get();

			return $resp;
		} catch (\Exception $e) {
            return [
                'message' => 'Error al consultar las unidades [getUnidades]',
				"file" => $e->getFile()." #".$e->getLine(),
				"log" => $e->getMessage(),
			];
		}
	}

	/**							storeUnidad
	========================================================================
	*
	*	Consulta las unidades en la DB.
	*
	*	Parámetros que puede recibir:
	*	@param Int id_asesor						ID del asesor.
	*	@param Int id_cliente						ID del cliente.
	*	@param Int id_unidad						ID de la unidad.
    *
    *   Regresa el resultado de la consulta.
    *   @return Boolean              				Resultado de la consulta.
    *
    ======================================================================== */
	public function storeUnidad($data){
        try {
			// Update clientes
			DB::table('clientes')
              ->where('id', $data['id_cliente'])
              ->update(['asesor_id' => $data['id_asesor']]);

			// Update unidades
			DB::table('unidades_de_alquiler')
              ->where('id', $data['id_unidad'])
              ->update(['id_cliente' => $data['id_cliente']]);

			return true;
		} catch (\Exception $e) {
            return [
                'message' => 'Error al guardar la unidad [storeUnidad]',
				"file" => $e->getFile()." #".$e->getLine(),
				"log" => $e->getMessage(),
			];
		}
	}
}