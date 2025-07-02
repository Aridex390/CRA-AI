module.exports = {
  parser: '@typescript-eslint/parser',
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'plugin:react-hooks/recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:prettier/recommended'
  ],
  plugins: ['react', '@typescript-eslint', 'react-hooks'],
  env: {
    browser: true,
    es2021: true,
    node: true
  },
  settings: {
    react: { version: 'detect' }
  },
  rules: {
    'react/prop-types': 'off',
    '@typescript-eslint/no-unused-vars': ['warn'],
    'prettier/prettier': ['error']
  }
};
