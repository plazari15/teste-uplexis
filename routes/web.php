<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {

    return view('welcome');

});



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home')->middleware('auth');
Route::get('/consultas', 'Sintegra@consultas')->middleware('auth');
Route::delete('/consulta/{id}', 'Sintegra@deletarConsulta')->middleware('auth');
Route::post('/sintegra/es/{cnpj}', 'Api\Sintegra@getDados')->where('cnpj', '[0-9]+')->middleware('auth');