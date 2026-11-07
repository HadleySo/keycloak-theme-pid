
(function () {
    const root = document.documentElement;

    function initializeThemeToggle() {
        const toggle = document.getElementById('theme-toggle');
        const moon = document.getElementById('moon-icon');
        const sun = document.getElementById('sun-icon');

        if (!toggle || !moon || !sun) return;

        function applyTheme(theme) {
            root.setAttribute('data-theme', theme);

            try {
                localStorage.setItem('mode-theme', theme);
            } catch (e) {}

            const isDark = theme === 'dark';

            moon.style.display = isDark ? 'none' : 'block';
            sun.style.display = isDark ? 'block' : 'none';

            toggle.setAttribute(
                'aria-label',
                isDark ? 'Switch to light mode' : 'Switch to dark mode'
            );

            toggle.setAttribute(
                'title',
                isDark ? 'Switch to light mode' : 'Switch to dark mode'
            );
        }

        let savedTheme = null;

        try {
            savedTheme = localStorage.getItem('mode-theme');
        } catch (e) {}

        const initialTheme = savedTheme ||
            (window.matchMedia &&
             window.matchMedia('(prefers-color-scheme: dark)').matches
                ? 'dark'
                : 'light');

        applyTheme(initialTheme);

        toggle.addEventListener('click', function () {
            const currentTheme = root.getAttribute('data-theme');

            applyTheme(currentTheme === 'dark' ? 'light' : 'dark');
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initializeThemeToggle);
    } else {
        initializeThemeToggle();
    }
})();
