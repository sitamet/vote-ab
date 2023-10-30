<script setup>
import {provide, reactive, watch} from 'vue'
import {io} from "socket.io-client";


if (!localStorage.getItem('uniqueId')) {
  localStorage.setItem('uniqueId', generateUniqueId());
}

const state = reactive({
  clientId: localStorage.getItem('uniqueId'),
  myVote: '?',
  connected: false,
  results: []
});

provide('appState', state);

const SOCKET_URL = 'http://0.0.0.0:8090';

const socket = io(SOCKET_URL, { query: { clientId: state.clientId } });

socket.connect();

socket.on("connect", () => {
  state.connected = true;
});

socket.on("vote-ab-results", results => {
  console.log('vote-ab-results', results);
  state.results = results;
});


watch(() => state.myVote, (newValue, oldValue) => {
  if (newValue !== oldValue) {
    socket.timeout(5000).emit("vote-ab-done", newValue);
  }
});

function generateUniqueId() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
    var r = Math.random() * 16 | 0,
        v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}


function handleVoteEmit(payload) {
  console.log('handleVoteEmit', payload)
}
</script>

<template>
  <div @vote-emit="handleVoteEmit"></div>
  <router-view/>
</template>

<style scoped>
</style>
