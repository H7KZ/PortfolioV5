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
</script>

<svelte:head>
	<title>{data.meta.title}</title>
	<meta property="og:type" content="article" />
	<meta property="og:title" content={data.meta.title} />
</svelte:head>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-360 flex-col gap-56 pt-16 pb-32">
		<article class="flex min-h-screen w-full justify-center">
			<div
				class="
                    prose
                    prose-neutral
                    prose-invert prose-code:bg-neutral-800! prose-pre:bg-neutral-800!
					prose-h1:font-semibold prose-h2:font-normal
					prose-h3:font-normal prose-h4:font-normal
					prose-h5:font-normal prose-h6:font-normal
					prose-p:font-light prose-p:text-neutral-100
					w-full max-w-270!
                "
			>
				<data.content />
			</div>
		</article>
		<ContactFooter />
	</div>
</div>
