<template>
  <div>
    <div class="infos">
      <div class="infos-name"> Votre Username : {{ name }} </div>
      <div class="infos-email"> Votre Email : {{ email }}</div>

    </div>
    <div class="flex flex-col">
    </div>
  </div>
</template>
  
<script setup >
import { ref, onBeforeMount } from 'vue';
import { useRouter } from 'vue-router'


const name = ref("");
const email = ref("");

const router = useRouter()

onBeforeMount(() => {
  const storedName = localStorage.getItem('username');
  const storedEmail = localStorage.getItem('email');

  if (storedName && storedEmail) {
    name.value = storedName;
    email.value = storedEmail;
  }
});
</script>
  