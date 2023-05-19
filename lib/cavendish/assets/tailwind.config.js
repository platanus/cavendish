module.exports = {
  content: [
    './src/**/*.{js,jsx,ts,tsx}',
    'App.{js,jsx,ts,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
  // eslint-disable-next-line global-require
  corePlugins: require('tailwind-rn/unsupported-core-plugins'),
};
