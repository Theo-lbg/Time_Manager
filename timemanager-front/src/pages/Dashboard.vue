<template>
    <div>
        <User/>
    </div>
</template>
<script setup lang="ts">
import User from "@/components/User.vue";
import { ref, onBeforeMount } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

onBeforeMount(() => {
  if (!localStorage.getItem('id')) {
    router.push('/login');
  }
});
</script>
