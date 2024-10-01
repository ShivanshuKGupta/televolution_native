(function () {
    // Create and style the overlay
    const logOverlay = document.createElement('div');
    logOverlay.id = 'log-overlay';
    logOverlay.style.position = 'fixed';
    logOverlay.style.top = '0';
    logOverlay.style.right = '0';
    logOverlay.style.width = '100%';
    logOverlay.style.height = '200px';
    logOverlay.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
    logOverlay.style.color = 'white';
    logOverlay.style.overflowY = 'scroll';
    logOverlay.style.fontSize = '12px';
    logOverlay.style.zIndex = '9999';
    logOverlay.style.padding = '10px';
    logOverlay.style.boxSizing = 'border-box';
    logOverlay.style.display = 'none'; // Initially hidden
    document.body.appendChild(logOverlay);

    // Create a button to toggle the overlay visibility
    const toggleButton = document.createElement('button');
    toggleButton.innerText = 'Show Logs';
    toggleButton.style.position = 'fixed';
    toggleButton.style.bottom = '20px';
    toggleButton.style.right = '20px';
    toggleButton.style.zIndex = '10000';
    toggleButton.style.padding = '10px 20px';
    toggleButton.style.backgroundColor = '#007bff';
    toggleButton.style.color = 'white';
    toggleButton.style.border = 'none';
    toggleButton.style.borderRadius = '5px';
    toggleButton.style.cursor = 'pointer';
    document.body.appendChild(toggleButton);

    toggleButton.addEventListener('click', function () {
        if (logOverlay.style.display === 'none') {
            logOverlay.style.display = 'block';
            toggleButton.innerText = 'Hide Logs';
        } else {
            logOverlay.style.display = 'none';
            toggleButton.innerText = 'Show Logs';
        }
    });

    // Backup the original console.log function
    const originalConsoleLog = console.log;

    // Override console.log to append logs to the overlay
    console.log = function (...args) {
        // Call the original console.log
        originalConsoleLog.apply(console, args);

        // Append log messages to the overlay
        const logMessage = document.createElement('div');
        logMessage.innerText = args.map(arg => (typeof arg === 'object' ? JSON.stringify(arg) : arg)).join(' ');
        logOverlay.appendChild(logMessage);

        // Auto-scroll the overlay to the bottom
        logOverlay.scrollTop = logOverlay.scrollHeight;
    };
})();
