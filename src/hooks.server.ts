import type { Handle } from '@sveltejs/kit';

// Cal.com loads embed.js from app.cal.com and renders an iframe from cal.com.
// Google Fonts CSS is fetched from fonts.googleapis.com; font files from fonts.gstatic.com.
// SvelteKit injects inline scripts for hydration, so 'unsafe-inline' is required in script-src
// until nonce-based CSP is adopted via config.kit.csp in svelte.config.js.
const CSP = [
	"default-src 'self'",
	"script-src 'self' 'unsafe-inline' https://app.cal.com",
	"style-src 'self' 'unsafe-inline' https://fonts.googleapis.com",
	"font-src 'self' https://fonts.gstatic.com",
	"img-src 'self' data: https:",
	"connect-src 'self' https://app.cal.com https://cal.com",
	"frame-src https://app.cal.com https://cal.com",
	"object-src 'none'",
	"base-uri 'self'",
	"form-action 'self'",
	"frame-ancestors 'none'",
	'upgrade-insecure-requests'
].join('; ');

export const handle: Handle = async ({ event, resolve }) => {
	const response = await resolve(event);

	response.headers.set('Content-Security-Policy', CSP);
	response.headers.set('X-Content-Type-Options', 'nosniff');
	// DENY is stricter than SAMEORIGIN; frame-ancestors 'none' in CSP covers modern browsers
	response.headers.set('X-Frame-Options', 'DENY');
	// Explicitly disable the broken legacy XSS auditor (0 = disabled)
	response.headers.set('X-XSS-Protection', '0');
	response.headers.set('Referrer-Policy', 'strict-origin-when-cross-origin');
	response.headers.set(
		'Permissions-Policy',
		'camera=(), microphone=(), geolocation=(), interest-cohort=()'
	);
	response.headers.set('Cross-Origin-Opener-Policy', 'same-origin');
	response.headers.set('Cross-Origin-Resource-Policy', 'same-origin');

	return response;
};
