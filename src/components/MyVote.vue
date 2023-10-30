<script setup>
defineProps({
  display: {
    type: String,
    required: true
  }
})
</script>

<template>
  <h1>{{ display }}</h1>
</template>

<style scoped>
h1 {
  font-weight: bold;
  font-size: 10vw;
  padding: 10% 0;
  margin: 20vw auto;
  line-height: 1vw;
  border: solid 5px #666666;
  border-radius: 50%;
  text-align: center;
  width: 25vw;
  height: 25vw;
  display: flex;
  justify-content: center;
  align-items: center;
}


@media (min-width: 1000px) {
  h1 {
    margin: 80px auto;
    width: 15vw;
    height: 15vw;
  }
}

</style>