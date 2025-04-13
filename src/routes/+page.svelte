<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import GreenAvailability from '$lib/icons/GreenAvailability.svelte';
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
	<div class="flex w-full max-w-[90rem] flex-col gap-8 pb-32">
		<div
			class="flex h-full min-h-[calc(100vh-88px)] w-full flex-col-reverse items-center justify-center gap-20 sm:min-h-[calc(100vh-96px)] lg:min-h-[calc(100vh-104px)] lg:flex-row lg:justify-between lg:gap-2"
		>
			<div class="flex shrink-0 flex-col-reverse justify-center gap-8 pb-16 lg:h-full lg:w-auto lg:flex-col lg:gap-48 lg:pb-0">
				<div class="flex flex-col gap-1">
					<div class="flex flex-wrap gap-x-2 gap-y-0.5 text-lg font-normal text-neutral-100 sm:gap-x-6 xl:text-xl">
						<h3>
							{$_('home.fullstack')}
						</h3>
						<h3>/</h3>
						<h3>
							{$_('home.freelance')}
						</h3>
						<h3>/</h3>
						<h3>
							{$_('home.prague')}
						</h3>
					</div>
					<p class="text-sm text-neutral-400 xl:text-base">
						{$_('home.motto')}
					</p>
				</div>
				<div class="flex shrink-0 flex-col gap-4">
					<h1 class="text-5xl font-normal lg:text-7xl xl:text-8xl">
						{$_('home.jankominek')}
					</h1>
					<div class="flex items-center gap-3 pl-3">
						<GreenAvailability class="w-6 animate-pulse [animation-duration:3000ms]" />
						<div class="flex items-center gap-2 text-xs md:text-sm lg:text-base">
							<p>
								{$_('home.available')}
							</p>
							<p>–</p>
							<a href="/contact#calendar" class="underline transition-all hover:text-neutral-400">
								{$_('home.bookACall')}
							</a>
						</div>
					</div>
				</div>
			</div>
			<img src="/images/profile.webp" alt="Profile" class="w-full max-w-[24rem] pt-16 lg:max-w-[30rem] lg:pt-0 lg:pr-2 xl:max-w-[38rem]" />
		</div>

		<div class="mb-64 flex w-full flex-col gap-8">
			<div class="flex flex-wrap justify-center gap-6">
				<h3 class="w-full max-w-[28.75rem] min-w-[17rem] text-5xl">
					{$_('home.explore')}
				</h3>
				{#each projects as project}
					<a href={`/projects/${project.slug}?locale=${$locale}`} class="group">
						<div class="flex w-full max-w-[28.75rem] min-w-[17rem] flex-col gap-0.5">
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
