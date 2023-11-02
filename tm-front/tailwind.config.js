/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{js,jsx,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        primary: '#EE74DA',
        secondary: '#403F4C',
        ternary: '#51E5FF',
        quaternary: '#fafafa',
        quinary: '#fafbf9'
      },
      fontFamily: {
        montserrat: ['Montserrat', 'Arial', 'sans-serif'],
        'firas-sans': ['Fira Sans', 'serif']
      }
    }
  },
  plugins: []
}
