<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Sintegra extends Controller
{
    public function consultas(){
        $items = Auth::user()->sintegras;
        if($items){
            return response()->json(['success' => true, 'items' => $items]);
        }

        return response()->json(['success' => false, 'items' => '']);

    }

    public function deletarConsulta($id){
        $consulta = \App\Sintegra::find($id);

        if($consulta && $consulta->delete()){
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false]);

    }
}
