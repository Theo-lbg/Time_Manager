<template>
    <div>
        <div class="start" v-if="trorfa">
            <div class="time">
                Tu as commencé à pointer à : {{ formatDateTime(lastClockData.time) }}
            </div>
            <button @click="clock" class="bg-red-500">
                Terminer mon pointage
            </button>
        </div>
        <div class="end" v-else>
            <button @click="clock" class="bg-green-500">
                Commencer mon pointage
            </button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import { format } from 'date-fns';

const router = useRouter();

let clockData = null;
let trorfa = ref(false);
let lastClockData = ref([]);

const formatDateTime = (datetime) => {
    return format(new Date(datetime), "yyyy-MM-dd HH:mm:ss");
};

async function getClockData(userId) {
    try {
        const response = await axios.get(`http://localhost:4000/api/clocks/${userId}`);
        if (response.status === 200) {
            clockData = response.data;
            trorfa.value = clockData.data[clockData.data.length - 1].status;
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
            const response = await axios.post(`http://localhost:4000/api/clocks/${userId}`, {
                clock: clock
            });

            if (response.status === 201) {
                trorfa.value = !trorfa.value;
                if (trorfa.value == false) {
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
                    } else {
                        console.error("Requête POST de fin a échoué", response);
                    }
                }
                await getClockData(userId);
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
