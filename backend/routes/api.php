<?php

use Illuminate\Support\Facades\Route;


use App\Http\Controllers\asesoresController;
use App\Http\Controllers\clientesController;
use App\Http\Controllers\unidadesController;

// Asesores
Route::get('/asesores', [asesoresController::class, 'get']);

// Unidades
Route::post('/unidades', [unidadesController::class, 'store']);
Route::get('/unidades', [unidadesController::class, 'get']);

// Clientes
Route::get('/clientes', [clientesController::class, 'get']);
