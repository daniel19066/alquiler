<template>
  <div id="app">
    <alquilerTable />
  </div>
</template>

<script>
import alquilerTable from './components/alquilerTable.vue'

export default {
  name: 'App',
  components: {
    alquilerTable
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
