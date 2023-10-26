<template>
  <div>
    <div class="infos">
      <div class="infos-name"> Username : {{ name }} </div>
      <div class="infos-email"> Email : {{ email }}</div>

    </div>
    <div class="flex flex-col">
      <button @click="logoutUser">Déconnexion</button>
      <button @click="deleteUser">Supprimer mon compte</button>
      <button @click="goToSettings">Settings</button>
    </div>
  </div>
</template>
  
<script setup lang="ts">
import { ref, onBeforeMount } from 'vue';
import { logout } from '@/assets/utils.js';
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'


const name = ref("");
const email = ref("");

const router = useRouter()

const goToSettings = () => {
  router.push("/settings")
};

const logoutUser = () => {
  logout();
  router.push("/login")
};

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

onBeforeMount(() => {
  const storedName = localStorage.getItem('username');
  const storedEmail = localStorage.getItem('email');

  if (storedName && storedEmail) {
    name.value = storedName;
    email.value = storedEmail;
  }
});
</script>
  