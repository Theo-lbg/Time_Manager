<template>
    <div>
        <Register/>
    </div>
</template>
<script setup lang="ts">
import Register from "@/components/Register.vue";
import { ref, onBeforeMount } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
onBeforeMount(() => {
  if (localStorage.getItem('id')) {
    router.push('/');
  }
});

</script>