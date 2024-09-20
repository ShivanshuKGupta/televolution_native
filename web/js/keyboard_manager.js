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
function handleArrowNavigation(event) {
    const currentElement = document.activeElement;
    if (!currentElement || !currentElement.classList.contains('focusable')) {
        document.querySelector('.focusable').focus();
        return;
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
        case 'Enter':
            const clickEvent = new Event('click');
            currentElement.dispatchEvent(clickEvent);
            break;
    }

}

// Initialize
window.onload = () => {
    console.log('Keyboard manager initialized');
    document.addEventListener('keydown', handleArrowNavigation);
};