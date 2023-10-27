<template>
  <div>
    <WorkingTimes/>
  </div>
</template>

<script setup >
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router'
import WorkingTimes from '@/components/WorkingTimes.vue';

const router = useRouter();

onBeforeMount(() => {
  if (!localStorage.getItem('id')) {
    router.push('/login');
  }
});
</script>
L