<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import { _, locale } from 'svelte-i18n';
	import type { PostData } from './+page';

	let { data }: { data: PostData } = $props();
</script>

<svelte:head>
	<title>{data.meta.title}</title>
	<meta property="og:type" content="article" />
	<meta property="og:title" content={data.meta.title} />
</svelte:head>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[90rem] flex-col gap-56 pt-16 pb-32">
		<article class="flex min-h-screen w-full justify-center">
			<div
				class="
                    prose
                    prose-neutral
                    prose-invert prose-code:!bg-neutral-800 prose-pre:!bg-neutral-800
					prose-h1:font-semibold prose-h2:font-normal
					prose-h3:font-normal prose-h4:font-normal
					prose-h5:font-normal prose-h6:font-normal
					prose-h1:text-5xl prose-h2:text-4xl
					prose-h3:text-3xl prose-h4:text-2xl
					prose-h5:text-xl prose-h6:text-lg
					prose-p:font-light prose-p:text-neutral-100
					w-full !max-w-[67.5rem]
                "
			>
				<data.content />
			</div>
		</article>
		<ContactFooter />
	</div>
</div>
