<template>
  <div flex justify-center>
    <User />
    <div>
      <Chart />
    </div>
  </div>
</template>

<script setup>
import User from "@/components/User.vue";
import Chart from "@/components/Chart.vue";
import { ref, onBeforeMount, onMounted } from 'vue';
import { useRouter } from 'vue-router'

const router = useRouter();

const name = ref("");
const email = ref("");

onBeforeMount(() => {
  const storedName = localStorage.getItem('username');
  const storedEmail = localStorage.getItem('email');

  console.log(storedName, storedEmail)
  if (!localStorage.getItem('id')) {
    router.push('/login');
  }

  if (storedName && storedEmail) {
    name.value = storedName;
    email.value = storedEmail;
  }
});

</script>
