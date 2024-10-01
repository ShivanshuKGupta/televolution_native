function initializeLogger() {
    // Utility function to show a log popup at the bottom of the screen
    function showLogPopup(message, type = 'log') {
        // Create the popup element
        const popup = document.createElement('div');
        popup.className = 'logPopup';
        popup.textContent = `[${type.toUpperCase()}] ${new Date().toISOString()}: ${message}`;

        // Set styles for the popup
        popup.style.position = 'fixed';
        popup.style.bottom = '20px'; // Adjust to make it float a bit above the bottom
        popup.style.left = '50%';
        popup.style.transform = 'translateX(-50%)'; // Center the popup horizontally
        popup.style.backgroundColor = 'rgba(0, 0, 0, 0.7)'; // Dark transparent background for visibility
        popup.style.color = 'white';
        popup.style.padding = '10px 20px';
        popup.style.borderRadius = '5px';
        popup.style.fontFamily = 'monospace';
        popup.style.fontSize = '14px';
        popup.style.zIndex = '10000'; // Ensure it stays on top
        popup.style.boxSizing = 'border-box';
        popup.style.pointerEvents = 'none'; // Allow interaction with the underlying application

        // Append the popup to the body
        document.body.appendChild(popup);

        // Remove the popup after 5 seconds
        setTimeout(() => {
            if (popup.parentNode) {
                document.body.removeChild(popup);
            }
        }, 5000);
    }

    // Override console methods to show popups
    ['log', 'warn', 'error'].forEach((method) => {
        const originalMethod = console[method];
        console[method] = function(...args) {
            showLogPopup(args.join(' '), method);
            originalMethod.apply(console, args);
        };
    });

    // Capture errors and unhandled rejections
    window.onerror = function(message, source, lineno, colno, error) {
        showLogPopup(`Error: ${message} at ${source}:${lineno}:${colno}`, 'error');
    };

    window.onunhandledrejection = function(event) {
        showLogPopup(`Unhandled Promise Rejection: ${event.reason}`, 'error');
    };

    // Capture network requests (XMLHttpRequest)
    (function(open) {
        XMLHttpRequest.prototype.open = function(method, url) {
            this.addEventListener('load', function() {
                showLogPopup(`Network Request: ${method} ${url} - Status: ${this.status}`, 'network');
            });
            open.apply(this, arguments);
        };
    })(XMLHttpRequest.prototype.open);

    // Capture network requests (fetch)
    (function(fetch) {
        window.fetch = async function(...args) {
            const response = await fetch(...args);
            showLogPopup(`Network Request: ${args[0]} - Status: ${response.status}`, 'network');
            return response;
        };
    })(window.fetch);
}

// Arrow key navigation and logging
function handleArrowNavigation(event) {
    // Show key pressed in the log popup
    showLogPopup(`Key pressed: ${event.key}`, 'input');

    const currentElement = document.activeElement;
    if (!currentElement || !currentElement.classList.contains('focusable')) {
        const firstFocusable = document.querySelector('.focusable');
        if (firstFocusable) {
            firstFocusable.focus();
        }
        return;
    }

    let closestElement = null;
    switch (event.key) {
        case 'ArrowDown':
        case 'ArrowRight':
        case 'ArrowUp':
        case 'ArrowLeft':
            closestElement = findClosestElement(currentElement, event.key);
            if (closestElement) {
                closestElement.focus();
            }
            break;
        case 'Backspace':
        case '461':  // LG TV specific back key
            window.history.back();
            break;
        case 'Enter':
            const clickEvent = new Event('click');
            currentElement.dispatchEvent(clickEvent);
            break;
        default:
            console.log('Unhandled key:', event.key);
            break;
    }
}

// Initialize
window.onload = () => {
    console.log('Keyboard manager and log manager initialized');
    initializeLogger();
    document.addEventListener('keydown', handleArrowNavigation);
};
