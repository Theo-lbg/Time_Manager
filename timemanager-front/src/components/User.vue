<template>
    <div>
        <div class="infos">
            <div class="infos-name"> Username : {{ name }} </div>
            <div class="infos-email"> Email : {{ email }}</div>

        </div>
        <button @click="logoutUser">Déconnexion</button>
    </div>
</template>
  
<script setup lang="ts">
import { ref, onBeforeMount } from 'vue';
import { logout } from '@/assets/utils.js';
import { useRoute, useRouter } from 'vue-router'

const name = ref("");
const email = ref("");

const router = useRouter()

const logoutUser = () => {
    logout();
    router.push("/login")
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
  