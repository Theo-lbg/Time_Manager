<template>
    <div class="h-full w-full flex">
        <div class="w-1/2 ">
            <img src="../assets/POOGER.png" alt="Pooger-img" class="object-contain h-screen ">
        </div>


        <div class="w-1/2 my-auto">
            <div class="h-auto">
                <h1 class="flex justify-center  text-black font-montserrat text-xl font-bold text-ellipsis">
                    Se connecter
                </h1>
                <form @submit.prevent="getUser">
                    <div class="mb-6">
                        <label for="username" class="block text-lg font-semibold mb-2">Nom d'utilisateur</label>
                        <input v-model="username" type="text" id="username"
                            class="w-full border font-montserrat border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
                    </div>
                    <div class="mb-6">
                        <label for="password" class="block text-lg font-semibold mb-2">Email</label>
                        <input v-model="email" type="text" id="email"
                            class="w-full border font-montserrat border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
                    </div>
                    <div class="flex justify-center">
                        <button type="submit"
                            class="button-secondary font-montserrat bg-secondary hover:bg-black text-white font-bold py-2 px-4 rounded-full ">
                            Se connecter</button>
                    </div>
                </form>
                <a class="font-montserrat">Vous avez déjà un compte ? </a><button @click="goToRegister"
                    class=" font-montserrat button-primary font-bold">
                    Connectez-vous !</button>
            </div>
        </div>
    </div>
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
            localStorage.setItem("id", response.data.data[0].id)
            localStorage.setItem("email", response.data.data[0].email)
            localStorage.setItem("username", response.data.data[0].username)
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