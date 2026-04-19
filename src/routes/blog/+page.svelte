<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import { _ } from 'svelte-i18n';
	import type { Post } from '$lib/types';

	let posts: Post[] = $state([]);

	$effect(() => {
		getPosts().then((data) => {
			posts = data;
		});
	});

	async function getPosts() {
		const response = await fetch(`/api/posts`);
		return await response.json();
	}

	function formatDate(dateStr: string): string {
		return new Date(dateStr).toLocaleDateString('en-GB', { month: 'short', year: 'numeric', timeZone: 'UTC' });
	}

	function readTime(post: Post): string {
		return '8 MIN';
	}
</script>

<svelte:head>
	<title>Blog — Jan Komínek, Software Engineer</title>
	<meta name="description" content="Blog by Jan Komínek — Senior Frontend / Fullstack Engineer. Articles on web development, DevOps, Traefik, Docker, and system architecture." />
	<meta property="og:title" content="Blog — Jan Komínek, Software Engineer" />
	<meta property="og:description" content="Articles on web development, DevOps, and system architecture by Jan Komínek, Software Engineer." />
	<meta property="og:url" content="https://jankominek.com/blog" />
</svelte:head>

<div class="blog-wrap">
	<div class="blog-header">
		<div>
			<div class="mono-label">{$_('blog.writingLabel')}</div>
			<h1 class="serif blog-h1">{$_("blog.h1")}</h1>
		</div>
	</div>

	<div class="blog-list">
		{#each posts as post (post.slug)}
			<a href={`/blog/${post.slug}`} class="blog-row">
				<div class="blog-date mono">{formatDate(post.date)}</div>
				<div class="blog-content">
					<h2 class="serif blog-title">{post.title}</h2>
				</div>
				<div class="blog-tags mono">
					{#each post.tags as tag (tag)}
						<span>{tag}</span>
						<span class="tag-sep">/</span>
					{/each}
				</div>
				<div class="blog-read-time mono">{readTime(post)}</div>
			</a>
		{/each}

		<!-- Upcoming drafts -->
		<div class="blog-row draft">
			<div class="blog-date mono">{$_("blog.coming")}</div>
			<div class="blog-content">
				<h2 class="serif blog-title">Building a client-side hash-chain verifier in 200 lines of TS.</h2>
			</div>
			<div class="blog-tags mono"><span>EN</span><span class="tag-sep">/</span><span>CRYPTO</span><span class="tag-sep">/</span><span>VUE</span></div>
			<div class="blog-read-time mono">{$_('blog.draft')}</div>
		</div>
		<div class="blog-row draft">
			<div class="blog-date mono">{$_('blog.coming')}</div>
			<div class="blog-content">
				<h2 class="serif blog-title">Docker Swarm in production — 18 months of lessons from an EV platform.</h2>
			</div>
			<div class="blog-tags mono"><span>EN</span><span class="tag-sep">/</span><span>DOCKER</span><span class="tag-sep">/</span><span>INFRA</span></div>
			<div class="blog-read-time mono">{$_('blog.draft')}</div>
		</div>
	</div>

	<div class="px-footer">
		<ContactFooter />
	</div>
</div>

<style>
	.blog-wrap {
		max-width: var(--max);
		margin: 0 auto;
		padding: 0 32px;
	}
	@media (max-width: 640px) {
		.blog-wrap {
			padding: 0 20px;
		}
	}
	.px-footer {
		padding-bottom: 80px;
	}

	.blog-header {
		padding: 40px 0 20px;
		display: flex;
		justify-content: space-between;
		align-items: flex-end;
		gap: 24px;
		border-bottom: 1px solid var(--line);
		margin-bottom: 0;
	}
	.mono-label {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		margin-bottom: 6px;
	}
	.blog-h1 {
		font-size: clamp(28px, 3.5vw, 44px);
		letter-spacing: -0.02em;
		margin: 0;
		font-weight: 300;
	}

	/* ===== Blog list ===== */
	.blog-list {
		display: flex;
		flex-direction: column;
		margin-bottom: 80px;
	}
	.blog-row {
		display: grid;
		grid-template-columns: 120px 1fr auto auto;
		gap: 28px;
		padding: 24px 0;
		border-top: 1px solid var(--line);
		text-decoration: none;
		color: var(--fg);
		transition: padding-left 200ms;
		align-items: center;
	}
	.blog-row:last-child {
		border-bottom: 1px solid var(--line);
	}
	.blog-row:not(.draft):hover {
		padding-left: 10px;
	}
	.blog-row.draft {
		opacity: 0.45;
		cursor: default;
	}
	@media (max-width: 768px) {
		.blog-row {
			grid-template-columns: 1fr;
			gap: 6px;
			padding: 18px 0;
		}
	}
	.blog-date {
		font-size: 12px;
		color: var(--fg-4);
		letter-spacing: 0.04em;
	}
	.blog-title {
		font-size: 20px;
		font-weight: 300;
		letter-spacing: -0.01em;
		margin: 0;
		line-height: 1.3;
	}
	.blog-row:not(.draft):hover .blog-title {
		color: var(--fg);
	}
	.blog-tags {
		display: flex;
		gap: 4px;
		font-size: 11px;
		color: var(--fg-4);
		white-space: nowrap;
	}
	.tag-sep {
		color: var(--fg-5);
	}
	.blog-read-time {
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.04em;
		white-space: nowrap;
	}
</style>
