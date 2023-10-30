import { createRouter, createWebHistory } from 'vue-router';
import Dashboard from "../pages/Dashboard.vue";
import Login from "../pages/Login.vue";
import Register from "../pages/Register.vue";
import Settings from "../pages/Settings.vue";
import WorkingTimes from "../pages/Workingtimes.vue";
import WorkingTime from "../pages/Workingtime.vue";
import ClockManager from "../pages/ClockManager.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'clockmanager',
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
    {
      path: '/settings',
      name: 'settings',
      component: Settings
    },
    {
      path: '/workingtimes/:userid',
      name: 'workingtimes',
      component: WorkingTimes
    },
    {
      path: '/workingtime/:userid/:workingtimeid',
      name: 'workingtime',
      component: WorkingTime
    },
    {
      path: '/workingtime/:userid/',
      name: 'workingtimec',
      component: WorkingTime
    },
    {
      path: '/clock/:userid',
      name: 'clock',
      component: ClockManager
    },
  ]
});

export default router;
