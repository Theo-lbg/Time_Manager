<template>
    <div class="p-4 bg-white shadow rounded-lg">
        <div class="flex justify-between mb-4">
            <div class="font-semibold">Date de début</div>
            <div class="font-semibold">Date de fin</div>
            <div class="font-semibold">Actions</div>
        </div>
        <div v-if="workData.value && workData.value.length > 0">
            <div v-for="(work, index) in workData.value" :key="index"
                class="flex justify-between items-center py-2 border-b text-black hover:text-red-500">
                <div>{{ work.start }}</div>
                <div>{{ work.end }}</div>
                <div>
                    <RouterLink :to="`/workingtime/${userId}/${work.id}`" class="text-blue-500">Settings</RouterLink>
                </div>
            </div>
        </div>
        <div v-else>
            <p class="mt-4 text-center">Chargement des données...</p>
        </div>
    </div>
</template>
  
<script setup>
import ModifyModal from '../components/ModifyWorkingTime.vue';
import { ref, onBeforeMount, reactive } from 'vue';
import { useRoute } from 'vue-router'
import axios from 'axios';
import { format } from 'date-fns';

const route = useRoute()
const userId = route.params.userid
let workData = reactive({ data: [] });
let ModifyModalOpen = ref(false);
let selectedWork = reactive({});

let formattedStartDate = '';
let formattedEndDate = '';

function openModifyModal(work) {
    ModifyModalOpen.value = true;
    formattedStartDate = work.start;
    formattedEndDate = work.end;
    selectedWork = Object.assign({}, work);
}

function closeModifyModalOpen() {
    ModifyModalOpen.value = false;
}

const formatDateTime = (datetime) => {
    return format(new Date(datetime), "yyyy-MM-dd HH:mm:ss");
};

async function getWorkingTimes(userId) {
    try {
        const response = await axios.get(`http://localhost:4000/api/workingtimes/${userId}`);
        if (response.status === 200) {
            workData.value = response.data.data;
        } else {
            console.error("La requête GET a échoué", response);
        }
    } catch (error) {
        console.error("Erreur lors de la requête GET", error);
    }
}

async function deleteWorkingTime(id) {
    try {
        const response = await axios.delete(`http://localhost:4000/api/workingtimes/${id}`);
        if (response.status === 204) {
            console.log("La suppression a réussi", response);
            await getWorkingTimes(localStorage.getItem("id"));
        } else {
            console.error("La suppression a échoué", response);
        }
    } catch (error) {
        console.error("Erreur lors de la suppression", error);
    }
}

const modifyWorkingTime = async () => {
    try {
        const { id } = selectedWork;

        const body = {
            working_time: {
                start: formattedStartDate,
                end: formattedEndDate
            }
        };

        const response = await axios.put(`http://localhost:4000/api/workingtimes/${id}`, body);

        if (response.status === 200) {
            console.log("La modification a réussi", response);
            await getWorkingTimes(localStorage.getItem("id"));
        } else {
            console.error("La modification a échoué", response);
        }
    } catch (error) {
        console.error("Erreur lors de la modification", error);
    }
};



onBeforeMount(async () => {
    if (userId) {
        await getWorkingTimes(userId);
    }
});
</script>
  