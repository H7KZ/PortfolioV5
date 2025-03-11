module.exports = {
	purge: ['./src/**/*.svelte', './src/**/*.css'],

	darkMode: false,

	theme: {
		extend: {
			colors: {
				primary: '#FFFFFF',
                secondary: '#A4A4A4'
			},
			fontFamily: {
				dmsans: ['DM Sans', 'sans-serif']
			},
			screens: {
				xxs: '384px',
				xs: '512px'
			}
		}
	},

	plugins: [],
}
