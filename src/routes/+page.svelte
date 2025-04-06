<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import type { Project } from '$lib/types';
	import { _, locale } from 'svelte-i18n';

	let projects: Project[] = $state([]);

	$effect(() => {
		getProjects($locale).then((data) => {
			projects = data;
		});
	});

	async function getProjects(l: string | null | undefined) {
		const response = await fetch(`/api/projects?locale=${l}`);
		return await response.json();
	}
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-8 pt-16 pb-32">
		<div class="mb-64 flex w-full flex-col gap-8">
			<h3 class="text-5xl">
				{$_('home.explore')}
			</h3>
			<div class="flex flex-wrap justify-center gap-6">
				{#each projects as project}
					<a href={`/projects/${project.slug}?locale=${$locale}`} class="group">
						<div class="flex w-full max-w-[460px] min-w-[272px] flex-col gap-0.5">
							<img src={project.thumbnail} alt={project.title} class="w-full rounded-lg" />

							<div class="flex w-full items-center justify-between">
								<h4 class="text-2xl group-hover:underline">{project.title}</h4>
								<p class="font-robotomono text-sm text-neutral-400">{new Date(project.date).getFullYear()}</p>
							</div>

							<div class="flex items-center gap-2">
								{#each project.tags as tag}
									<p class="text-sm text-neutral-400">{tag}</p>
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
