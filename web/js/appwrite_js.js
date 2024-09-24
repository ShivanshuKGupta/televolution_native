const subscribedChannels = [];

const Appwrite = window.Appwrite;
const client = new Appwrite.Client();

client.setEndpoint('https://7xwrgbhq-80.inc1.devtunnels.ms/v1').setProject('televolution');

let unsubscribe;

function subscribeToChannels() {
    console.log('Subscribing to channels:', subscribedChannels);
    if (unsubscribe) unsubscribe();
    unsubscribe = client.subscribe(subscribedChannels, response => {
        console.log('We got a realtime event in js:', response);
        window.dispatchEvent(new CustomEvent('realtime_event', { detail: response }));
    });
}

window.addEventListener('realtime_subscribe', (event) => {
    event.detail.forEach(channel => {
        if (subscribedChannels.includes(channel)) return;
        subscribedChannels.push(channel);
    });
    subscribeToChannels();
});

window.addEventListener('realtime_unsubscribe', (event) => {
    console.log('Unsubscribing from channels:', event.detail);
    event.detail.forEach(channel => {
        const index = subscribedChannels.indexOf(channel);
        if (index === -1) return;
        subscribedChannels.splice(index, 1);
    });
    subscribeToChannels();
});
