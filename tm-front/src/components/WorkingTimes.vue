<template>
    <div>
        <div v-for="(work, index) in workData" :key="index" class="work-entry flex flex-row ">
            <div class="start">
                Start: {{ formatDateTime(work.start) }}
            </div>
            <div class="end">
                End: {{ formatDateTime(work.end) }}
            </div>
        </div>
    </div>
</template>


<script setup >
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';
import { format } from 'date-fns';

const router = useRouter();

let workData = null 

const formatDateTime = (datetime) => {
    return format(new Date(datetime), "yyyy-MM-dd HH:mm:ss");
};

async function getClockData(userId) {
    try {
        const response = await axios.get(`http://localhost:4000/api/workingtimes/${userId}`);
        if (response.status === 200) {
            workData = response.data.data;
            console.log(workData);
        } else {
            console.error("La requête GET a échoué", response);
        }
    } catch (error) {
        console.error("Erreur lors de la requête GET", error);
    }
}

onBeforeMount(async () => {
    const userId = localStorage.getItem("id");
    if (userId) {
        await getClockData(userId);
    }
});
</script>
