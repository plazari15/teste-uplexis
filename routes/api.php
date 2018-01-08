<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Routa de acesso protegido de dados incorretos
Route::middleware('auth:api')->get('/sintegra/es/{cnpj}', 'Api\Sintegra@getDados')->where('cnpj', '[0-9]+');
