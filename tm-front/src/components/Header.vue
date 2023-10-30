<template>
    <nav class="px-2 py-3 bg-pink-500 mb-3">
        <div class=" flex flex-wrap items-center justify-between">
            <div class="w-full relative flex flex-row justify-between">
                <li class="mx-2 flex items-center">
                    <RouterLink class="ml-5" to="/">Dashboard</RouterLink>
                </li>
                <li class="mx-2 flex items-center">
                    <RouterLink class="ml-5" to="/settings">Settings</RouterLink>
                </li>
                <li class="mx-2 flex items-center">
                    <RouterLink :to="`/workingtimes/${userid}`">Feuille de temps</RouterLink>
                </li>
                <li class="mx-2 flex items-center">
                    <RouterLink :to="`/clock/${userid}`">ClockManager</RouterLink>
                </li>
                <li class="mx-2 flex items-center">
                    <RouterLink :to="`/workingtime/${userid}`">Créer un workingtime</RouterLink>
                </li>
                <li class="mx-2 flex items-center">
                    <button @click="logoutUser">Déconnexion</button>
                </li>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { logout } from '@/assets/utils.js';
import { useRoute, useRouter } from 'vue-router'

const router = useRouter()
let userid = localStorage.getItem("id")
const logoutUser = () => {
  logout();
  router.push("/login")
};
</script>