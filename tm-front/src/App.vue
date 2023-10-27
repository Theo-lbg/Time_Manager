<template>
  <header>
    <layoutHeader v-if="showHeader" />
  </header>
  <RouterView />
</template>

<script setup>
import { RouterLink, RouterView, useRoute } from 'vue-router';
import layoutHeader from "@/components/Header.vue";
import { computed } from 'vue';

const route = useRoute();

const showHeader = computed(() => {
  return route.path !== '/login' && route.path !== '/register';
});
</script>

