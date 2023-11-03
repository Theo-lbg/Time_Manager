<template>
    <div class="flex items-center justify-center h-screen">
        <div class="max-w-md mx-auto p-8 border rounded-lg bg-white shadow-lg ">
            <div v-if="clockIn">
                <div class="text-center mb-4">
                    <div class="font-semibold text-xl">
                        Tu as commencé à pointer à :
                    </div>
                    <div class="text-xl">
                        {{ lastClockData ? formatDateTime(lastClockData.time) : 'Heure de début' }}
                    </div>
                </div>
                <button @click="clock" class="block mx-auto bg-red-500 text-white font-bold py-2 px-4 rounded">
                    Terminer mon pointage
                </button>
            </div>
            <div v-else>
                <button @click="clock" class="block mx-auto bg-green-500 text-white font-bold py-2 px-4 rounded">
                    Commencer mon pointage
                </button>
            </div>
        </div>
    </div>
</template>

<script setup >
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import { format } from 'date-fns';

import { createToast } from 'mosha-vue-toastify';
import 'mosha-vue-toastify/dist/style.css'

const router = useRouter();

let clockData = null
let clockIn = ref(false);
let lastClockData = ref([]);

const formatDateTime = (datetime) => {
    return format(new Date(datetime), "yyyy-MM-dd HH:mm:ss");
};

async function getClockData(userId) {
    try {
        const response = await axios.get(`http://localhost:4000/api/clocks/${userId}`);
        if (response.status === 200) {
            clockData = response.data;
            clockIn.value = clockData.data[clockData.data.length - 1].status;
            lastClockData = clockData.data[clockData.data.length - 1];
        } else {
            console.error("La requête GET a échoué", response);
        }
    } catch (error) {
        console.error("Erreur lors de la requête GET", error);
    }
}

async function clock() {
    const clock = {
        time: new Date().toISOString()
    }

    try {
        const userId = localStorage.getItem("id");
        if (userId) {
            await getClockData(userId);
            const response = await axios.post(`http://localhost:4000/api/clocks/${userId}`, {
                clock: clock
            });

            if (response.status === 201) {
                clockIn.value = !clockIn.value;
                if (clockIn.value == false) {
                    const start = formatDateTime(lastClockData.time);
                    const end = formatDateTime(clock.time);
                    const workingTime = {
                        start: start,
                        end: end
                    };

                    const response = await axios.post(`http://localhost:4000/api/workingtimes/${userId}`, {
                        working_time: workingTime
                    });
                    if (response.status === 201) {
                        createToast('Pointage terminé !', { type: 'success', timeout: 2000, transition: 'slide' });
                    } else {
                        console.error("Requête POST de fin a échoué", response);
                    }
                }
            } else {
                console.error("Requête POST a échoué", response);
            }
        } else {
            console.error("L'ID de l'utilisateur est introuvable dans localStorage");
        }
    } catch (error) {
        console.error("Erreur lors de la requête POST", error);
    }
}

onBeforeMount(async () => {
    const userId = localStorage.getItem("id");
    if (userId) {
        await getClockData(userId);
    }
});
</script>
