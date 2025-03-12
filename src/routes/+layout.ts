import '../i18n';
import { locale, waitLocale } from 'svelte-i18n';
import type { LayoutLoad } from './$types';
import { browser } from '$app/environment';

export const load: LayoutLoad = async () => {
	if (browser) locale.set(window.navigator.language);

	await waitLocale();
};
