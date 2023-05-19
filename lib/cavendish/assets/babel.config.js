module.exports = (api) => {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      ['module-resolver', {
        alias: {
          '@': `${__dirname}/src`,
          assets: `${__dirname}/assets`,
        },
        extensions: ['.js', '.ts', '.json', '.jsx', '.tsx', '.d.ts'],
      }],
    ],
  };
};
