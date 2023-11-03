<template>
    <footer class="bg-quaternary  text-white fixed bottom-0 left-0 w-full">
        <div>
            <p class="font-montserrat">&copy; 2023 MSC-1 LIL-5 POOGER</p>
            <a class="flex justify-center font-montserrat">Vous avez des questions? <RouterLink :to="`/FAQ`"
                    class="text-green-500 font-montserrat"> Venez
                    ici </RouterLink></a>
        </div>
    </footer>
</template>
<script>

import { useRouter } from 'vue-router'
import { RouterLink } from 'vue-router'

const router = useRouter()
</script>