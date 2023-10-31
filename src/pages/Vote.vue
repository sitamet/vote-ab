<script setup>

import {inject} from 'vue';

import Button from '../components/Button.vue'
import MyVote from '../components/MyVote.vue'

const appState = inject('appState');

function handleVoteEmit(payload) {
  appState.myVotes[appState.currentSlide] = payload;
}


</script>

<template>
  <header>
    <div class="wrapper">
      <MyVote :display="appState.myVotes[appState.currentSlide]"/>
      <div class="state" :class="{connected: appState.connected}"></div>
    </div>
  </header>

  <main>
    <Button button-value="A"
            :class="{disabled: !appState.connected}"
            :disabled="!appState.connected"
            @button-clicked="handleVoteEmit"/>
    <Button button-value="B"
            :class="{disabled: !appState.connected}"
            :disabled="!appState.connected"
            @button-clicked="handleVoteEmit"/>
  </main>

</template>

<style scoped>
.state {
  position: absolute;
  width: 10px;
  height: 10px;
  top: 20px;
  right: 20px;
  border-radius: 5px;
  background-color: red;

  &.connected {
    background-color: limegreen;
  }
}
</style>
