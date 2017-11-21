<!-- App.vue -->
<template>
    <div id="app">
        <header>
            <h1>Phoenix Vue</h1>
        </header>
        <main>
            {{msg}}
            DAS
            <hello></hello>
            <button @click="send">Send</button>
        </main>
    </div>
</template>

<script>
    import axios from 'axios'

    let http = axios.create({
        baseURL: 'http://localhost:4000/api/v1'
    });

    import Hello from './components/Hello'
    export default {
        name: 'app',
        data() {
            return {
                msg: "Hi. There."
            }
        },
        methods: {
            send() {
                this.msg = "Again, hi."
                http.get('/ping').then((response) => {
                    this.msg = response.data.ping
                })


            }
        },
        components: {
            Hello
        }
    }
</script>

<style>
    #app {
          font-family: 'Avenir', Helvetica, Arial, sans-serif;
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
          color: #2c3e50;
    }
    main {
        margin-top: 60px;
    }
</style>