<template>
  <button
      class="huge"
      @click="sendClickEvent"
  >{{ buttonValue }}
  </button>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue'

const props = defineProps({
  buttonValue: {
    type: String,
    required: true
  }
})

const emit = defineEmits(['button-clicked'])

function sendClickEvent() {
  emit('button-clicked', props.buttonValue)
}

</script>

<style scoped>

.huge {
  font-size: 14vw;
  font-weight: bold;
  padding: 1em 1vw;
  border: none;
  transition: all 0.3s ease;
  cursor: pointer;
  border-radius: 10vw;
}

@media (min-width: 1000px) {
  .huge {
  font-size: 5vw;
  }
}


</style>
