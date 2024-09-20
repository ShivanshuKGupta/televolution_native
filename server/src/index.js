import { Account, Client, Databases } from 'appwrite';

const client = new Client();
client.setEndpoint('https://cloud.appwrite.io/v1').setProject('66b20ea5002316ed487f');

// Attach the necessary objects to window.Appwrite

const databases = new Databases(client);
const account = new Account(client);

window.Appwrite = {
    Client,
    Account,
    Databases,
    client,
    account,
    databases,
};
