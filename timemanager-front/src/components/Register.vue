<template>
    <div class="h-full w-full flex">
        <div class="w-1/2 ">
            <img src="../assets/POOGER.png" alt="Pooger-img" class="object-contain h-screen ">
        </div>
        <div class="w-1/2 my-auto">
            <div class="h-auto">
                <h1 class="flex justify-center  text-black font-montserrat text-xl font-bold text-ellipsis">
                    Créer un compte
                </h1>
                <form @submit.prevent="createUser">
                    <div class="mb-6">
                        <label for="login" class="block text-lg font-semibold mb-2">Pseudonyme</label>
                        <input v-model="login" type="text" id="login"
                            class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
                    </div>
                    <div class="mb-6">
                        <label for="email" class="block text-lg font-semibold mb-2">Adresse e-mail</label>
                        <input v-model="email" type="email" id="email"
                            class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
                    </div>
                    <div class="flex justify-center">
                        <button type="submit"
                            class="button-secondary font-montserrat bg-secondary hover:bg-black text-white font-bold py-2 px-4 rounded-full ">S'inscrire</button>
                    </div>
                    <a class="font-montserrat">Déjà un compte ?</a><button @click="goToLogin"
                        class=" font-montserrat button-primary font-bold">
                        Se connecter</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const router = useRouter()

const login = ref('')
const email = ref('')

const goToLogin = () => {
    router.push('/login');
}

async function createUser() {
    try {
        const user = {
            username: login.value,
            email: email.value
        }
        const response = await axios.post('http://localhost:4000/api/users', {
            user: user
        })
        if (response.status === 201) {
            router.push('/')
        } else {
            // Handle error
        }
    } catch (error) {
        console.error(error)
    }
}
</script>