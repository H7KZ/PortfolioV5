<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import { page } from '$app/state';
</script>

<div class="nav">
	<div class="nav-inner">
		<a href="/" class="logo-mark" aria-label="Jan Komínek — Home">J</a>

		<div class="nav-links">
			<a href="/" class:active={page.url.pathname === '/'} aria-current={page.url.pathname === '/' ? 'page' : undefined}>
				{$_('navbar.work')}
			</a>
			<a href="/resume" class:active={page.url.pathname === '/resume'} aria-current={page.url.pathname === '/resume' ? 'page' : undefined}>
				{$_('navbar.resume')}
			</a>
			<a href="/blog" class:active={page.url.pathname.startsWith('/blog')} aria-current={page.url.pathname.startsWith('/blog') ? 'page' : undefined}>
				{$_('navbar.blog')}
			</a>
			<a href="/contact" class="btn-hire">
				<span class="dot"></span>
				{$_('navbar.hire')}
			</a>
			<button
				class="lang-toggle"
				onclick={() => {
					const all = $locales ?? ['en', 'cs'];
					const idx = all.indexOf($locale ?? 'en');
					locale.set(all[(idx + 1) % all.length]);
				}}
				aria-label="Toggle language"
			>
				{($locale ?? 'en').toUpperCase()}
			</button>
		</div>
	</div>
</div>

<style>
	.nav {
		position: sticky;
		top: 0;
		z-index: 40;
		background: color-mix(in srgb, var(--bg) 85%, transparent);
		backdrop-filter: blur(14px);
		border-bottom: 1px solid var(--line);
	}
	.nav-inner {
		max-width: var(--max);
		margin: 0 auto;
		padding: 16px 32px;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.logo-mark {
		width: 38px;
		height: 38px;
		display: grid;
		place-items: center;
		border: 1px solid var(--line-2);
		border-radius: 50%;
		font-family: var(--font-serif);
		font-size: 22px;
		font-weight: 400;
		color: var(--fg);
		text-decoration: none;
		transition: border-color 200ms;
	}
	.logo-mark:hover {
		border-color: var(--fg-3);
	}
	.nav-links {
		display: flex;
		align-items: center;
		gap: 28px;
	}
	.nav-links a {
		font-size: 14px;
		color: var(--fg-2);
		text-decoration: none;
		transition: color 200ms;
	}
	.nav-links a:hover {
		color: var(--fg);
	}
	.nav-links a.active {
		color: var(--fg);
	}
	.nav-links a.active::after {
		content: '';
		display: block;
		height: 1px;
		margin-top: 3px;
		background: var(--fg);
		opacity: 0.4;
	}
	.btn-hire {
		padding: 8px 18px;
		border: 1px solid var(--line-2);
		border-radius: 999px;
		font-size: 13px;
		display: inline-flex;
		align-items: center;
		gap: 8px;
		transition: all 200ms;
	}
	.btn-hire:hover {
		border-color: var(--accent) !important;
		color: var(--accent) !important;
	}
	.btn-hire::after {
		display: none !important;
	}
	.dot {
		width: 6px;
		height: 6px;
		border-radius: 50%;
		background: var(--accent);
		box-shadow: 0 0 10px var(--accent);
		flex-shrink: 0;
		animation: dot-pulse 2.4s ease-in-out infinite;
	}
	.lang-toggle {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-3);
		padding: 6px 10px;
		border-radius: 6px;
		letter-spacing: 0.08em;
		background: none;
		border: none;
		cursor: pointer;
		transition: all 150ms;
	}
	.lang-toggle:hover {
		color: var(--fg);
		background: var(--bg-3);
	}
</style>
