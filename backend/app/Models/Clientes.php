<?php
namespace App\Models;

use DB;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clientes extends Model{
    use HasFactory;

	/**							getClientes
	========================================================================
	*
	*	Consulta las clientes en la DB.
	*
	*	Parámetros que puede recibir:
	*	@param Int id_asesor						ID del asesor.
    *
    *   Regresa el resultado de la consulta.
    *   @return Array              					Resultado de la consulta.
    *
    ======================================================================== */
	public function getClientes($data){
        try {
			// Filters
			$where = [];
			if (!empty($data['id_asesor'])) $where[] = ['id_asesor', $data['id_asesor']];
			
			$resp = DB::table('clientes')
				->where($where)
				->get();

			return $resp;
		} catch (\Exception $e) {
            return [
                'message' => 'Error al consultar las clientes [getClientes]',
				"file" => $e->getFile()." #".$e->getLine(),
				"log" => $e->getMessage(),
			];
		}
	}
}