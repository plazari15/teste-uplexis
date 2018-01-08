@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <h3>Nova consulta ao Sintegra</h3>
                        [[retorno.data]]
                    <form onsubmit="return false">
                        <input type="text" class="form-control" v-model="cnpj"><br>
                        <button type="submit" class="btn btn-success" v-on:click="enviarRequisicao()">Consultar</button>
                    </form>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">Consultas</div>

                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>CNPJ</th>
                            <th>Consultado em:</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="item in consultas.items">
                            <th scope="row">[[item.id]]</th>
                            <td>[[item.cnpj]]</td>
                            <td>[[item.created_at]]</td>
                            <td><a href="#" v-on:click="Deletar([[item.id]])">Deletar</a></td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
