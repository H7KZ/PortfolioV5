<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import type { Project } from '$lib/types';
	import { onMount } from 'svelte';
	import { _ } from 'svelte-i18n';

	let projects: Project[] = [];

	onMount(async () => {
		const response = await fetch('/api/projects');
		projects = await response.json();
	});
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-24 pt-16 pb-32">
		<div class="flex w-full flex-col gap-8">
			<h3 class="text-5xl">
				{$_('home.explore')}
			</h3>
			<div class="flex flex-wrap gap-4">
				{#each projects as project}
					<a href={`/projects/${project.slug}`}>
						<div class="flex w-full max-w-[460px] min-w-[280px] flex-col gap-0.5">
							<img src={project.image} alt={project.title} class="w-full rounded-lg" />
							<h4 class="text-2xl">{project.title}</h4>
							<div class="flex items-center gap-2">
								{#each project.tags as tag}
									<p class="text-sm text-neutral-400">{$_(tag)}</p>
									<p class="text-sm text-neutral-400 last:hidden">/</p>
								{/each}
							</div>
						</div>
					</a>
				{/each}
			</div>
		</div>

		<ContactFooter />
	</div>
</div>
