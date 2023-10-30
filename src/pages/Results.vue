<script setup>

import { inject } from 'vue';

const appState = inject('appState');

function created() {
    let urlParams = new URLSearchParams(window.location.search);
    let pageName = urlParams.get('page');
    console.log(pageName);  // Esto imprimirá index1, index2, etc., según la página que contenga el iframe
}

created();
</script>

<template>
  <main>
    <p>myVote: {{ appState.myVote }}</p>
    <p>Results: {{ appState.results }}</p>
  </main>
</template>

<style scoped>
</style>
