<template>
    <div class="card h-full w-full p-8">
        <h1 class="flex justify-center text-black font-montserrat text-xl font-bold text-ellipsis">
            Modifier son compte
        </h1>
        <form @submit.prevent="updateUser">
            <div class="mb-6">
                <label for="login" class="block text-lg font-semibold font-montserrat mb-2">Username</label>
                <input v-model="login" type="text" id="login"
                    class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
            </div>
            <div class="mb-6">
                <label for="email" class="block text-lg font-semibold font-montserrat mb-2">Adresse e-mail</label>
                <input v-model="email" type="email" id="email"
                    class="w-full border border-gray-300 rounded-md py-2 px-4 focus:outline-none focus:ring-2 focus:ring-pastel-blue" />
            </div>
            <div class="flex justify-center gap-2">
                <button type="submit"
                    class="border font-montserrat bg-secondary hover:bg-green-900 text-white font-bold py-2 px-4 rounded-full ">Modifier</button>
                <button
                    class="border font-montserrat bg-secondary hover:bg-red-800 text-white font-bold py-2 px-4 rounded-full"
                    @click="deleteUser">Supprimer mon compte</button>
            </div>
        </form>
    </div>
</template>


<script setup >
import { ref } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'
import { logout } from '@/assets/utils.js';

const router = useRouter()

const login = ref(localStorage.getItem("username"))
const email = ref(localStorage.getItem("email"))

async function updateUser() {
    try {
        const user = {
            username: login.value,
            email: email.value
        };
        const response = await axios.patch(`http://localhost:4000/api/users/${localStorage.getItem("id")}`, {
            user: user
        });
        if (response.status === 200) {
            localStorage.removeItem("email");
            localStorage.removeItem("username");
            localStorage.setItem("id", response.data.data.id)
            localStorage.setItem("email", response.data.data.email)
            localStorage.setItem("username", response.data.data.username)
            router.push("/")
        } else {
        }
    } catch (error) {
        console.error(error)
    }
}

async function deleteUser() {
    try {
        const response = await axios.delete(`http://localhost:4000/api/users/${localStorage.getItem("id")}`);
        if (response.status === 204) {
            logout();
            router.push("/login")
        } else {
        }
    } catch (error) {
        console.error(error)
    }

};
</script>