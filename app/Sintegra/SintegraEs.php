<?php
/**
 * Created by PhpStorm.
 * User: pedrolazari
 * Date: 07/01/2018
 * Time: 00:03
 */

namespace App\Sintegra;


use App\Sintegra;
use Illuminate\Support\Facades\Auth;

class SintegraEs
{

    /**
     * Realiza a consulta com a ajuda do Guzzle
     * @return string
     */
    protected function consultaSite($cnpj){
        try{
         $guzzle = new \GuzzleHttp\Client();

            $sintegra = $guzzle->request('POST', 'http://www.sintegra.es.gov.br/resultado.php', [
                'form_params' => [
                    'num_cnpj' => $cnpj,
                    'num_ie' => '',
                    'botao' => 'Consultar'
                ]
            ]);

            $retorno =  utf8_decode(utf8_encode($sintegra->getBody()->getContents()));

            return str_replace('&nbsp;', '', $retorno);
        }catch (\Exception $e){
            Log::error(__METHOD__.'Erro ao realizar a consulta');
            Log::error(__METHOD__.$e->getMessage());
        }
    }

    /**
     * Busca em todo o HTML o conteudo desejado no REGEX no caso as tabelas por TR e as colunas por TDs
     * @return bool|mixed
     */
    protected function parseNaTabela($cnpj){
        //Pego a tabela requisitada e procuro por TRs
        $tableCount = preg_match_all('#<tr[^>]*>(.*?)</tr>#is', $this->consultaSite($cnpj), $tableFirst);

        //Crio uma URL para Arrays
        $retornojSon = array();
        if($tableCount){
            //Se tiver sucesso no Regex
            foreach ($tableFirst as $tables){ //loop com as tabelas
                foreach ($tables as $table) { //Loop para facilitar a busca de colunas
                    $tableCountTwo = preg_match_all('#<td[^>]*>(.*?)</td>#is', $table, $Column);
                    
                    if(isset($Column[1][0]) && isset($Column[1][1])) { //Se der certo, vai pegar tudo que tiver indice
                        $retornojSon[] = $Column[1][1];
                    }
                }
            }
        }
        //Trata o Array para limpar
        $retornojSonTratado = str_replace('&nbsp;', '', $retornojSon);

        if($retornojSonTratado){
            return json_encode($retornojSonTratado, JSON_PRETTY_PRINT);
        }

        return false;
    }

    public function criaConsulta($cnpj){
        return Sintegra::create([
            'user_id' => Auth::user()->id,
            'cnpj' => $cnpj,
            'json' => $this->parseNaTabela($cnpj)
        ]);
    }
}