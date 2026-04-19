<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import { page } from '$app/state';

	let menuOpen = $state(false);
</script>

<div class="nav">
	<div class="nav-inner">
		<a href="/" class="logo-mark" aria-label="Jan Komínek — Home" onclick={() => (menuOpen = false)}>J</a>

		<div class="nav-right">
			<a href="/contact" class="btn-hire" onclick={() => (menuOpen = false)}>
				<span class="dot"></span>
				{$_('navbar.hire')}
			</a>
			<button class="menu-btn" onclick={() => (menuOpen = !menuOpen)} aria-label="Toggle menu" aria-expanded={menuOpen}>
				{#if menuOpen}
					<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
						<path d="M18 6L6 18M6 6l12 12" />
					</svg>
				{:else}
					<svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
						<path d="M3 12h18M3 6h18M3 18h18" />
					</svg>
				{/if}
			</button>
		</div>
	</div>

	{#if menuOpen}
		<div class="mobile-menu">
			<a href="/" class:active={page.url.pathname === '/'} onclick={() => (menuOpen = false)}>Work</a>
			<a href="/resume" class:active={page.url.pathname === '/resume'} onclick={() => (menuOpen = false)}>Resumé</a>
			<a href="/blog" class:active={page.url.pathname.startsWith('/blog')} onclick={() => (menuOpen = false)}>Blog</a>
			<div class="menu-divider"></div>
			<button
				class="lang-toggle"
				onclick={() => {
					const all = $locales ?? ['en', 'cs'];
					const idx = all.indexOf($locale ?? 'en');
					locale.set(all[(idx + 1) % all.length]);
					menuOpen = false;
				}}
			>
				{($locale ?? 'en').toUpperCase()} / {(($locales ?? ['en', 'cs']).find((l) => l !== ($locale ?? 'en')) ?? 'cs').toUpperCase()}
			</button>
		</div>
	{/if}
</div>

<style>
	.nav {
		position: sticky;
		top: 0;
		z-index: 40;
		background: color-mix(in srgb, var(--bg) 92%, transparent);
		backdrop-filter: blur(14px);
		border-bottom: 1px solid var(--line);
	}
	.nav-inner {
		padding: 14px 20px;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	.logo-mark {
		width: 36px;
		height: 36px;
		display: grid;
		place-items: center;
		border: 1px solid var(--line-2);
		border-radius: 50%;
		font-family: var(--font-serif);
		font-size: 20px;
		font-weight: 400;
		color: var(--fg);
		text-decoration: none;
		transition: border-color 200ms;
	}
	.nav-right {
		display: flex;
		align-items: center;
		gap: 12px;
	}
	.btn-hire {
		padding: 7px 14px;
		border: 1px solid var(--line-2);
		border-radius: 999px;
		font-size: 12px;
		display: inline-flex;
		align-items: center;
		gap: 7px;
		color: var(--fg);
		text-decoration: none;
		transition: all 200ms;
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
	.menu-btn {
		background: none;
		border: none;
		cursor: pointer;
		color: var(--fg-2);
		padding: 4px;
		display: grid;
		place-items: center;
		border-radius: 6px;
		transition: color 150ms;
	}
	.menu-btn:hover {
		color: var(--fg);
	}
	.mobile-menu {
		padding: 8px 20px 20px;
		display: flex;
		flex-direction: column;
		gap: 4px;
	}
	.mobile-menu a {
		font-size: 15px;
		color: var(--fg-2);
		text-decoration: none;
		padding: 10px 0;
		border-bottom: 1px solid var(--line);
		transition: color 150ms;
	}
	.mobile-menu a:hover,
	.mobile-menu a.active {
		color: var(--fg);
	}
	.menu-divider {
		height: 1px;
		background: var(--line);
		margin: 8px 0;
	}
	.lang-toggle {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.08em;
		background: none;
		border: none;
		cursor: pointer;
		padding: 8px 0;
		text-align: left;
		transition: color 150ms;
	}
	.lang-toggle:hover {
		color: var(--fg);
	}
</style>
