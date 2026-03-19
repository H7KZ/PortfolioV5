<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
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
</script>

<svelte:head>
	<title>Blog — Jan Komínek</title>
	<meta
		name="description"
		content="Blog by Jan Komínek — Senior Frontend Engineer. Articles on web development, DevOps, Traefik, Docker, and system architecture."
	/>
	<meta property="og:title" content="Blog — Jan Komínek" />
	<meta property="og:description" content="Articles on web development, DevOps, and system architecture by Jan Komínek." />
	<meta property="og:url" content="https://jankominek.com/blog" />
</svelte:head>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[90rem] pt-16 pb-32">
		<div class="mb-64 flex w-full flex-col gap-8">
			<h1 class="sr-only">Blog</h1>
			<div class="flex flex-wrap justify-center gap-6">
				{#each posts as post (post.slug)}
					<a href={`/blog/${post.slug}`} class="group rounded-xl bg-neutral-900 px-4 py-4">
						<div class="flex w-full max-w-[28.75rem] min-w-[17rem] flex-col gap-2">
							{#if post.thumbnail}
								<img src={post.thumbnail} alt={post.title} class="w-full rounded-lg" loading="lazy" />
							{/if}

							<h2 class="text-2xl group-hover:underline">{post.title}</h2>

							<div class="flex w-full items-center justify-between gap-1 pt-2">
								<div class="flex items-center gap-2">
									{#each post.tags as tag (tag)}
										<p class="text-sm text-neutral-400">{tag}</p>
										<p class="text-sm text-neutral-400 last:hidden">/</p>
									{/each}
								</div>
								<p class="font-robotomono text-sm text-neutral-400">
									{formatDate(post.date)}
								</p>
							</div>
						</div>
					</a>
				{/each}
			</div>
		</div>

		<ContactFooter />
	</div>
</div>
