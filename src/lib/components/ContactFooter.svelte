<script lang="ts">
	import { _, locale } from 'svelte-i18n';
	import JanKominekName from '$lib/icons/JanKominekName.svelte';
</script>

<div class="footer-wrap">
	<div class="footer-inner">
		<div>
			<div class="mono-label">◆ {$_('footer.contactMe')}</div>
			<h2 class="footer-heading">
				{#if $locale === 'cs'}
					Probereme <span class="footer-pill">Napišme si →</span> vaši vizi.
				{:else}
					Let's discuss your<br />vision <span class="footer-pill">Let's talk →</span> with me.
				{/if}
			</h2>
			<div class="footer-links">
				<a href="mailto:contact@jankominek.com">{$_('footer.email')}</a>
				<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" rel="noopener noreferrer">{$_('footer.linkedin')} ↗</a>
				<a href="/contact">{$_('footer.form')} ↗</a>
				<a href="/contact#calendar">{$_('footer.calendar')} ↗</a>
			</div>
		</div>
		<JanKominekName class="signature" aria-hidden="true" />
	</div>
</div>

<style>
	.footer-wrap {
		margin-top: 120px;
		padding-bottom: 48px;
	}
	.footer-inner {
		border: 1px solid var(--line);
		border-radius: var(--radius-lg);
		background: linear-gradient(135deg, var(--bg-2), var(--bg));
		padding: 48px 40px;
		display: grid;
		grid-template-columns: 1fr auto;
		gap: 40px;
		align-items: center;
	}
	@media (max-width: 768px) {
		.footer-inner {
			grid-template-columns: 1fr;
			padding: 32px 24px;
		}
	}
	.mono-label {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		margin-bottom: 12px;
	}
	.footer-heading {
		font-family: var(--font-serif);
		font-weight: 300;
		font-size: clamp(26px, 4vw, 40px);
		margin: 0 0 24px;
		letter-spacing: -0.02em;
		line-height: 1.15;
		color: var(--fg);
	}
	.footer-pill {
		display: inline-flex;
		align-items: center;
		background: var(--fg);
		color: var(--bg);
		font-size: 0.5em;
		padding: 6px 14px;
		border-radius: 999px;
		vertical-align: middle;
		margin: 0 4px;
		font-family: var(--font-sans);
		font-weight: 500;
		letter-spacing: 0;
		position: relative;
		top: -0.1em;
	}
	.footer-links {
		display: flex;
		flex-wrap: wrap;
		gap: 8px 20px;
		font-family: var(--font-mono);
		font-size: 12px;
	}
	.footer-links a {
		color: var(--fg-3);
		text-decoration: none;
		transition: color 200ms;
	}
	.footer-links a:hover {
		color: var(--accent);
	}
	:global(.signature) {
		width: 180px;
		height: auto;
		color: var(--fg-4);
		opacity: 0.7;
		transform: rotate(-3deg);
		flex-shrink: 0;
	}
	@media (max-width: 768px) {
		:global(.signature) {
			display: none;
		}
	}
</style>
