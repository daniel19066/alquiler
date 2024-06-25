<template>
  <div class="container-xl">
    <div class="container">
      <b-row>
        <label for="example-datepicker">Fecha inicial:</label>
        <b-col md="auto">
          
          <b-form-datepicker id="example-datepicker" placeholder="elija la fecha inicial" v-model="Fechai" class="mb-2"></b-form-datepicker>
        </b-col>
        <label for="example-datepicker">Fecha Final:</label>
        <b-col md="auto">

          <b-form-datepicker id="example-datepicker" placeholder="elija la fecha final" v-model="Fechaf" class="mb-2"></b-form-datepicker>
        </b-col>
        <b-col md="auto">
          <b-button variant="success" v-on:click="filtrar">Filtrar</b-button>
        </b-col>
      </b-row>
    </div>
    {{ msg }}
    <b-table striped :items="items" :bordered="true" :hover="true" :fixed="true"
    :no-border-collapse="true" :head-variant="'light'"></b-table>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'alquilerTable',
  data() {
      return {
        Fechai: '',
        Fechaf:'',
        msg: '',
        items: []
      }
    },
    methods: {
      filtrar: function ()  {    
      this.msg=''  
      if(this.Fechai=='' || this.Fechaf=='' ){
        this.msg="las fechas no pueden estar vacias";
        return;
      }
      if(new Date(this.Fechai) >= new Date(this.Fechaf)){
        this.msg="la fecha inicial no puede ser mayor a la fecha final";
        return;
      }
        axios
      .get('http://localhost:5096/Table',{
        headers: {
          
        },
        responseType: "json",
      })
      .then(response => {
        var result = response.data
        var resultf = result.filter((data) => {
          var fecha1 = new Date(data["fecha"])
          var fechain = new Date(this.Fechai)
          var fechafi = new Date(this.Fechaf)
          console.log(fecha1)
          console.log(fechain)
          console.log(fechafi)
          console.log(fechain <= fecha1 && fecha1 <=fechafi)
          return fechain <= fecha1 && fecha1 <=fechafi
        }
        
      );
      this.items = resultf
    })
        
      }
    },
    mounted () {
    axios
      .get('http://localhost:5096/Table',{
        headers: {
          
        },
        responseType: "json",
      })
      .then(response => {
        this.items = response.data
    })
  }
    
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
