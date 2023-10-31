<script setup>
import {provide, reactive, watch} from 'vue'
import {io} from "socket.io-client";


if (!localStorage.getItem('uniqueId')) {
  localStorage.setItem('uniqueId', generateUniqueId());
}

const state = reactive({
  clientId: localStorage.getItem('uniqueId'),
  connected: false,
  myVotes: {},
  results: {},
  connectedUsers: 2,
  currentSlide: 'default'
});

provide('appState', state);

const socket = io(import.meta.env.VITE_VOTE_AB_SERVER, { query: { clientId: state.clientId } });

socket.connect();

socket.on("connect", () => {
  state.connected = true;
});

socket.on("vote-ab-results", ({ results, connectedUsers, currentSlide }) => {
  state.results = results;
  state.connectedUsers = connectedUsers;
  state.currentSlide = currentSlide;
});


socket.on("vote-ab-reset", ({ results, currentSlide }) => {
  state.results = results;
  state.currentSlide = currentSlide;
  state.myVotes[currentSlide] = '';
});


watch(() => state.myVotes[state.currentSlide], (newVote, oldVote) => {
  if (newVote && newVote !== oldVote) {
    socket.timeout(5000).emit("vote-ab-done", newVote);
  }
});

function generateUniqueId() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
    var r = Math.random() * 16 | 0,
        v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}


</script>

<template>
  <router-view/>
</template>

<style scoped>
</style>
