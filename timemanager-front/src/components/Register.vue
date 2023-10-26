<template>
    <div class="card h-full w-full p-8">
        <h1 class="flex justify-center text-primary mb-6">
            Créer un compte</h1>
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
            <div>
                <button type="submit" class="button-secondary">S'inscrire</button>
            </div>
        </form>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const router = useRouter()

const login = ref('')
const email = ref('')

async function createUser() {
    try {
        const user = {
            username: login.value,
            email: email.value
        };
        const response = await axios.post('http://localhost:4000/api/users', {
            user: user
        });
        if (response.status === 201) {
            router.push('/')
        } else {
        }
    } catch (error) {
        console.error(error)
    }
}
</script>