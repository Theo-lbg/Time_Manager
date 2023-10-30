<template>
    <div>
        <User/>
        <WorkingTime/>
    </div>
</template>
<script setup >
import User from "@/components/User.vue";
import WorkingTime from "@/components/Clock.vue";
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router'

const router = useRouter();

onBeforeMount(() => {
  if (!localStorage.getItem('id')) {
    router.push('/login');
  }
});
</script>
L