
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ExampleComponent.vue'));

const app = new Vue({
    el: '#app',
    delimiters: ["[[","]]"],
    data: {
      consultas: {}, cnpj: "", retorno : {}

    },
    mounted(){
        this.getConsultas();
    },
    methods: {
        getConsultas() {
            axios.get('/consultas').then(response => {
                this.consultas = response.data;
        })
    },
        Deletar(id){
            axios.delete('/consulta/'+id).then(response => {
                alert('Consulta excluída com sucesso');
                this.getConsultas();
        })
        },
        enviarRequisicao() {
            axios.post('/sintegra/es/'+this.cnpj).then(response => {
                alert('consulta cadastrada com sucesso!');
                this.getConsultas();
                this.retorno = response.data;
        })
            return false;
        }
    }
});
