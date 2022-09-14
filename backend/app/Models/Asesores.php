<?php
namespace App\Models;

use DB;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Asesores extends Model{
    use HasFactory;

	/**							getAsesores
	========================================================================
	*
	*	Consulta las asesores en la DB.
	*
	*	Parámetros que puede recibir:
    *
    *   Regresa el resultado de la consulta.
    *   @return Array              					Resultado de la consulta.
    *
    ======================================================================== */
	public function getAsesores(){
        try {
			$resp = DB::table('asesor')->get();

			return $resp;
		} catch (\Exception $e) {
            return [
                'message' => 'Error al consultar las asesores [getAsesores]',
				"file" => $e->getFile()." #".$e->getLine(),
				"log" => $e->getMessage(),
			];
		}
	}
}