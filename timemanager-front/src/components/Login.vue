<template>
    <form @submit.prevent="getUser">
        <div class="mb-6">
            <label for="username" class="block text-lg font-semibold mb-2">Nom d'utilisateur</label>
            <input v-model="username" type="text" id="username"
                class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
        </div>
        <div class="mb-6">
            <label for="password" class="block text-lg font-semibold mb-2">Email</label>
            <input v-model="email" type="text" id="email"
                class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
        </div>
        <div>
            <button type="submit" class="button-secondary">Se connecter</button>
        </div>
    </form>
    <button @click="goToRegister" class="button-primary">Pas encore inscrit ? S'inscrire</button>
</template>

<script setup lang="ts">
import * as Vue from 'vue'
import { ref, onBeforeMount } from 'vue'
import axios from 'axios'
import { useRoute, useRouter } from 'vue-router'


const username = ref('')
const email = ref('')
const router = useRouter()
const route = useRoute()


const goToRegister = () => {
    router.push('/register');
}

async function getUser() {
    try {
        const response = await axios.get(`http://localhost:4000/api/users?email=${email.value}&username=${username.value}`)
        if (response.status === 200) {
            console.log(response.data.data[0])
            localStorage.setItem("id",response.data.data[0].id)
            localStorage.setItem("email",response.data.data[0].email)
            localStorage.setItem("username",response.data.data[0].username)
            router.push('/');
        } else {
            console.log("Erreur inattendue")
        }
    } catch (error) {
        console.log(error.response.request.response)
        console.error(error)
    }
}



</script>