import Vote from './pages/Vote.vue'
import Results from './pages/Results.vue'
import {createRouter, createWebHistory} from 'vue-router'

const routes = [
  { path: '/', component: Vote },
  { path: '/results', component: Results }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})


export default router
