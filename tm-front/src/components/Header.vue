<template>
    <nav class="flex justify-between p-2 px-4 bg-ternary">
        <div class="flex justify-between items-center w-full ">
            <div class="xl:w-auto">
                <a class="block max-w-max" href="#">
                    <img class="h-11" src="../assets/favicon.svg" alt="Pooger-logo">
                </a>
            </div>
            <div class="hidden xl:block xl:w-auto mx-auto">
                <ul class="flex justify-center">
                    <li class="mr-12 ml-5 font-montserrat text-black hover:text-white">
                        <RouterLink to="/">Dashboard</RouterLink>
                    </li>
                    <li class="mr-12 ml-5 font-montserrat text-black hover:text-white">
                        <RouterLink to="/settings">Settings</RouterLink>
                    </li>
                    <li class="mr-12 ml-5 font-montserrat text-black hover:text-white">
                        <RouterLink :to="`/workingtimes/${userid}`">Feuille de temps
                        </RouterLink>
                    </li>
                    <li class="mr-12 flex items-center ml-5 font-montserrat text-black hover:text-white">
                        <RouterLink :to="`/clock/${userid}`">ClockManager</RouterLink>
                    </li>
                    <li class="mr-12 flex items-center ml-5 font-montserrat text-black hover:text-white     ">
                        <RouterLink :to="`/workingtime/${userid}`">Créer un temps de travail</RouterLink>
                    </li>
                </ul>
            </div>
            <div class="hidden xl:block xl:w-auto">
                <div class="flex items-center justify-end"><a @click="logoutUser"
                        class=" font-montserrat inline-block py-2 px-4 text-sm leading-5 text-green-50 bg-green-500 hover:bg-red-500 font-medium focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 rounded-md"
                        href="#">Déconnexion</a></div>
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