<template>
    <div>
      <WorkingTime/>
    </div>
  </template>
  
  <script setup >
  import { ref, onBeforeMount } from 'vue';
  import { useRoute, useRouter } from 'vue-router'
  import WorkingTime from '@/components/Workingtime.vue';
  
  const router = useRouter();
  
  onBeforeMount(() => {
    if (!localStorage.getItem('id')) {
      router.push('/login');
    }
  });
  </script>
  L