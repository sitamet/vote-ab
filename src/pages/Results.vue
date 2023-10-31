<script setup>

import {inject, onMounted, computed} from 'vue';
import axios from 'axios';

const appState = inject('appState');
const VOTE_AB_SERVER = import.meta.env.VITE_VOTE_AB_SERVER;

let urlParams = new URLSearchParams(window.location.search);
let pageName = urlParams.get('page');

onMounted(async () => {
  try {
    await axios.get(`${VOTE_AB_SERVER}/results`, {
      params: { page: pageName }
    });

  } catch (error) {
    console.error('/results: error', error);
  }
})


function calculateBarWidth(option) {
  const slideVotes = appState.results[appState.currentSlide] || {};
  const totalVotes = (slideVotes.A || 0) + (slideVotes.B || 0);
  if (!slideVotes[option] || !totalVotes) return 0;
  return (slideVotes[option] / totalVotes) * 100;
}

function calculateVotes(option) {
  const slideVotes = appState.results[appState.currentSlide] || {};
  return slideVotes[option] || 0;
}


const barWidthA = computed(() => calculateBarWidth('A'));
const barWidthB = computed(() => calculateBarWidth('B'));

const totalVotesA = computed(() => calculateVotes('A'));
const totalVotesB = computed(() => calculateVotes('B'));


</script>

<template>
  <main>

    <div id="vote-bars">
      <div class="bar-container">
        <div class="bar" id="bar-a"
             :style="{ width: barWidthA + '%', '--vote-total-content': `'${totalVotesA}'` }"></div>
      </div>
      <div class="bar-container">
        <div class="bar" id="bar-b"
             :style="{ width: barWidthB + '%', '--vote-total-content': `'${totalVotesB}'` }"></div>
      </div>
    </div>

  </main>
</template>

<style scoped>

#vote-bars {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  display: flex;
  padding: 10px 0;
}

.bar-container {
  flex: 1;
  margin: 0 10px;
  box-sizing: border-box;
  border-bottom: 3px solid #859100; /* Borde inferior para indicar el límite del 100% */
}

.bar {
  transition: width 1s ease; /* This creates the animation effect */
  width: 0%;
  height: 22px;
  background-color: #bdcb00; /* Or any color you prefer */
}


.bar::after {
  content: var(--vote-total-content); /* Usa la variable CSS aquí */
  font-size: .9em;
  padding-left: 10px;
  line-height: 1em;
  transform: translateX(-50%);
  white-space: nowrap;
  color: #ffffff;
}


</style>
