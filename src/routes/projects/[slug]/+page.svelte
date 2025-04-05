<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';

	let { data } = $props();
</script>

<svelte:head>
	<title>{data.meta.title}</title>
	<meta property="og:type" content="article" />
	<meta property="og:title" content={data.meta.title} />
</svelte:head>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-24 pt-16 pb-32">
		<article class="flex min-h-screen w-full justify-center">
			<div
				class="
                    prose prose-neutral
                    prose-invert prose-code:!bg-neutral-800 prose-pre:!bg-neutral-800
                    w-full
                    !max-w-[1080px]
                "
			>
				<data.content />
			</div>
		</article>
		<ContactFooter />
	</div>
</div>
