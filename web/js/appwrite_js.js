const channels = [
    'databases.lite-db.collections.app_strings.documents',
];

const Appwrite = window.Appwrite;
const client = new Appwrite.Client();

client.setEndpoint('https://7xwrgbhq-80.inc1.devtunnels.ms/v1').setProject('televolution');

console.log('Subscribing to realtime...');
const unsubscribe = client.subscribe(channels, response => {
    console.log('We got a realtime event in js:', response);
    window.dispatchEvent(new CustomEvent('realtime_event', { detail: response }));
});
