function initializeLogger() {
    // Create an overlay layer to cover the entire application
    const overlay = document.createElement('div');
    overlay.id = 'logOverlay';
    document.body.appendChild(overlay);

    // Set styles for the overlay to cover the entire screen and make it transparent
    overlay.style.position = 'bottom';
    overlay.style.bottom = '0';
    overlay.style.left = '0';

    overlay.style.width = '50%';
    overlay.style.height = '30%';
    overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.1)'; // Light transparent layer to cover the app
    overlay.style.pointerEvents = 'none'; // Ensure it does not block interactions with the app
    overlay.style.zIndex = '10000'; // Make sure it is on top of the entire application

    // Create a container for the logs inside the overlay
    const logContainer = document.createElement('div');
    logContainer.id = 'logContainer';
    overlay.appendChild(logContainer);

    // Set styles for the log container
    logContainer.style.position = 'bottom';
    logContainer.style.width = '50%'; // Allow some padding from the edges
    logContainer.style.maxHeight = '30%'; // Prevent it from covering the entire height
    logContainer.style.overflowY = 'auto'; // Enable scrolling for the log messages
    logContainer.style.color = 'white';
    logContainer.style.fontFamily = 'monospace';
    logContainer.style.fontSize = '10px';
    logContainer.style.boxSizing = 'border-box';

    // Utility function to append a log message to the container
    function appendLogMessage(message, type = 'log') {
        const logEntry = document.createElement('div');
        logEntry.className = 'logEntry';
        logEntry.textContent = `[${type.toUpperCase()}] ${new Date().toISOString()}: ${message}`;

        // Color coding for different log types
        if (type === 'error') {
            logEntry.style.color = 'red';
        } else if (type === 'warn') {
            logEntry.style.color = 'orange';
        } else if (type === 'network') {
            logEntry.style.color = 'blue';
        } else {
            logEntry.style.color = 'white';
        }

        // Append log entry to the container
        logContainer.appendChild(logEntry);

        // Scroll to the bottom to always show the latest log
        logContainer.scrollTop = logContainer.scrollHeight;
    }

    // Override console methods to show logs in the container
    ['log', 'warn', 'error'].forEach((method) => {
        const originalMethod = console[method];
        console[method] = function(...args) {
            appendLogMessage(args.join(' '), method);
            originalMethod.apply(console, args);
        };
    });

    // Capture errors and unhandled rejections
    window.onerror = function(message, source, lineno, colno, error) {
        appendLogMessage(`Error: ${message} at ${source}:${lineno}:${colno}`, 'error');
    };

    window.onunhandledrejection = function(event) {
        appendLogMessage(`Unhandled Promise Rejection: ${event.reason}`, 'error');
    };

    // Capture network requests (XMLHttpRequest)
    (function(open) {
        XMLHttpRequest.prototype.open = function(method, url) {
            this.addEventListener('load', function() {
                appendLogMessage(`Network Request: ${method} ${url} - Status: ${this.status}`, 'network');
            });
            open.apply(this, arguments);
        };
    })(XMLHttpRequest.prototype.open);

    // Capture network requests (fetch)
    (function(fetch) {
        window.fetch = async function(...args) {
            const response = await fetch(...args);
            appendLogMessage(`Network Request: ${args[0]} - Status: ${response.status}`, 'network');
            return response;
        };
    })(window.fetch);
}

// Initialize the logger
window.onload = () => {
    console.log('Keyboard manager and log manager initialized');
    initializeLogger();
};
