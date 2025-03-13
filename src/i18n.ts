import { register, init } from 'svelte-i18n';

register('en', () => import('./locales/en.json'));
register('cs', () => import('./locales/cs.json'));

init({
	fallbackLocale: 'en'
});
