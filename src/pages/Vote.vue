<script setup>

import {inject} from 'vue';

import Button from '../components/Button.vue'
import MyVote from '../components/MyVote.vue'

const appState = inject('appState');

function handleVoteEmit(payload) {
  appState.myVote = payload;
}


</script>

<template>
  <header>
    <div class="wrapper">
      <MyVote :display="appState.myVote"/>

      <p>State: {{ appState.connected }}</p>
      <p>ClientId: {{ appState.clientId }}</p>

    </div>
  </header>

  <main>
    <Button button-value="A" @button-clicked="handleVoteEmit"/>
    <Button button-value="B" @button-clicked="handleVoteEmit"/>
  </main>

</template>

<style scoped>
</style>
