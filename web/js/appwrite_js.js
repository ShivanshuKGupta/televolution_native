console.log('Hello js!');

const channels = [
    'databases.main_database.collections.c_id.documents',
];

const unsubscribe = window.Appwrite.client.subscribe(channels, response => {
    console.log('We got a realtime event in js!');
    console.log(response);
    window.dispatchEvent(new CustomEvent('realtime_event', { detail: response }));
});
