<?php

namespace App\Http\Controllers\Api;

use App\Sintegra\SintegraEs;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class Sintegra extends Controller
{
    /**
     * Metodo recebe a consulta com o CNPJ e consulta a classe da Sintegra, que retorna os dados da consulta.
     * @param $cnpj
     * @return \Illuminate\Http\JsonResponse
     */
    public function getDados($cnpj){
        if(!$cnpj){
            return response()->json(['success' => false, 'message' => 'Digite um CNPJ para buscar']);
        }

        $busca = new SintegraEs();
       $resultado =  $busca->criaConsulta($cnpj);

       if($resultado){
           return response()->json(['success' => true, 'data' => $resultado->json]);
       }

    }
}
