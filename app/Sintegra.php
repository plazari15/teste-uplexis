<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Sintegra extends Model
{
    protected $fillable = [
        'user_id',
        'cnpj',
        'json'
    ];

    public function getCreatedAtAttribute($value){
        return Carbon::parse($value)->format('d/m/Y H:i:s');
    }
}
