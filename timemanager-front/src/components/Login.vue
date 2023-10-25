<template>
    <div>
        yes sa mere
    </div>
</template>

<script setup lang="ts">
import * as Vue from 'vue' 
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'


const route = useRoute()
const user = ref(null)


onMounted(async () => {
  const token = 'Bearer ' + localStorage.getItem('userToken');
  const response = await axios.get(`ttp://localhost:4000/api/users/`, {
    headers: { Authorization: token }
  })
  user.value = response.data
})

</script>