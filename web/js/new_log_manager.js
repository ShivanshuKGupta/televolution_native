function getLogDiv() {
    if (document.getElementById('logDiv')) {
        return document.getElementById('logDiv');
    }

    let newLogDiv = document.createElement('div');
    newLogDiv.innerHTML = "Logs will appear here:";
    newLogDiv.id = 'logDiv';
    newLogDiv.style.position = 'absolute';
    newLogDiv.style.bottom = '0';
    newLogDiv.style.left = '0';
    newLogDiv.style.width = '100%';
    newLogDiv.style.height = '100%';
    newLogDiv.style.backgroundColor = 'rgba(0, 0, 0, 0.1)';
    newLogDiv.style.pointerEvents = 'none';
    newLogDiv.style.zIndex = '10000';
    newLogDiv.style.overflowY = 'auto';
    newLogDiv.style.color = 'white';
    newLogDiv.style.fontFamily = 'monospace';
    newLogDiv.style.fontSize = '10px';
    newLogDiv.style.boxSizing = 'border-box';

    document.body.appendChild(newLogDiv);
    overrideConsoleMethods();

    return newLogDiv;
}

const originalMethods = {
    'log': console.log,
    'warn': console.warn,
    'error': console.error,
    'network': console.network
};

function overrideConsoleMethods(logDiv) {
    const methods = Object.keys(originalMethods);

    methods.forEach(method => {
        const originalMethod = originalMethods[method];
        console[method] = function (message) {
            originalMethod(message);
            appendLogMessage(message, method);
        };
    });
}

function appendLogMessage(message, type) {
    const logEntry = document.createElement('div');
    logEntry.className = 'logEntry';
    logEntry.textContent = `[${type.toUpperCase()}] ${new Date().toISOString()}: ${message}`;

    if (type === 'error') {
        logEntry.style.color = 'red';
    } else if (type === 'warn') {
        logEntry.style.color = 'orange';
    } else if (type === 'network') {
        logEntry.style.color = 'blue';
    } else {
        logEntry.style.color = 'white';
    }

    let logDiv = getLogDiv();
    logDiv.appendChild(logEntry);
    logDiv.scrollTop = logDiv.scrollHeight;
}

function hideLogOverlay() {
    let logDiv = getLogDiv();
    logDiv.style.display = 'none';
}

function showLogOverlay() {
    let logDiv = getLogDiv();
    logDiv.style.display = 'block';
}

window.onload = function () {
    getLogDiv();
}