<template>
    <div>
        <button @click="clock" class="border-2 bg-red-500">Clock</button>
    </div>
</template>
    
<script setup lang="ts">
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'

const router = useRouter()

async function clock() {
    const clock = {
        time: new Date().toISOString()
    }

    try {
        const userId = localStorage.getItem("id");
        if (userId) {
            const response = await axios.post(`http://localhost:4000/api/clocks/${userId}`, {
                clock: clock
            });

            if (response.status === 201) {
                console.log("Requête POST réussie", response);
            } else {
                console.log("Requête POST a échoué", response);
            }
        } else {
            console.error("L'ID de l'utilisateur est introuvable dans localStorage");
        }
    } catch (error) {
        console.error("Erreur lors de la requête POST", error);
    }
}
</script>
