console.log('Subscribing to realtime...');

const channels = [
    'databases.main_database.collections.c_id.documents',
];

const unsubscribe = window.Appwrite.client.subscribe(channels, response => {
    console.log('We got a realtime event in js:', response);
    window.dispatchEvent(new CustomEvent('realtime_event', { detail: response }));
});
