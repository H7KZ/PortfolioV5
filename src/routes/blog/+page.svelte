<script lang="ts">
	import type { Post } from '$lib/types';
	import { _, locale } from 'svelte-i18n';

	let posts: Post[] = $state([]);

	$effect(() => {
		getPosts($locale).then((data) => {
			posts = data;
		});
	});

	async function getPosts(l: string | null | undefined) {
		const response = await fetch(`/api/posts?locale=${l}`);
		return await response.json();
	}
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[90rem] pt-16 pb-32">
		<h2>Come back later! ~ &nbsp;&nbsp;&nbsp;&nbsp; ;)</h2>
	</div>
</div>
