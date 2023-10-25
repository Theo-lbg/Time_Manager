import { createRouter, createWebHistory } from 'vue-router';
import Dashboard from "../pages/Dashboard.vue";
import Login from "../pages/Login.vue";
import Register from "../pages/Register.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'dashboard',
      component: Dashboard
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
  ]
});

export default router;
