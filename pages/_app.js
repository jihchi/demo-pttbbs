import { setup } from 'twind';

export { default } from 'src/App.js';

setup({
  theme: {
    fontSize: {
      xs: '.75rem',
      sm: '.875rem',
      base: '1rem',
      lg: '1.125rem',
      xl: '1.25rem',
      '2xl': '1.5rem',
      '3xl': '1.875rem',
      '4xl': '2.25rem',
      '5xl': '3rem',
      '6xl': '4rem',
    },
    fontFamily: {
      sans: [
        '-apple-system',
        'BlinkMacSystemFont',
        'Helvetica Neue',
        'Arial',
        'sans-serif',
      ],
      serif: [
        'Georgia',
        '-apple-system',
        'BlinkMacSystemFont',
        'Helvetica Neue',
        'Arial',
        'sans-serif',
      ],
      mono: [
        'Menlo',
        'Monaco',
        'Consolas',
        'Roboto Mono',
        'SFMono-Regular',
        'Segoe UI',
        'Courier',
        'monospace',
      ],
    },
  },
});
