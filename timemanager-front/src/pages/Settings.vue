<template>
    <div> 
        <Settings/>
    </div>
</template>
<script setup lang="ts">
import Settings from "@/components/Settings.vue";
import { ref, onBeforeMount } from 'vue';
import { useRoute, useRouter } from 'vue-router'

const router = useRouter();

onBeforeMount(() => {
  if (!localStorage.getItem('id')) {
    router.push('/login');
  }
});
</script>
