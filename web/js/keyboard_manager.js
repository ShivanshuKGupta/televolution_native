// Gets the Euclidean distance between two elements
function getDistance(el1, el2) {
    const rect1 = el1.getBoundingClientRect();
    const rect2 = el2.getBoundingClientRect();
    const dx = rect1.left - rect2.left;
    const dy = rect1.top - rect2.top;
    return Math.sqrt(dx * dx + dy * dy);
}

// Finds the closest element in a specific direction
function findClosestElement(current, direction) {
    const focusableElements = Array.from(document.querySelectorAll('.focusable'));
    const currentRect = current.getBoundingClientRect();

    let closestElement = null;
    let minDistance = Infinity;

    focusableElements.forEach(element => {
        if (element === current) return;

        const rect = element.getBoundingClientRect();
        let valid = false;

        // Check if the element is in the correct direction
        if (direction === 'ArrowRight' && rect.left > currentRect.left) {
            valid = true;
        } else if (direction === 'ArrowLeft' && rect.right < currentRect.right) {
            valid = true;
        } else if (direction === 'ArrowUp' && rect.bottom < currentRect.bottom) {
            valid = true;
        } else if (direction === 'ArrowDown' && rect.top > currentRect.top) {
            valid = true;
        }

        if (valid) {
            const distance = getDistance(current, element);
            if (distance < minDistance) {
                minDistance = distance;
                closestElement = element;
            }
        }
    });

    return closestElement;
}

// Handle arrow key navigation based on spatial arrangement
// function handleArrowNavigation(event) {
//     const currentElement = document.activeElement;
//     if (!currentElement || !currentElement.classList.contains('focusable')) {
//         document.querySelector('.focusable').focus();
//         return;
//     }

//     switch (event.key) {
//         case 'ArrowDown':
//         case 'ArrowRight':
//         case 'ArrowUp':
//         case 'ArrowLeft':
//             const closestElement = findClosestElement(currentElement, event.key);
//             if (closestElement) {
//                 closestElement.focus();
//             }
//             break;
//         case 'Backspace':
//             window.history.back();
//             break;
//         case 'Enter':
//             const clickEvent = new Event('click');
//             currentElement.dispatchEvent(clickEvent);
//             break;
//         default:
//             console.log('Unhandled key:', event.key);
//             window.alert('Unhandled key: ' + event.key);
//             break;
//     }

// }


function handleArrowNavigation(event) {
    showPopup('Key pressed: ' + event.key + '\nKeyCode: ' + event.keyCode + '\nCode: ' + event.code);

    let inEvent = event;
    if (window.event) {
        keycode = inEvent.keyCode;
    } else if (e.which) {
        keycode = inEvent.which;
    }

    /// TODO: try to make the below swicth event as event.keyCode
    switch (keycode) {
        case 461: window.history.back(); break;
    }

    switch (event.key) {
        case 'ArrowDown':
        case 'ArrowRight':
        case 'ArrowUp':
        case 'ArrowLeft':
            const closestElement = findClosestElement(currentElement, event.key);
            if (closestElement) {
                closestElement.focus();
            }
            break;
        case 'Backspace':
            window.history.back();
            break;
        case '461':
            window.history.back();
            break;
        case '0x1CD':
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
    console.log('Keyboard manager initialized');
    document.addEventListener('keydown', handleArrowNavigation);
};

// Shows a popup window
function showPopup(message) {
    // Create a custom popup element
    const popup = document.createElement('div');
    popup.innerText = message;

    // Set the popup style
    popup.style.position = 'fixed';
    popup.style.top = '50%';
    popup.style.left = '50%';
    popup.style.transform = 'translate(-50%, -50%)';
    popup.style.padding = '20px';
    popup.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
    popup.style.color = 'white';
    popup.style.borderRadius = '10px';
    popup.style.zIndex = '1000';
    popup.style.textAlign = 'center';

    // Append popup to the body
    document.body.appendChild(popup);

    // Remove the popup after 3 seconds
    setTimeout(() => {
        document.body.removeChild(popup);
    }, 3000);

    const currentElement = document.activeElement;
    if (!currentElement || !currentElement.classList.contains('focusable')) {
        document.querySelector('.focusable').focus();
        return;
    }
}