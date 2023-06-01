// ContactList.js
new Vue({
    el: '#app',
    data() {
        return {
            isToggled: false,
        };
    },
    methods: {
        toggleButton() {
            this.isToggled = !this.isToggled;
        },
    },
});
