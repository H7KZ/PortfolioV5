<script lang="ts">
	import { browser } from '$app/environment';
	import { goto } from '$app/navigation';
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import { locale } from 'svelte-i18n';
	import type { ProjectData } from './+page';

	let { data }: { data: ProjectData } = $props();

	$effect(() => {
		const loc = $locale;
		if (loc && loc !== data.locale && browser) {
			goto(`/projects/${data.slug}?locale=${loc}`, { invalidateAll: true });
		}
	});

	function formatDate(dateStr: string): string {
		return new Date(dateStr).toLocaleDateString('en-GB', { month: 'long', year: 'numeric', timeZone: 'UTC' });
	}
</script>

<svelte:head>
	<title>{data.meta.title} — Jan Komínek</title>
	<meta property="og:type" content="article" />
	<meta property="og:title" content={data.meta.title} />
	<meta property="og:description" content={data.meta.tags?.join(', ')} />
	<meta property="og:url" content={`https://jankominek.com/projects/${data.slug}`} />
	<meta property="og:image" content={data.meta.thumbnail} />
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content={data.meta.title} />
	<meta name="twitter:image" content={data.meta.thumbnail} />
</svelte:head>

<div class="project-wrap">
	<div class="project-inner">
		<a href="/" class="back-link mono">← Work</a>

		<header class="project-header">
			<div class="project-meta">
				{#each data.meta.tags as tag (tag)}
					<span class="chip">{tag}</span>
				{/each}
				<span class="project-year mono">{formatDate(data.meta.date)}</span>
			</div>
			<h1 class="serif project-title">{data.meta.title}</h1>
		</header>

		{#if data.meta.thumbnail}
			<div class="project-hero">
				<img src={data.meta.thumbnail} alt={data.meta.title} />
			</div>
		{/if}

		<article class="project-prose prose prose-neutral prose-invert prose-code:bg-neutral-800! prose-pre:bg-neutral-800! w-full">
			<data.content />
		</article>

		<ContactFooter />
	</div>
</div>

<style>
	.project-wrap {
		max-width: var(--max);
		margin: 0 auto;
		padding: 0 32px;
	}
	@media (max-width: 640px) {
		.project-wrap {
			padding: 0 20px;
		}
	}
	.project-inner {
		max-width: 800px;
		margin: 0 auto;
		padding-top: 40px;
	}
	.back-link {
		font-size: 12px;
		color: var(--fg-4);
		text-decoration: none;
		letter-spacing: 0.06em;
		transition: color 150ms;
		display: inline-block;
		margin-bottom: 32px;
	}
	.back-link:hover {
		color: var(--fg);
	}
	.project-header {
		margin-bottom: 32px;
	}
	.project-meta {
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		gap: 6px;
		margin-bottom: 16px;
	}
	.project-year {
		font-size: 11px;
		color: var(--fg-4);
		margin-left: 4px;
	}
	.project-title {
		font-size: clamp(28px, 5vw, 48px);
		letter-spacing: -0.025em;
		margin: 0;
		line-height: 1.1;
		color: var(--fg);
	}
	.project-hero {
		margin-bottom: 48px;
		border-radius: var(--radius-lg);
		overflow: hidden;
		border: 1px solid var(--line);
	}
	.project-hero img {
		width: 100%;
		height: auto;
		display: block;
	}
	.project-prose {
		color: var(--fg-2);
		font-size: 16px;
		line-height: 1.7;
	}
	.project-prose :global(h1),
	.project-prose :global(h2),
	.project-prose :global(h3),
	.project-prose :global(h4) {
		color: var(--fg);
		font-family: var(--font-serif);
		font-weight: 300;
		letter-spacing: -0.02em;
	}
	.project-prose :global(p) {
		color: var(--fg-2);
	}
	.project-prose :global(a) {
		color: var(--accent);
		text-decoration-color: var(--accent-ring);
	}
	.project-prose :global(a:hover) {
		text-decoration-color: var(--accent);
	}
	.project-prose :global(hr) {
		border-color: var(--line);
	}
	.project-prose :global(blockquote) {
		border-left-color: var(--accent-ring);
		color: var(--fg-3);
	}
	.project-prose :global(pre),
	.project-prose :global(code) {
		background: var(--bg-3) !important;
		border: 1px solid var(--line);
	}
	.project-prose :global(img) {
		border-radius: var(--radius);
		border: 1px solid var(--line);
	}
	.project-prose :global(table th) {
		color: var(--fg);
		border-color: var(--line-2);
	}
	.project-prose :global(table td) {
		border-color: var(--line);
	}
	/* Inline Tailwind classes used inside MDSvex content */
	.project-prose :global(.bg-neutral-900) {
		background: var(--bg-2) !important;
		border: 1px solid var(--line);
		border-radius: var(--radius-lg);
	}
</style>
