<script lang="ts">
	import { _, json } from 'svelte-i18n';
	import ContactFooter from '$lib/components/ContactFooter.svelte';

	interface Experience {
		company: string;
		position: string;
	}

	interface Education {
		school: string;
		degree: string;
	}

	const about = $derived(($json('resume.about') as string[]) || []);
	const experiences = $derived(($json('resume.experience') as Experience[]) || []);
	const educations = $derived(($json('resume.education') as Education[]) || []);
	const tools = $derived(($json('resume.tools') as string[]) || []);
</script>

<svelte:head>
	<title>Resumé — Jan Komínek, Senior Frontend Engineer</title>
	<meta
		name="description"
		content="Resumé of Jan Komínek — Senior Frontend / Fullstack Engineer based in Prague. Vue.js, React.js, TypeScript, Node.js, Docker. Available for part-time B2B contracts."
	/>
	<meta property="og:title" content="Resumé — Jan Komínek, Senior Frontend Engineer" />
	<meta property="og:description" content="Resumé of Jan Komínek — Senior Frontend / Fullstack Engineer. Vue.js, React.js, TypeScript, Node.js." />
	<meta property="og:url" content="https://jankominek.com/resume" />
</svelte:head>

<div class="flex w-full flex-col items-center justify-center">
	<div class="flex w-full max-w-[90rem] flex-col gap-32 px-8 pt-16 pb-32 min-[90rem]:px-2">
		<div class="flex w-full justify-between gap-20">
			<img src="/images/resume_profile.webp" alt="Jan Komínek, portrait" class="hidden h-full lg:block lg:w-80 xl:w-md" />
			<div class="flex w-full flex-col gap-12">
				<h1 class="xs:text-6xl text-5xl font-normal">
					{$_('resume.jankominek')}
				</h1>
				<div class="flex w-full flex-col gap-1">
					<p class="text-sm text-neutral-500">
						{$_('resume.quickSummaryLabel')}
					</p>
					<p>
						{$_('resume.quickSummary')}
					</p>
				</div>
				<a
					href="/files/Jan_Kominek_Resume.pdf"
					download
					class="flex w-fit items-center gap-2 rounded-full border border-neutral-700 px-5 py-2.5 text-sm transition-colors hover:border-neutral-400 hover:text-white"
				>
					{$_('resume.download')}
				</a>
			</div>
		</div>
	</div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[90rem] flex-col gap-32 px-8 py-24 min-[90rem]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.aboutLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each about as paragraph, i (i)}
						<p>
							{paragraph}
						</p>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[90rem] flex-col gap-32 px-8 py-16 min-[90rem]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.experienceLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each experiences as experience, i (i)}
						<div class="flex w-full flex-col gap-1">
							<p class="font-medium">
								{experience.company}
							</p>
							<p class="text-neutral-500">
								{experience.position}
							</p>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[90rem] flex-col gap-32 px-8 py-16 min-[90rem]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.educationLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each educations as education, i (i)}
						<div class="flex w-full flex-col gap-1">
							<p class="font-medium">
								{education.school}
							</p>
							<p class="text-neutral-500">
								{education.degree}
							</p>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[90rem] flex-col gap-32 px-8 pt-24 pb-32 min-[90rem]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.toolsLabel')}
				</h2>
				<div class="flex w-full flex-wrap gap-1">
					{#each tools as tool (tool)}
						<p class="text-neutral-500" class:text-white={tool.startsWith('!')}>
							{tool.replace('!', '')}
						</p>
						<p class="text-neutral-500 last:hidden">/</p>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="flex w-full items-center justify-center px-8">
		<div class="w-full max-w-[90rem] pt-16 pb-32">
			<ContactFooter />
		</div>
	</div>
</div>
